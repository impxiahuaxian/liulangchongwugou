<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><s:if test="#attr.lost!=null && #attr.lost.lost_id!=0">编辑</s:if><s:else>发布</s:else>宠物走失</title>
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
			<div class="title">个人中心  &gt;&gt;  <s:if test="#attr.lost!=null && #attr.lost.lost_id!=0">编辑</s:if><s:else>发布</s:else>宠物走失</div>
			<div style="margin-top:5px">
				 <form id="info" name="info" action="page_saveLost.action" method="post" style="width:100%;height:100%">    
				 <input type="hidden" name="paramsLost.user_id" id="paramsLost.user_id" value="${userFront.user_id }"/>
				 <input type="hidden" name="paramsLost.lost_id" id="paramsLost.lost_id" value="<s:property value='#attr.lost.lost_id'/>"/>
				 <input type="hidden" name="paramsLost.task_pic" id="paramsTask.task_pic" value="<s:property value='#attr.lost.task_pic'/>"/>
				 <table class="ptable" style="margin-bottom:5px;">
					<tr>
			          <td width="15%" align="right" style="padding-right:5px"><span style="color:red">*</span> 宠物昵称：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsLost.task_name" id="paramsLost.task_name" value="%{#attr.lost.task_name}"/> 
			          </td>
			        </tr> 
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px"><span style="color:red">*</span> 宠物品种：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsLost.task_type" id="paramsLost.task_type" value="%{#attr.lost.task_type}"/> 
			          </td>
			        </tr>
			        <tr>
					  <td align="right" style="padding-right:5px"><span style="color:red">*</span> 宠物图片：</td>
					  <td align="left">
					    <img id="userImg" src="images/task/<s:property value='#attr.lost.task_pic'/>" width="70" height="80" style="border:0px;"/>
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
			          	<s:textfield cssStyle="width:450px;" name="paramsLost.task_age" id="paramsLost.task_age" value="%{#attr.lost.task_age}"/>岁
			          </td>
			        </tr>
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px"><span style="color:red">*</span> 丢失时间：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsLost.lost_date" id="paramsLost.lost_date" value="%{#attr.lost.lost_date}"
					 		onfocus="WdatePicker({skin:'whyGreen',dateFmt:'yyyy-MM-dd'})"/> 
			          </td>
			        </tr>
			        <tr>
			          <td align="right" style="padding-right:5px"><span style="color:red">*</span> 丢失简介：</td>
			          <td class="KEEdit">
			          	<textarea style="width:450px;height:150px" name="paramsLost.task_desc" id="noticeContent"><s:property value="#attr.lost.task_desc" escape="false"/></textarea> 
			          	<br/><span style="color:red">（字数在300字以内）</span>
			          </td>
			        </tr> 
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px"><span style="color:red">*</span> 联系方式：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsLost.user_phone" id="paramsLost.user_phone" value="%{#attr.lost.user_phone}"/> 
			          </td>
			        </tr>
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px">联系邮箱：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsLost.user_mail" id="paramsLost.user_mail" value="%{#attr.lost.user_mail}"/> 
			          </td>
			        </tr>
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px">家庭地址：</td>
			          <td width="*">
			          	<s:textfield cssStyle="width:450px;" name="paramsLost.user_address" id="paramsLost.user_address" value="%{#attr.lost.user_address}"/> 
			          </td>
			        </tr>
			        <tr class="">
			          <td align="center" height="30" colspan="4">
			            <input type="button"  Class="btnstyle" value="返 回" onclick="window.history.back();"/>&nbsp;
			            <s:if test="#attr.lost!=null && #attr.lost.lost_id!=0">
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
			if($("#paramsLost\\.task_name").val()==''){
				alert('宠物昵称不能为空');
				return;
			}
			if($("#paramsLost\\.task_type").val()==''){
				alert('宠物品种不能为空');
				return;
			}
			if($("#paramsTask\\.task_pic").val()==''){
				alert('宠物图片不能为空');
				return;
			}
			if(!num.exec($("#paramsLost\\.task_age").val())){
				alert('宠物年龄必须为数字');
				return;
			}
			if($("#paramsLost\\.task_start").val()==''){
				alert('丢失时间不能为空');
				return;
			}
			if($("#noticeContent").val()==''){
				alert('丢失简介不能为空');
				return;
			}
			if($("#noticeContent").val().length>300){
				alert('丢失简介字数不能超过300');
				return;
			}
			if($("#paramsLost\\.user_phone").val()==''){
				alert('联系方式不能为空');
				return;
			}
			$("#paramsLost\\.lost_id").val(0);
			var aQuery = $("#info").serialize();  
			$.post('page_addLost.action',aQuery,
				function(responseObj) {
						if(responseObj.success) {	
							 alert('发布成功！');
							 window.location.href="page_listMyLosts.action";
						}else  if(responseObj.err.msg){
							 alert('发布失败：'+responseObj.err.msg);
						}else{
							 alert('发布失败：服务器异常！');
						}	
			},'json');
		 });
		
		 $("#editBtn").bind('click',function(){
			 editor.sync();
			if($("#paramsLost\\.task_name").val()==''){
				alert('宠物昵称不能为空');
				return;
			}
			if($("#paramsLost\\.task_type").val()==''){
				alert('宠物品种不能为空');
				return;
			}
			if($("#paramsTask\\.task_pic").val()==''){
				alert('宠物图片不能为空');
				return;
			}
			if(!num.exec($("#paramsLost\\.task_age").val())){
				alert('宠物年龄必须为数字');
				return;
			}
			if($("#paramsLost\\.task_start").val()==''){
				alert('丢失时间不能为空');
				return;
			}
			if($("#noticeContent").val()==''){
				alert('丢失简介不能为空');
				return;
			}
			if($("#noticeContent").val().length>300){
				alert('丢失简介字数不能超过300');
				return;
			}
			if($("#paramsLost\\.user_phone").val()==''){
				alert('联系方式不能为空');
				return;
			}
			var aQuery = $("#info").serialize();  
			$.post('page_saveLost.action',aQuery,
				function(responseObj) {
						if(responseObj.success) {	
							 alert('编辑成功！');
							 window.location.href="page_listMyLosts.action";
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
	});
</script>
</body>
</html>