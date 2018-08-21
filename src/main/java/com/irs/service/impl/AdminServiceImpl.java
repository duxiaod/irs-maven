package com.irs.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.irs.mapper.AdminMenusMapper;
import com.irs.mapper.TbAdminMapper;
import com.irs.mapper.TbMenusMapper;
import com.irs.mapper.TbRolesMapper;
import com.irs.mapper.TbRolesMenusMapper;
import com.irs.pojo.Menu;
import com.irs.pojo.TbAdmin;
import com.irs.pojo.TbAdminExample;
import com.irs.pojo.TbAdminExample.Criteria;
import com.irs.pojo.TbMenus;
import com.irs.pojo.TbMenusExample;
import com.irs.pojo.TbRoles;
import com.irs.pojo.TbRolesExample;
import com.irs.pojo.TbRolesMenusExample;
import com.irs.pojo.TbRolesMenusKey;
import com.irs.pojo.XtreeData;
import com.irs.service.AdminService;
import com.irs.util.ResultUtil;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private TbAdminMapper adminMapper;

	@Autowired
	private TbRolesMapper tbRolesMapper;

	@Autowired
	private TbAdminMapper tbAdminMapper;

	@Autowired
	private TbRolesMenusMapper tbRolesMenusMapper;

	@Autowired
	private AdminMenusMapper adminMenusMapper;

	@Autowired
	private TbMenusMapper tbMenusMapper;

	/**
	 * 管理员登陆
	 */
	@Override
	public TbAdmin login(String username, String password) {
		//对密码加密
		password=DigestUtils.md5DigestAsHex(password.getBytes());
		TbAdminExample example = new TbAdminExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		criteria.andPasswordEqualTo(password);
		List<TbAdmin> admin = adminMapper.selectByExample(example);
		if (admin != null && admin.size() > 0) {
			return admin.get(0);
		}
		return null;
	}

	@Override
	public ResultUtil selRoles(Integer page, Integer limit) {
		PageHelper.startPage(page, limit);
		TbRolesExample example = new TbRolesExample();
		List<TbRoles> list = tbRolesMapper.selectByExample(example);
		PageInfo<TbRoles> pageInfo = new PageInfo<TbRoles>(list);
		ResultUtil resultUtil = new ResultUtil();
		resultUtil.setCode(0);
		resultUtil.setCount(pageInfo.getTotal());
		resultUtil.setData(pageInfo.getList());
		return resultUtil;
	}

	@Override
	public ResultUtil selAdmins(Integer page, Integer limit) {
		PageHelper.startPage(page, limit);
		TbAdminExample example = new TbAdminExample();
		List<TbAdmin> list = tbAdminMapper.selectByExample(example);
		// 将roleName写进TbAdmin
		for (TbAdmin tbAdmin : list) {
			// tbAdmin.setRoleName();
			List<TbRoles> roles = selRoles();
			for (TbRoles tbRole : roles) {
				if (tbRole.getRoleId() == tbAdmin.getRoleId()) {
					tbAdmin.setRoleName(tbRole.getRoleName());
				}
			}
		}
		PageInfo<TbAdmin> pageInfo = new PageInfo<TbAdmin>(list);
		ResultUtil resultUtil = new ResultUtil();
		resultUtil.setCode(0);
		resultUtil.setCount(pageInfo.getTotal());
		resultUtil.setData(pageInfo.getList());
		return resultUtil;
	}

	@Override
	public List<TbRoles> selRoles() {
		TbRolesExample example = new TbRolesExample();
		List<TbRoles> list = tbRolesMapper.selectByExample(example);
		return list;
	}

	@Override
	public List<Menu> selMenus(TbAdmin admin) {
		List<Menu> results = new ArrayList<>();
		Long roleId = admin.getRoleId();
		TbRolesMenusExample example = new TbRolesMenusExample();
		com.irs.pojo.TbRolesMenusExample.Criteria criteria = example.createCriteria();
		criteria.andRoleIdEqualTo(roleId);
		List<TbRolesMenusKey> list = tbRolesMenusMapper.selectByExample(example);
		if (list != null && list.size() > 0) {
			List<TbMenus> menus = adminMenusMapper.getMenus(roleId);
			for (int i = 0; i < menus.size(); i++) {
				if (menus.get(i).getParentId() == 0) {
					Menu menu = new Menu();
					menu.setTitle(menus.get(i).getTitle());
					menu.setIcon(menus.get(i).getIcon());
					menu.setHref(menus.get(i).getHref());
					menu.setSpread(menus.get(i).getSpread());
					List<Menu> menus2 = new ArrayList<>();
					for (int j = 0; j < menus.size(); j++) {
						if (menus.get(j).getParentId() == menus.get(i).getMenuId()) {
							Menu menu2 = new Menu();
							menu2.setTitle(menus.get(j).getTitle());
							menu2.setIcon(menus.get(j).getIcon());
							menu2.setHref(menus.get(j).getHref());
							menu2.setSpread(menus.get(j).getSpread());
							menus2.add(menu2);
						}
					}
					menu.setChildren(menus2);
					results.add(menu);
				}
			}
		}
		return results;
	}
	
	/**
	 * 获取菜单树（指定角色的设置选中）
	 */
	@Override
	public List<XtreeData> selXtreeData(TbAdmin admin) {
		List<TbMenus> menus = adminMenusMapper.getMenus(admin.getRoleId());//获取指定角色的菜单
		//所有菜单
		TbMenusExample example = new TbMenusExample();
		example.setOrderByClause("sorting DESC");
		List<TbMenus> allMenus = tbMenusMapper.selectByExample(example);
		//根节点
	    List<XtreeData> rootMenu = new ArrayList<XtreeData>();
	    for (TbMenus nav : allMenus) {
	        if(nav.getParentId()==0L){//父节点是0的，为根节点。
	        	XtreeData x=new XtreeData();
	        	x.setTitle(nav.getTitle());
	        	x.setValue(nav.getMenuId()+"");
	        	for (TbMenus m : menus) {
					if(nav.getMenuId().equals(m.getMenuId())){
						x.setChecked(true);
						break;
					}
					
				}
	        	rootMenu.add(x);
	        }
	      }
	    
	  //为根菜单设置子菜单，getClild是递归调用的
      for (XtreeData nav : rootMenu) {
        /* 获取根节点下的所有子节点 使用getChild方法*/
        List<XtreeData> childList = getChild(Long.parseLong(nav.getValue()), allMenus,menus);
        nav.setData(childList);//给根节点设置子节点
      }

		return rootMenu;
	}
	/**
   * 获取子节点
   * @param value 父节点id
   * @param allMenus 所有菜单列表
   * @return 每个根节点下，所有子菜单列表
   */
	private List<XtreeData> getChild(Long value, List<TbMenus> allMenus,List<TbMenus> menus) {
		//子菜单
	    List<XtreeData> childList = new ArrayList<XtreeData>();
	    for (TbMenus nav : allMenus) {
	        // 遍历所有节点，将所有菜单的父id与传过来的根节点的id比较
	        //相等说明：为该根节点的子节点。
	        if(nav.getParentId()==value){
	        	XtreeData x=new XtreeData();
	        	x.setValue(nav.getMenuId()+"");
	        	x.setTitle(nav.getTitle());
	        	//拥有的菜单选中
	        	for (TbMenus m : menus) {
					if(nav.getMenuId().equals(m.getMenuId())){
						x.setChecked(true);
						break;
					}
					
				}
	            childList.add(x);
	        }
	      }
	    //递归
	    for (XtreeData nav : childList) {
	      nav.setData(getChild(Long.parseLong(nav.getValue()), allMenus,menus));
	    }
	    //如果节点下没有子节点，返回一个空List（递归退出）
	    if(childList.size() == 0){
	      return new ArrayList<XtreeData>();
	    }
	    return childList;
	}

	@Override
	public void updRole(TbRoles role, String m) {
		// 更新角色信息
		tbRolesMapper.updateByPrimaryKey(role);
		// 先删除角色所有权限
		TbRolesMenusExample example = new TbRolesMenusExample();
		com.irs.pojo.TbRolesMenusExample.Criteria criteria = example.createCriteria();
		criteria.andRoleIdEqualTo(role.getRoleId());
		tbRolesMenusMapper.deleteByExample(example);
		// 更新权限信息
		if (m != null && m.length() != 0) {
			String[] array = m.split(",");  
			List<String> result = new ArrayList<>();  
			boolean flag;  
			for(int i=0;i<array.length;i++){  
			    flag = false;  
			    for(int j=0;j<result.size();j++){  
			        if(array[i].equals(result.get(j))){  
			            flag = true;  
			            break;  
			        }  
			    }  
			    if(!flag){  
			        result.add(array[i]);  
			    }  
			}  
			// 重新赋予权限
			if (result != null && result.size() > 0) {
				for (int i = 0; i < result.size(); i++) {
					TbRolesMenusKey record = new TbRolesMenusKey();
					record.setMenuId(Long.parseLong(result.get(i)));
					record.setRoleId(role.getRoleId());
					// 维护角色—菜单表
					tbRolesMenusMapper.insert(record);
				}
			}
		}
	}

	@Override
	public void delRole(Long roleId) {
		tbRolesMapper.deleteByPrimaryKey(roleId);
	}

	@Override
	public void delRoles(String rolesId) {
		String[] rids = rolesId.split(",");
		for (String id : rids) {
			tbRolesMapper.deleteByPrimaryKey(Long.parseLong(id));
		}
	}

	@Override
	public TbRoles selRoleByRoleName(String roleName) {
		TbRolesExample example = new TbRolesExample();
		com.irs.pojo.TbRolesExample.Criteria criteria = example.createCriteria();
		criteria.andRoleNameEqualTo(roleName);
		List<TbRoles> roles = tbRolesMapper.selectByExample(example);
		if (roles != null && roles.size() > 0) {
			return roles.get(0);
		}
		return null;
	}

	@Override
	public void insRole(TbRoles role, String m) {
		//维护角色表
		tbRolesMapper.insert(role);
		// 维护角色-菜单表
		if (m != null && m.length() != 0) {
			String[] array = m.split(",");  
			List<String> result = new ArrayList<>();  
			boolean flag;  
			for(int i=0;i<array.length;i++){  
			    flag = false;  
			    for(int j=0;j<result.size();j++){  
			        if(array[i].equals(result.get(j))){  
			            flag = true;  
			            break;  
			        }  
			    }  
			    if(!flag){  
			        result.add(array[i]);  
			    }  
			}  
			// 重新赋予权限
			if (result != null && result.size() > 0) {
				for (int i = 0; i < result.size(); i++) {
					TbRolesMenusKey record = new TbRolesMenusKey();
					record.setMenuId(Long.parseLong(result.get(i)));
					record.setRoleId(role.getRoleId());
					// 维护角色—菜单表
					tbRolesMenusMapper.insert(record);
				}
			}
		}
	}

	@Override
	public void delAdminById(Long id) {
		tbAdminMapper.deleteByPrimaryKey(id);
	}

	@Override
	public void delAdmins(String adminStr) {
		String[] strs = adminStr.split(",");
		if(strs!=null&&strs.length>0){
			for (String str : strs) {
				tbAdminMapper.deleteByPrimaryKey(Long.parseLong(str));
			}
		}
	}

	@Override
	public TbAdmin selAdminByUserName(String username) {
		TbAdminExample example = new TbAdminExample();
		com.irs.pojo.TbAdminExample.Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<TbAdmin> admins = tbAdminMapper.selectByExample(example);
		if (admins != null && admins.size() > 0) {
			return admins.get(0);
		}
		return null;
	}

	@Override
	public void insAdmin(TbAdmin admin) {
		//对密码md5加密
		admin.setPassword(DigestUtils.md5DigestAsHex(admin.getPassword().getBytes()));
		tbAdminMapper.insert(admin);
	}

	@Override
	public TbAdmin selAdminById(Long id) {
		TbAdmin admin=tbAdminMapper.selectByPrimaryKey(id);
		//为了安全，密码置空
		admin.setPassword("");
		return admin;
	}

	@Override
	public TbAdmin selAdminByEmail(String eMail,String username) {
		TbAdminExample example = new TbAdminExample();
		com.irs.pojo.TbAdminExample.Criteria criteria = example.createCriteria();
		criteria.andEMailEqualTo(eMail);
		if(username!=null&&!"".equals(username)){
			criteria.andUsernameNotEqualTo(username);
		}
		List<TbAdmin> admins = tbAdminMapper.selectByExample(example);
		if (admins != null && admins.size() > 0) {
			return admins.get(0);
		}
		return null;
	}

	@Override
	public void updAdmin(TbAdmin admin) {
		TbAdmin a = tbAdminMapper.selectByPrimaryKey(admin.getId());
		admin.setPassword(a.getPassword());
		tbAdminMapper.updateByPrimaryKey(admin);
	}

	@Override
	public void updAdmin1(TbAdmin admin) {
		admin.setPassword(DigestUtils.md5DigestAsHex(admin.getPassword().getBytes()));
		tbAdminMapper.updateByPrimaryKey(admin);
	}

	@Override
	public List<TbMenus> selMenusByParentId() {
		TbMenusExample example=new TbMenusExample();
		example.setOrderByClause("sorting DESC");
		List<TbMenus> data = tbMenusMapper.selectByExample(example);
		return data;
	}

	@Override
	public TbMenus selMenuById(Long menuId) {
		TbMenus menu = tbMenusMapper.selectByPrimaryKey(menuId);
		return menu;
	}

	@Override
	public void insMenu(TbMenus menus) {
		tbMenusMapper.insert(menus);
	}

	@Override
	public void updMenu(TbMenus menus) {
		tbMenusMapper.updateByPrimaryKey(menus);
	}

	@Override
	public TbMenus selMenuByTitle(String title) {
		TbMenusExample example=new TbMenusExample();
		com.irs.pojo.TbMenusExample.Criteria criteria = example.createCriteria();
		criteria.andTitleEqualTo(title);
		List<TbMenus> data = tbMenusMapper.selectByExample(example);
		if(data!=null&&data.size()>0){
			return data.get(0);
		}
		return null;
	}

	@Override
	public TbMenus selMenusById(Long menuId) {
		TbMenusExample example=new TbMenusExample();
		com.irs.pojo.TbMenusExample.Criteria criteria = example.createCriteria();
		criteria.andMenuIdEqualTo(menuId);
		List<TbMenus> data = tbMenusMapper.selectByExample(example);
		if(data!=null&&data.size()>0){
			return data.get(0);
		}
		return null;
	}

	@Override
	public void delMenuById(Long menuId) {
		tbMenusMapper.deleteByPrimaryKey(menuId);
	}

	@Override
	public List<TbMenus> selMenusById1(Long menuId) {
		TbMenusExample example=new TbMenusExample();
		com.irs.pojo.TbMenusExample.Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(menuId);
		List<TbMenus> data = tbMenusMapper.selectByExample(example);
		return data;
	}

	@Override
	public void updMenuSortingById(TbMenus menus) {
		TbMenus m = tbMenusMapper.selectByPrimaryKey(menus.getMenuId());
		m.setSorting(menus.getSorting());
		tbMenusMapper.updateByPrimaryKey(m);
	}

	@Override
	public List<TbMenus> checkTitleSameLevel(TbMenus menus) {
		TbMenusExample example=new TbMenusExample();
		com.irs.pojo.TbMenusExample.Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(menus.getParentId());
		criteria.andTitleEqualTo(menus.getTitle());
		List<TbMenus> data = tbMenusMapper.selectByExample(example);
		return data;
	}
}
