<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的发布宠物寄养</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/store.css">
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript"> 
	
</script>
<style type="text/css"> 
 body,td,div
 {
   font-size:12px;
 }
</style>
</head>
<body>
<jsp:include page="top.jsp"></jsp:include>
<div id="middle">
	 <jsp:include page="leftMenu.jsp"></jsp:include>
	 <!--  购物车 -->
	 <div id="product_info">
			<div class="title">个人中心  &gt;&gt;  我的发布宠物寄养</div>
			<div style="margin-top:5px">
				 <table class="ptable" style="margin-bottom:5px;">
				    <tr>
					     <td colspan="8" align="right">
					     	<input type="button" value="新增" onclick="window.location.href='page_addTaskShow.action';" class="btnstyle"/>
					     </td>
					</tr>
					<tr class="head_text">
					     <td width="" align="center">宠物昵称</td>
					     <td width="" align="center">宠物品种</td>
					     <td width="" align="center">宠物年龄</td>
					     <td width="" align="center">寄养起止</td>
					     <td width="" align="center">联系方式</td>
					     <td width="" align="center">当前状态</td>
					     <td width="" align="center">领养人</td>
					     <td width="" align="center">操作</td>
					</tr>
					<s:if test="#attr.tasks!=null && #attr.tasks.size()>0">
					   <s:iterator value="#attr.tasks" id="task" status="status">
					   <tr> 
					     <td width="" align="center" title='<s:property value="#task.task_name"/>'>
						     <s:a href="page_queryTask.action?paramsTask.task_id=%{#task.task_id}">
						     <s:property value="#task.task_name.length()>8?#task.task_name.substring(0,7)+'..':#task.task_name"/>
						     </s:a>
					     </td>
					     <td width="" align="center"><s:property value="#task.task_type"/></td>
					     <td width="" align="center"><s:property value="#task.task_age"/></td>
					     <td width="" align="center"><s:property value="#task.task_start.substring(0,10)"/>~<s:property value="#task.task_end.substring(0,10)"/></td>
					     <td width="" align="center"><s:property value="#task.user_phone"/></td>
					     <td width="" align="center"><s:property value="#task.task_statusDesc"/></td>
					     <td width="" align="center"><s:property value="#task.race_user"/>&nbsp;</td>
					     <td width="" align="center">
					       <s:if test="#task.task_status==1">
					       <s:a id="delTask_%{#task.task_id}" href="javascript:void(0)">删除</s:a>&nbsp;
					       <s:a href="page_editTask.action?paramsTask.task_id=%{#task.task_id}">编辑</s:a>
					       <br/><s:a href="page_listRaces.action?paramsRace.task_id=%{#task.task_id}&paramsRace.task_status=%{#task.task_status}">查看申请</s:a>
					       </s:if>
					       <s:else>
					       <s:a href="page_queryMyTask.action?paramsTask.task_id=%{#task.task_id}">查看</s:a>
					       <br/><s:a href="page_listRaces.action?paramsRace.task_id=%{#task.task_id}&paramsRace.task_status=%{#task.task_status}">查看申请</s:a>
					       </s:else>
					     </td>
					   </tr> 
					   </s:iterator>
					</s:if>
				    <s:else>
				    <tr>
				      <td height="60" colspan="8" align="center"><b>&lt;不存在宠物寄养信息&gt;</b></td>
				    </tr>
				    </s:else>
				 </table>
			</div>
			<div class="pages">
				<jsp:include page="page.jsp"></jsp:include>
			</div>
		</div>
	 <!--  购物车 -->
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
	function GoPage()
	{
	  var pagenum=document.getElementById("goPage").value;
	  var patten=/^\d+$/;
	  if(!patten.exec(pagenum))
	  {
	    alert("页码必须为大于0的数字");
	    return false;
	  }
	  window.location.href="page_listMyTasks.action?pageNo="+pagenum;
	}
	function ChangePage(pagenum)
	{
		window.location.href="page_listMyTasks.action?pageNo="+pagenum;
	}
	$(document).ready(function(){
		$("a[id^='delTask']").bind('click',function(){
		    if(confirm('确认删除吗!?'))
		    {
		    	var task_id=$(this).attr('id').split('_')[1];
		    	var aQuery = {
						'paramsTask.task_id':task_id
				};  
				$.post('page_delTask.action',aQuery,
					function(responseObj) {
							if(responseObj.success) {	
								 alert('删除成功！');
								 window.location.reload();
							}else  if(responseObj.err.msg){
								 alert('删除失败：'+responseObj.err.msg);
							}else{
								 alert('删除失败：服务器异常！');
							}	
				},'json');
		    }
		 });
	});
</script>
</body>
</html>