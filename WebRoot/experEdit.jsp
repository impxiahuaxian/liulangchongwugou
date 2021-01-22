<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><s:if test="#attr.exper!=null && #attr.exper.exper_id!=0">编辑</s:if><s:else>新增</s:else>养宠经验</title>
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
<script charset="utf-8" src="admin/editor2/kindeditor-all-min.js"></script>
<script charset="utf-8" src="admin/editor2/lang/zh-CN.js"></script>
<script type="text/javascript" src="js/experType.js"></script>
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
			<div class="title">个人中心  &gt;&gt;  <s:if test="#attr.exper!=null && #attr.exper.exper_id!=0">编辑</s:if><s:else>新增</s:else>养宠经验</div>
			<div style="margin-top:5px">
				 <form id="infoSelf" name="infoSelf" action="page_saveExper.action" method="post" style="width:100%;height:100%">    
				 <input type="hidden" name="paramsExper.exper_id" id="paramsExper.exper_id" value="<s:property value='#attr.exper.exper_id'/>"/>
				 <input type="hidden" name="paramsExper.user_id" id="paramsExper.user_id" value="<s:property value='#attr.userFront.user_id'/>"/>
				 <table class="ptable" style="margin-bottom:5px;">
			        <tr>
			          <td width="15%" align="right" style="padding-right:5px">文章标题：</td>
			          <td width="*" align="left">
			          	<s:textfield cssStyle="width:450px;" name="paramsExper.exper_title" id="paramsExper.exper_title" value="%{#attr.exper.exper_title}"/> 
			          </td>
			        </tr> 
			        <tr>
			          <td align="right" style="padding-right:5px">文章内容：</td>
			          <td class="KEEdit">
			          	<textarea style="width:580px;height:300px" name="paramsExper.exper_content" id="noticeContent"><s:property value="#attr.exper.exper_content" escape="false"/></textarea> 
			          </td>
			        </tr> 
			        <tr class="">
			          <td align="center" height="30" colspan="2">
			            <s:if test="#attr.exper!=null && #attr.exper.exper_id!=0">
			          	<input type="button" id="editBtn" Class="btnstyle" value="编 辑"/> 
			          	</s:if>
			          	<s:else>
			          	<input type="button" id="addBtn" Class="btnstyle" value="新 增" />
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
		var num=/^\d+(\.\d+)?$/;
		var num2=/^\d+$/;
		$("#addBtn").bind('click',function(){
			editor.sync();
			if($("#paramsExper\\.exper_title").val()==''){
				alert("文章标题不能为空！");
				return;
			}
			if($("#noticeContent").val()==''){
				alert("文章内容不能为空！");
				return;
			}
			$("#paramsExper\\.exper_id").val(0);
			var aQuery = $("#infoSelf").serialize();  
			$.post('page_addExper.action',aQuery,
				function(responseObj) {
						if(responseObj.success) {	
							 alert('新增成功！');
							 window.location.href="page_listMyExpers.action";
						}else  if(responseObj.err.msg){
							 alert('新增失败：'+responseObj.err.msg);
						}else{
							 alert('新增失败：服务器异常！');
						}	
			},'json');
		 });
		
		 $("#editBtn").bind('click',function(){
			 editor.sync();
			if($("#paramsExper\\.exper_title").val()==''){
				alert("文章标题不能为空！");
				return;
			}
			if($("#noticeContent").val()==''){
				alert("文章内容不能为空！");
				return;
			}
			var aQuery = $("#infoSelf").serialize();  
			$.post('page_saveExper.action',aQuery,
				function(responseObj) {
						if(responseObj.success) {	
							 alert('编辑成功！');
							 window.location.href="page_listMyExpers.action";
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