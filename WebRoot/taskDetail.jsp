<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>宠物寄养详情</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/product.css">
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript">
 $(document).ready(function(){
	 var task_user_id = "<s:property value='#attr.task.user_id'/>";
	 var task_status = "<s:property value='#attr.task.task_status'/>"; 
	 //点击竞标
	 var user_id = "${userFront.user_id}";
	 var num = /^\d+$/;
	 $("#addOrders").bind('click',function(){
		 if(user_id==''){
			 alert('请先登录');
			 return;
		 }
		 if(task_status=='2'){
			 alert('宠物已经被领养');
			 return;
		 }
		 if(task_user_id==user_id){
			 alert('您不能申请领养自己的宠物');
			 return;
		 }
		 $("#info").submit();
	 });
}); 
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
<div id="middleBg">
	<!--  产品检索介绍 -->
	 <div id="product_info">
			<div class="productShow">
					<div class="title"><s:property value="#attr.task.task_name"/>（<s:property value="#attr.task.task_age"/>岁）</div>
					<div class="typehr"></div>
					<div class="pictext">
							<div class="pic"><img src="images/task/<s:property value='#attr.task.task_pic'/>" width="250px" height="250px"/></div>
							<div class="text">
									<form name="info" id="info" action="page_addRaceShow.action" method="post">
									<input type="hidden" name="paramsTask.task_id" id="paramsTask.task_id" value="<s:property value='#attr.task.task_id'/>"/>
									<div class="textTop" style="height:180px">
											宠物品种：<span style="color:black"><s:property value="#attr.task.task_type"/></span>
											<br/>发布用户：<span style="color:black"><s:property value="#attr.task.real_name"/></span>
											<br/>联系方式：<span style="color:black"><s:property value="#attr.task.user_phone"/></span>
											<br/>邮箱信息：<span style="color:black"><s:property value="#attr.task.user_mail"/></span>
											<br/>地址信息：<span style="color:black"><s:property value="#attr.task.user_address"/></span>
											<br/>寄养起止：<span style="color:black"><s:property value="#attr.task.task_start"/>~<s:property value="#attr.task.task_end"/></span>
									</div>
									<div class="textBtn" style="height:60px">
										<img id="addOrders" src="images/order.png" style="border:none;cursor:pointer;vertical-align:middle;width:120px" />&nbsp;&nbsp;
									</div>
									</form>
							</div>
					</div>
					<div class="typehr"></div>
					<div class="title">宠物寄养简介</div>
					<div class="typehr"></div>
					<div class="intro">
						<s:property value="#attr.task.task_descShow" escape="false"  />
					</div>
					<div class="typehr"></div>
					<div class="title">宠物寄养要求</div>
					<div class="typehr"></div>
					<div class="intro">
						<s:property value="#attr.task.task_requireShow" escape="false"  />
					</div>
			</div>

			 
			
	 </div>
	 <!--  产品检索 -->
	 
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script type="text/javascript">
</script>
</body>
</html>