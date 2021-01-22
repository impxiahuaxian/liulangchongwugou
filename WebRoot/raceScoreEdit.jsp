<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>领养打分</title>
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
			<div class="title">个人中心  &gt;&gt;  领养打分</div>
			<div style="margin-top:5px">
				 <form id="info" name="info" action="page_updateRaceScore.action" method="post">    
				 <input type="hidden" name="paramsRace.race_id" id="paramsRace.race_id" value="<s:property value='#attr.race.race_id'/>"/>
				 <input type="hidden" name="paramsRace.user_id" id="paramsRace.user_id" value="<s:property value='#attr.race.user_id'/>"/>
				 <table class="ptable" style="margin-bottom:5px;">
					<tr>
			          <td width="15%" align="right" style="padding-right:5px">宠物昵称：</td>
			          <td width="*">
			          	<s:property value="%{#attr.race.task_name}"/> 
			          </td>
			        </tr>
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px">领养人：</td>
			          <td width="*">
			          	<s:property value="%{#attr.race.real_name}"/> 
			          </td>
			        </tr> 
			         <tr>
			          <td width="15%" align="right" style="padding-right:5px"><span style="color:red">*</span> 领养打分：</td>
			          <td width="*">
			          	<s:select id="paramsRace.race_score" name="paramsRace.race_score" value="%{#attr.race.race_score}" 
					      		list="#{'1':'好评', '2':'中评', '3':'差评' }" listKey="key" listValue="value" 
					      		cssClass="selectstyle" cssStyle="width:100px;" headerKey="0" headerValue="请选择">
					     </s:select> 
			          </td>
			        </tr>
			        <tr class="">
			          <td align="center" height="30" colspan="4">
			            <input type="button" id="addBtn" Class="btnstyle" value="提 交" />
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
		var task_id = "<s:property value='#attr.race.task_id'/>";
		$("#addBtn").bind('click',function(){
			if($("#paramsRace\\.race_score").val()=='0'){
				alert('领养打分不能为空');
				return;
			}
			var aQuery = $("#info").serialize();  
			$.post('page_updateRaceScore.action',aQuery,
				function(responseObj) {
						if(responseObj.success) {	
							 alert('打分成功！');
							 window.location.href="page_listRaces.action?paramsRace.task_id="+task_id+"&paramsRace.task_status=2";
						}else  if(responseObj.err.msg){
							 alert('打分失败：'+responseObj.err.msg);
						}else{
							 alert('打分失败：服务器异常！');
						}	
			},'json');
		 });
		
	});	 
	
</script>
</body>
</html>