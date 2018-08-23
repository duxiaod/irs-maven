var $;
layui.config({
	base : "js/"
}).use(['form','layer','jquery'],function(){
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage;
		$ = layui.jquery;
		
		/*var xtree = new layuiXtree({
		      elem: 'xtree1'  //(必填) 放置xtree的容器id，不带#号
		      , form: form    //(必填) layui 的 from
		      , data: ctx+'/sys/xtreedata?timestamp='+(new Date()).valueOf()  //(必填) 数据接口，需要返回指定结构json字符串
		      , ckall: true   //启动全选功能，默认false
		      , ckallback: function () {}//全选框状态改变后执行的回调函数
		});*/
		
		
 	form.on("submit(editRole)",function(data){
 		var treeObj = $.fn.zTree.getZTreeObj("xtree1");
 		var list = treeObj.getCheckedNodes(true);
 		
 		//菜单id
 		var mStr="";
 		for(var i=0;i<list.length;i++){
 			mStr+=list[i].menuId+",";
 		/*	if(xtree.GetParent(list[i].menuId)!=null){
 				mStr+=xtree.GetParent(list[i].menuId).menuId+",";
 				if(xtree.GetParent(xtree.GetParent(list[i].menuId).menuId)!=null){
 	 				mStr+=xtree.GetParent(xtree.GetParent(list[i].menuId).menuId).menuId+",";
 				}
 			}else{
 				mStr+=list[i].menuId+",";
 			}*/
 		}
 		//去除字符串末尾的‘,’
 		mStr=mStr.substring(0,mStr.length-1)
 		var m=$("#m");
 		//将权限字符串写进隐藏域
 		m.val(mStr)
 		//弹出loading
 		var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
 		var msg;
 		$.ajax({
            type: "POST",
            url: ctx+"/sys/insRole",
            data:$("#arf").serialize(),
            success:function(d){
				if(d.code==0){
					msg="添加成功";
				}else{
					msg=d.msg;
				}
			}
        });
 		setTimeout(function(){
        	top.layer.close(index);
        	top.layer.msg(msg);
 			layer.closeAll("iframe");
	 		//刷新父页面
	 		parent.location.reload();
        },1000);
 		return false;
 	})
 	
 	//角色名唯一性校验
 	$("#roleName").blur(function(){
 		$.ajax({
            type: "get",
            url: ctx+"/sys/checkRoleName/"+$("#roleName").val(),
            success:function(data){
            	if(data.code!=0){
            		top.layer.msg(data.msg);
            		$("#roleName").val("");
            		$("#roleName").focus();
            	}
            }
        });
 	})
})
var menu = {
			setting: {
				view : {
		            showIcon : false,
		        },	
				   
		    data:{
		    	simpleData: {
	                enable: true,
	                idKey: "menuId",
	                pIdKey: "parentId",
	            },
		    	key:{
		    		name:"title",
		    	}
		    },
			check:{
				enable:true
			}
			},
			loadMenuTree:function(){
				$.ajax({
		    		type: "post",
		    		url: ctx+'/sys/xtreedata',
					dataType:"json",
					success:function(data){
						//$("#xtree1").zTree(menu.setting, data);
						$.fn.zTree.init($("#xtree1"), menu.setting, data);
						}
					})
			}
		};

		$().ready(function(data){
			menu.loadMenuTree();
		});
		function checkNode(e) {
	        var zTree = $.fn.zTree.getZTreeObj("xtree1"),
	                type = e.data.type,
	                nodes = zTree.getSelectedNodes();
	        console.log(type.indexOf("All"));
	        if (type.indexOf("All") < 0 && nodes.length == 0) {
	            alert("请先选择一个节点");
	        }
	        if (type == "checkAllTrue") {
	            zTree.checkAllNodes(true);
	        } else if (type == "checkAllFalse") {
	            zTree.checkAllNodes(false);
	        }
	    }
	    $("#checkAllTrue").bind("click", { type: "checkAllTrue" }, checkNode);
	    $("#checkAllFalse").bind("click", { type: "checkAllFalse" }, checkNode);
/*var zTreeObj;
   // zTree 的参数配置，深入使用请参考 API 文档（setting 配置详解）
   var setting = {
		   view:{
			   showIcon: true
		   },  
		   check:{
			   enable:true
		    },

		   simpleData: {  
	            enable: true  
	        }  
   };
   // zTree 的数据属性，深入使用请参考 API 文档（zTreeNode 节点数据详解）
   var zNodes = [
   {name:"test1", open:true, children:[
      {name:"test1_1"}, {name:"test1_2"}]},
   {name:"test2", open:true, children:[
      {name:"test2_1"}, {name:"test2_2"}]}
   ];
   $(document).ready(function(){
      zTreeObj = $.fn.zTree.init($("#xtree1"), setting, zNodes);
   });
*/