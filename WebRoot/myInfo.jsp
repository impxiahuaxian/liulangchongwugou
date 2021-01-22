<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>修改个人信息</title>
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
	var user_id="${userFront.user_id}";
	if(user_id==null || user_id==''){
		alert("请先登录！");
		window.location.href="page_index.action";
	} 
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
			<div class="title">个人中心  &gt;&gt;  修改个人信息</div>
			<div style="margin-top:5px">
				 <form id="info" name="info" action="page_saveUserFront.action" method="post">    
				 <input type="hidden" name="paramsUser.user_id" value="${userFront.user_id}"/>
				 <table class="ptable" style="margin-bottom:5px;">
					<tr>
			          <td width="15%" align="right" style="padding-right:5px">用户名：</td>
			          <td colspan="3">${userFront.user_name}</td>
			        </tr> 
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px"><font color="red">*</font> 姓名：</td>
			          <td width="35%">
			            <input type="text" id="paramsUser.real_name" name="paramsUser.real_name" value="${userFront.real_name}"/>
			          </td> 
			          <td width="15%" align="right" style="padding-right:5px"><font color="red">*</font> 昵称：</td>
			          <td width="35%">
			            <input type="text" id="paramsUser.nick_name" name="paramsUser.nick_name" value="${userFront.nick_name}"/>
			          </td>
			        </tr>
			        <tr>
			          <td align="right" style="padding-right:5px"><font color="red">*</font> 性别：</td>
			          <td>
			             <input type="radio" name="paramsUser.user_sex" id="sex1" value="1"/>男&nbsp;&nbsp;
			             <input type="radio" name="paramsUser.user_sex" id="sex2" value="2"/>女
			          </td>
			          <td align="right" style="padding-right:5px">年龄：</td>
			          <td>
			             <input type="text" id="paramsUser.user_age" name="paramsUser.user_age" value="${userFront.user_age}"/>
			          </td>
			        </tr> 
			        <tr>
			          <td align="right" style="padding-right:5px"><font color="red">*</font> 联系方式：</td>
			          <td >
			             <input type="text" id="paramsUser.user_phone" name="paramsUser.user_phone" value="${userFront.user_phone}"/>
			          </td>
			          <td align="right" style="padding-right:5px">邮箱：</td>
			          <td >
			             <input type="text" id="paramsUser.user_mail" name="paramsUser.user_mail" value="${userFront.user_mail}"/>
			          </td>
			        </tr> 
			        <tr>
			          <td align="right" style="padding-right:5px">家庭住址：</td>
			          <td >
			             <input type="text" id="paramsUser.user_address" name="paramsUser.user_address" value="${userFront.user_address}"/>
			          </td>
			          <td align="right" style="padding-right:5px">信用值：</td>
			          <td >
			             ${userFront.user_level}
			          </td>
			        </tr> 
			        <tr class="">
			          <td align="center" height="30" colspan="4">
			            <input type="button" id="saveBtn" Class="btnstyle" value="修 改"/>&nbsp;
			            <span style="color:red">${tip }</span>
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
		 var user_sex = "${userFront.user_sex}";
		 $("#sex"+user_sex).attr('checked','checked');
		 
		 var num=/^\d+$/;
		 $("#saveBtn").bind('click',function(){
			if($("#paramsUser\\.real_name").val()==''){
				alert('姓名不能为空');
				return;
			}
			if($("#paramsUser\\.nick_name").val()==''){
				alert('昵称不能为空');
				return;
			}
			if($("#paramsUser\\.user_age").val()!=''){
				if(!num.exec($("#paramsUser\\.user_age").val())){
					alert('年龄必须为数字');
					return;
				}
			}else{
				$("#paramsUser\\.user_age").val(0);
			}
			if($("#paramsUser\\.user_phone").val()==''){
				alert('联系方式不能为空');
				return;
			}
			
			$("#info").submit();
			 
		 });
		
	});	 
</script>
</body>
</html>