<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的发布宠物走失</title>
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
			<div class="title">个人中心  &gt;&gt;  发布宠物走失</div>
			<div style="margin-top:5px">
				 <table class="ptable" style="margin-bottom:5px;">
				    <tr>
					     <td colspan="8" align="right">
					     	<input type="button" value="新增" onclick="window.location.href='page_addLostShow.action';" class="btnstyle"/>
					     </td>
					</tr>
					<tr class="head_text">
					     <td width="" align="center">宠物昵称</td>
					     <td width="" align="center">宠物品种</td>
					     <td width="" align="center">宠物年龄</td>
					     <td width="" align="center">走失时间</td>
					     <td width="" align="center">联系方式</td>
					     <td width="" align="center">操作</td>
					</tr>
					<s:if test="#attr.losts!=null && #attr.losts.size()>0">
					   <s:iterator value="#attr.losts" id="task" status="status">
					   <tr> 
					     <td width="" align="center"><s:property value="#task.task_name"/></td>
					     <td width="" align="center"><s:property value="#task.task_type"/></td>
					     <td width="" align="center"><s:property value="#task.task_age"/></td>
					     <td width="" align="center"><s:property value="#task.lost_date.substring(0,10)"/></td>
					     <td width="" align="center"><s:property value="#task.user_phone"/></td>
					     <td width="" align="center">
					        <s:a id="delLost_%{#task.lost_id}" href="javascript:void(0)">删除</s:a>&nbsp;
					        <s:a href="page_editLost.action?paramsLost.lost_id=%{#task.lost_id}">编辑</s:a>
					     </td>
					   </tr> 
					   </s:iterator>
					</s:if>
				    <s:else>
				    <tr>
				      <td height="60" colspan="8" align="center"><b>&lt;不存在宠物走失信息&gt;</b></td>
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
	  window.location.href="page_listMyLosts.action?pageNo="+pagenum;
	}
	function ChangePage(pagenum)
	{
		window.location.href="page_listMyLosts.action?pageNo="+pagenum;
	}
	$(document).ready(function(){
		$("a[id^='delLost']").bind('click',function(){
		    if(confirm('确认删除吗!?'))
		    {
		    	var lost_id=$(this).attr('id').split('_')[1];
		    	var aQuery = {
						'paramsLost.lost_id':lost_id
				};  
				$.post('page_delLost.action',aQuery,
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