<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>查看宠物寄养</title>
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
			<div class="title">个人中心  &gt;&gt;  查看宠物寄养</div>
			<div style="margin-top:5px">
				 <form id="info" name="info" action="page_saveTask.action" method="post" style="width:100%;height:100%">    
				 <input type="hidden" name="paramsTask.user_id" id="paramsTask.user_id" value="${userFront.user_id }"/>
				 <input type="hidden" name="paramsTask.task_id" id="paramsTask.task_id" value="<s:property value='#attr.task.task_id'/>"/>
				 <input type="hidden" name="paramsTask.task_pic" id="paramsTask.task_pic" value="<s:property value='#attr.task.task_pic'/>"/>
				 <table class="ptable" style="margin-bottom:5px;">
					<tr>
			          <td width="40%" align="center">
			          	<img src="images/task/<s:property value='#attr.task.task_pic'/>" width="100" /> 
			          </td>
			          <td width="60%" style="line-height:22px;">
			          	宠物昵称：<s:property value="#attr.task.task_name"/> （<s:property value="#attr.task.task_age"/>岁）
			          	<br/>宠物品种：<s:property value="#attr.task.task_type"/>
						<br/>发布用户：<s:property value="#attr.task.real_name"/>
						<br/>联系方式：<s:property value="#attr.task.user_phone"/>
						<br/>邮箱信息：<s:property value="#attr.task.user_mail"/>
						<br/>地址信息：<s:property value="#attr.task.user_address"/>
						<br/>寄养起止：<s:property value="#attr.task.task_start"/>~<s:property value="#attr.task.task_end"/>
			          	<br/>寄养简介：<s:property value="#attr.task.task_descShow" escape="false"/>
			          	<br/>寄养要求：<s:property value="#attr.task.task_requireShow" escape="false"/>
			          </td>
			        </tr> 
			        <tr class="">
			          <td align="center" height="30" colspan="2">
			            <input type="button" Class="btnstyle" value="返 回" onclick="window.location.histoty.back();"/>
			          </td>
			        </tr>
				 </table>
				 </form>
			</div>
		</div>
	 <!--  购物车 -->
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
	$(document).ready(function(){
		 
		
	});	 
	
</script>
</body>
</html>