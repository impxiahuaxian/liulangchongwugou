<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>宠物领养</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/reg.css">
<link rel="stylesheet" type="text/css" href="css/info.css">
<script language="javascript" type="text/javascript" src=""></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="admin/My97DatePicker/WdatePicker.js"></script>
<script charset="utf-8" src="admin/editor2/kindeditor-all-min.js"></script>
<script charset="utf-8" src="admin/editor2/lang/zh-CN.js"></script>
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
	<div id="list">
		 <div class="nav">当前位置: 主页 > 宠物领养 </div>
		 <div class="list_info">
		 	 <form name="info" id="info" style="width:100%;height:100%" action="page_addRace.action" method="post">
		 	 <input type="hidden" name="paramsRace.user_id" id="paramsRace.user_id" value='${userFront.user_id}'/>
		     <input type="hidden" name="paramsRace.task_id" id="paramsRace.task_id" value='<s:property value="#attr.task.task_id"/>'/>
			 <table class="regTable">
				<tr>
					<td class="theme" colspan="2">宠物领养</td>
				</tr>
				<tr>
					<td align="right" width="20%">宠物昵称：</td>
					<td align="left" width="80%">
						<s:property value="#attr.task.task_name"/>
					</td>
				</tr>
				<tr>
					<td align="right" width="20%">宠物品种：</td>
					<td align="left" width="80%">
						<s:property value="#attr.task.task_type"/>
					</td>
				</tr>
				<tr>
					<td align="right" width="20%">领养起止：</td>
					<td align="left" width="80%">
						<s:property value="#attr.task.task_start"/>~<s:property value="#attr.task.task_end"/>
					</td>
				</tr>
				<tr>
					<td align="right"><span style="color:red">*</span> 申请说明：</td>
					<td align="left">
						<s:textarea name="paramsRace.race_desc" id="noticeContent" cssStyle="width:305px;height:120px"/>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
						<input type="button" id="addBtn" class="btnstyle" value="提交申请"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset"  class="btnstyle" value="清空"/>
					</td>
				</tr>
		 	 </table>
		 	 </form>
		 </div>
		 
	</div>
	<div id="Picture"></div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	var user_id = '${userFront.user_id}';
	var num=/^\d+(\.\d+)?$/;
	$("#addBtn").bind("click",function(){
		editor.sync();
		if(user_id==null || user_id==""){
			alert("申请领养请先登录！");
			return;
		}
		if($("#noticeContent").val()==''){
			alert("申请说明不能为空！");
			return;
		}
		var aQuery = $("#info").serialize();  
		$.post('page_addRace.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('提交申请成功，请及时关注审核结果！');
						 window.location.href="page_listMyRaces.action";
					}else  if(responseObj.err.msg){
						 alert('失败：'+responseObj.err.msg);
					}else{
						 alert('失败：服务器异常！');
					}	
		 },'json');
	});
});

KindEditor.ready(function(K) {
	window.editor = K.create('#noticeContent',{
		width : '95%',
		items:[
			'fullscreen','|','justifyleft', 'justifycenter', 'justifyright','justifyfull',
			'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
			'italic', 'underline','anchor', 'link', 'unlink'
		]
	});
});
</script>
</body>
</html>