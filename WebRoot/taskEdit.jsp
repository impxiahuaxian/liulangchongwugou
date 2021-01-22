<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><s:if test="#attr.task!=null && #attr.task.task_id!=0">编辑</s:if><s:else>发布</s:else>宠物寄养</title>
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
	 <jsp:include page="leftMenu.jsp"></jsp:include>
	 <!--  购物车 -->
	 <div id="product_info">
			<div class="title">个人中心  &gt;&gt;  <s:if test="#attr.task!=null && #attr.task.task_id!=0">编辑</s:if><s:else>发布</s:else>宠物寄养</div>
			<div style="margin-top:5px">
				 <form id="info" name="info" action="page_saveTask.action" method="post" style="width:100%;height:100%">    
				 <input type="hidden" name="paramsTask.user_id" id="paramsTask.user_id" value="${userFront.user_id }"/>
				 <input type="hidden" name="paramsTask.task_id" id="paramsTask.task_id" value="<s:property value='#attr.task.task_id'/>"/>
				 <input type="hidden" name="paramsTask.task_pic" id="paramsTask.task_pic" value="<s:property value='#attr.task.task_pic'/>"/>
				 <table class="ptable" style="margin-bottom:5px;">
					<tr>
			          <td width="15%" align="right" style="padding-right:5px"><span style="color:red">*</span> 宠物昵称：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsTask.task_name" id="paramsTask.task_name" value="%{#attr.task.task_name}"/> 
			          </td>
			        </tr> 
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px"><span style="color:red">*</span> 宠物品种：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsTask.task_type" id="paramsTask.task_type" value="%{#attr.task.task_type}"/> 
			          </td>
			        </tr>
			        <tr>
					  <td align="right" style="padding-right:5px"><span style="color:red">*</span> 宠物图片：</td>
					  <td align="left">
					    <img id="userImg" src="images/task/<s:property value='#attr.task.task_pic'/>" width="70" height="80" style="border:0px;"/>
	        			&nbsp;<span id="op" style="display:none"><img src="images/loading004.gif"  height="80" /></span>
				      </td>
				    </tr>
				    <tr>
					  <td align="right" style="padding-right:5px">上传图片：</td>
				      <td align="left"> 
				          <iframe name="uploadPage" src="uploadImg.jsp" width="100%" height="50" marginheight="0" marginwidth="0" scrolling="no" frameborder="0"></iframe>            
				       </td>
				    </tr>
				     <tr>
			          <td width="15%" align="right" style="padding-right:5px"><span style="color:red">*</span> 宠物年龄：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsTask.task_age" id="paramsTask.task_age" value="%{#attr.task.task_age}"/>岁
			          </td>
			        </tr>
			        <tr>
			          <td align="right" style="padding-right:5px"><span style="color:red">*</span> 寄养简介：</td>
			          <td class="KEEdit">
			          	<textarea style="width:450px;height:150px" name="paramsTask.task_desc" id="noticeContent"><s:property value="#attr.task.task_desc" escape="false"/></textarea> 
			          	<br/><span style="color:red">（字数在300字以内）</span>
			          </td>
			        </tr> 
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px"><span style="color:red">*</span> 寄养起始：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsTask.task_start" id="paramsTask.task_start" value="%{#attr.task.task_start}"
					 		onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/> 
			          </td>
			        </tr>
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px"><span style="color:red">*</span> 寄养截止：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsTask.task_end" id="paramsTask.task_end" value="%{#attr.task.task_end}"
					 		onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/>
			          </td>
			        </tr>
			        <tr>
			          <td align="right" style="padding-right:5px"><span style="color:red">*</span> 寄养要求：</td>
			          <td class="KEEdit">
			          	<textarea style="width:450px;height:150px" name="paramsTask.task_require" id="noticeContent2"><s:property value="#attr.task.task_require" escape="false"/></textarea> 
			          	<br/><span style="color:red">（字数在300字以内）</span>
			          </td>
			        </tr> 
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px"><span style="color:red">*</span> 联系方式：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsTask.user_phone" id="paramsTask.user_phone" value="%{#attr.task.user_phone}"/> 
			          </td>
			        </tr>
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px">联系邮箱：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsTask.user_mail" id="paramsTask.user_mail" value="%{#attr.task.user_mail}"/> 
			          </td>
			        </tr>
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px">家庭地址：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsTask.user_address" id="paramsTask.user_address" value="%{#attr.task.user_address}"/> 
			          </td>
			        </tr>
			        <tr class="">
			          <td align="center" height="30" colspan="4">
			            <input type="button"  Class="btnstyle" value="返 回" onclick="window.history.back();"/>&nbsp;
			            <s:if test="#attr.task!=null && #attr.task.task_id!=0">
			          	<input type="button" id="editBtn" Class="btnstyle" value="编 辑"/> 
			          	</s:if>
			          	<s:else>
			          	<input type="button" id="addBtn" Class="btnstyle" value="发 布" />
			          	</s:else>
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
		var num=/^\d+?$/;
		$("#addBtn").bind('click',function(){
			editor.sync();
			editor2.sync();
			if($("#paramsTask\\.task_name").val()==''){
				alert('宠物昵称不能为空');
				return;
			}
			if($("#paramsTask\\.task_type").val()==''){
				alert('宠物品种不能为空');
				return;
			}
			if($("#paramsTask\\.task_pic").val()==''){
				alert('宠物图片不能为空');
				return;
			}
			if(!num.exec($("#paramsTask\\.task_age").val())){
				alert('宠物年龄必须为数字');
				return;
			}
			if($("#noticeContent").val()==''){
				alert('寄养简介不能为空');
				return;
			}
			if($("#noticeContent").val().length>300){
				alert('寄养简介字数不能超过300');
				return;
			}
			if($("#paramsTask\\.task_start").val()==''){
				alert('寄养起始不能为空');
				return;
			}
			if($("#paramsTask\\.task_end").val()==''){
				alert('寄养截止不能为空');
				return;
			}
			if($("#noticeContent2").val()==''){
				alert('寄养要求不能为空');
				return;
			}
			if($("#noticeContent2").val().length>300){
				alert('寄养要求字数不能超过300');
				return;
			}
			if($("#paramsTask\\.user_phone").val()==''){
				alert('联系方式不能为空');
				return;
			}
			$("#paramsTask\\.task_id").val(0);
			var aQuery = $("#info").serialize();  
			$.post('page_addTask.action',aQuery,
				function(responseObj) {
						if(responseObj.success) {	
							 alert('发布成功！');
							 window.location.href="page_listMyTasks.action";
						}else  if(responseObj.err.msg){
							 alert('发布失败：'+responseObj.err.msg);
						}else{
							 alert('发布失败：服务器异常！');
						}	
			},'json');
		 });
		
		 $("#editBtn").bind('click',function(){
			editor.sync();
			editor2.sync();
			if($("#paramsTask\\.task_name").val()==''){
				alert('宠物昵称不能为空');
				return;
			}
			if($("#paramsTask\\.task_type").val()==''){
				alert('宠物品种不能为空');
				return;
			}
			if($("#paramsTask\\.task_pic").val()==''){
				alert('宠物图片不能为空');
				return;
			}
			if(!num.exec($("#paramsTask\\.task_age").val())){
				alert('宠物年龄必须为数字');
				return;
			}
			if($("#noticeContent").val().length>300){
				alert('寄养简介字数不能超过300');
				return;
			}
			if($("#paramsTask\\.task_start").val()==''){
				alert('寄养起始不能为空');
				return;
			}
			if($("#paramsTask\\.task_end").val()==''){
				alert('寄养截止不能为空');
				return;
			}
			if($("#noticeContent2").val()==''){
				alert('寄养要求不能为空');
				return;
			}
			if($("#noticeContent2").val().length>300){
				alert('寄养要求字数不能超过300');
				return;
			}
			if($("#paramsTask\\.user_phone").val()==''){
				alert('联系方式不能为空');
				return;
			}
			var aQuery = $("#info").serialize();  
			$.post('page_saveTask.action',aQuery,
				function(responseObj) {
						if(responseObj.success) {	
							 alert('编辑成功！');
							 window.location.href="page_listMyTasks.action";
						}else  if(responseObj.err.msg){
							 alert('编辑失败：'+responseObj.err.msg);
						}else{
							 alert('编辑失败：服务器异常！');
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
		window.editor2 = K.create('#noticeContent2',{
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