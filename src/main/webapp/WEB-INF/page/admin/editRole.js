/*var $;
layui.config({
	base : "js/"
}).use(['form','layer','jquery'],function(){
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage;
		$ = layui.jquery;
		
		//编辑角色ID
		var roleId=$("#roleId").val();
		alert(roleId);
		var xtree = new layuiXtree({
		      elem: 'xtree'  //(必填) 放置xtree的容器id，不带#号
		      , form: form    //(必填) layui 的 from
		      , data: ctx+'/sys/xtreedata?roleId='+roleId  //(必填) 数据接口，需要返回指定结构json字符串
		      , ckall: true   //启动全选功能，默认false
		      , ckallback: function () {}//全选框状态改变后执行的回调函数
		});
		
 	form.on("submit(editRole)",function(data){
 		var list=xtree.GetChecked()
 		//菜单id
 		var mStr="";
 		for(var i=0;i<list.length;i++){
 			mStr+=list[i].value+",";
 			if(xtree.GetParent(list[i].value)!=null){
 				mStr+=xtree.GetParent(list[i].value).value+",";
 				//alert(xtree.GetParent(xtree.GetParent(list[i].value).value).value)
 				if(xtree.GetParent(xtree.GetParent(list[i].value).value)!=null){
 	 				mStr+=xtree.GetParent(xtree.GetParent(list[i].value).value).value+",";
 				}
 			}else{
 				mStr+=list[i].value+",";
 			}
 		}
 		//去除字符串末尾的‘,’
 		mStr=mStr.substring(0,mStr.length-1)
 		var m=$("#m");
 		//将权限字符串写进隐藏域
 		m.val(mStr)
 		//弹出loading
 		var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
        setTimeout(function(){
        	$.ajax({
                type: "POST",
                url: ctx+"/sys/updRole",
                data:$("#erf").serialize(),
            });
            top.layer.close(index);
			top.layer.msg("角色修改成功！");
 			layer.closeAll("iframe");
	 		//刷新父页面
	 		parent.location.reload();
        },2000);
 		return false;
 	})
 	
 	//角色名唯一性校验
 	$("#roleName").blur(function(){
 		$.ajax({
            type: "get",
            url: ctx+"/sys/checkRoleName?roleName="+$("#roleName").val()+"&roleId="+roleId,
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

//格式化时间
function formatTime(_time){
    var year = _time.getFullYear();
    var month = _time.getMonth()+1<10 ? "0"+(_time.getMonth()+1) : _time.getMonth()+1;
    var day = _time.getDate()<10 ? "0"+_time.getDate() : _time.getDate();
    var hour = _time.getHours()<10 ? "0"+_time.getHours() : _time.getHours();
    var minute = _time.getMinutes()<10 ? "0"+_time.getMinutes() : _time.getMinutes();
    return year+"-"+month+"-"+day+" "+hour+":"+minute;
}*/
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
		      , data: ctx+'/sys/xtreedata?roleId='+roleId+'&timestamp='+(new Date()).valueOf()
  //(必填) 数据接口，需要返回指定结构json字符串
		      , ckall: true   //启动全选功能，默认false
		      , ckallback: function (data) {
		      }//全选框状态改变后执行的回调函数
		});*/
		/*var xtree = new layuiXtree({
		      elem: 'xtree1'  //(必填) 放置xtree的容器id，不带#号
		      , form: form    //(必填) layui 的 from
		      , data: ctx+'/sys/xtreedata'  //(必填) 数据接口，需要返回指定结构json字符串
		      , ckall: true   //启动全选功能，默认false
		      , check : {//使用ztree选中效果
                  enable : true,
              }
		      , ckallback: function () {}//全选框状态改变后执行的回调函数
		});*/
		
		form.on("submit(editRole)",function(data){
			var treeObj = $.fn.zTree.getZTreeObj("xtree1");
	 		var list = treeObj.getCheckedNodes(true);
	 		//菜单id
	 		var mStr="";
	 		for(var i=0;i<list.length;i++){
	 			mStr+=list[i].menuId+",";
	 		}
	 		//去除字符串末尾的‘,’
	 		mStr=mStr.substring(0,mStr.length-1)
	 		var m=$("#m");
	 		//将权限字符串写进隐藏域
	 		m.val(mStr)
	 		//弹出loading
	 		var index = top.layer.msg('数据提交中，请稍候',{icon: 16,time:false,shade:0.8});
	        setTimeout(function(){
	        	$.ajax({
	                type: "POST",
	                url: ctx+"/sys/updRole",
	                data:$("#arf").serialize(),
	            });
	            top.layer.close(index);
				top.layer.msg("角色修改成功！");
	 			layer.closeAll("iframe");
		 		//刷新父页面
		 		parent.location.reload();
	        },2000);
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
var roleId=$("#roleId").val();
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
		    		data:{roleId:roleId},
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