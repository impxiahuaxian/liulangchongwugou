<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="#attr.info!=null && #attr.info.info_id!=0">编辑</s:if><s:else>发布</s:else>网站动态</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script charset="utf-8" src="editor/kindeditor.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	function trimStr(str)     
	{     
	    if ((typeof(str) != "string") || !str)   
	    {    
	        return "";    
	    }   
	    return str.replace(/(^\s*)|(\s*$)/g, "");    
	}
	
	 
	$("#addBtn").bind('click',function(){
		KE.sync('noticeContent');
		if($("#paramsInfo\\.info_title").val()==''){
			alert("标题不能为空！");
			return;
		}
		if($("#paramsInfo\\.info_admin").val()==''){
			alert("发布人不能为空！");
			return;
		}
		if($("#noticeContent").val()==''){
			alert("内容不能为空！");
			return;
		}
		$("#paramsInfo\\.info_id").val(0);
		$("#info").attr('action','Admin_addInfo.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		    KE.sync('noticeContent');
		    if($("#paramsInfo\\.info_title").val()==''){
				alert("标题不能为空！");
				return;
			}
		    if($("#paramsInfo\\.info_admin").val()==''){
				alert("发布人不能为空！");
				return;
			}
			if($("#noticeContent").val()==''){
				alert("内容不能为空！");
				return;
			}
			$("#info").attr('action','Admin_saveInfo.action').submit();
			 
	});
	
});

 
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">网站动态管理&gt;&gt;<s:if test="#attr.info!=null && #attr.info.info_id!=0">编辑</s:if><s:else>发布</s:else>网站动态</span>
</div>
<form id="info" name="info" action="Admin_saveInfo.action" method="post">    
<s:hidden id="paramsInfo.info_id" name="paramsInfo.info_id" value="%{#attr.info.info_id}" /> 
<table width="600" align="center" cellpadding="0" cellspacing="0" style="margin-top:10px;margin-bottom:10px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle"><s:if test="#attr.infos!=null">编辑</s:if><s:else>发布</s:else>网站动态</TD>
              <TD class="edittitleright">&nbsp;</TD>
            </TR>
        </TABLE>
     </td>
   </tr>
   <tr>
     <td height="1" bgcolor="#8f8f8f"></td>
   </tr>
   <tr>
     <td >
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
        <tr>
          <td width="30%" align="right" style="padding-right:5px">标题：</td>
          <td width="70%">
            <s:textfield cssStyle="width:345px;" name="paramsInfo.info_title" id="paramsInfo.info_title" value="%{#attr.info.info_title}"/> 
          </td>  
        </tr> 
        <tr>
          <td width="30%" align="right" style="padding-right:5px">发布人：</td>
          <td width="70%">
            <s:textfield cssStyle="width:345px;" name="paramsInfo.info_admin" id="paramsInfo.info_admin" value="%{#attr.info.info_admin}"/> 
          </td>  
        </tr> 
        <tr> 
          <td align="right" style="padding-right:5px">内容：</td>
          <td>
            <textarea style="width:500px;height:300px" name="paramsInfo.info_content"  id="noticeContent"><s:property value="#attr.info.info_content" escape="false"/></textarea>
          </td>
        </tr>   
     </table>  
     </td> 
   </tr>   
   <tr>
     <td> 
       <table width="100%" align="center" cellpadding="0" cellspacing="0" class="editbody">
        <tr class="editbody">
          <td align="center" height="30"> 
            <s:if test="#attr.info!=null && #attr.info.info_id!=0">
          	<input type="button" id="editBtn" Class="btnstyle" value="编 辑"/> 
          	</s:if>
          	<s:else>
          	<input type="button" id="addBtn" Class="btnstyle" value="添 加" />
          	</s:else>
            &nbsp;<label style="color:red">${tip}</label> 
          </td>
        </tr>
      </table>
     </td> 
   </tr>
</table> 
</form>
<script>        
	   KE.show({ 
	            id : 'noticeContent',
	          //items:['plainpaste', '|', 'selectall', 'bold','italic'],
	            items:['fullscreen', 'undo', 'redo', 'print', 'cut', 'copy', 'paste','plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright','justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript','superscript', '|', 'selectall', '-','title', 'fontname', 'fontsize', '|', 'textcolor', 'bgcolor', 'bold','italic', 'underline', 'strikethrough', 'removeformat', '|', 'image', 'advtable', 'link', 'unlink', '|'],
	            resizeMode:1
	            
	                    
	   });
	   
</script>
</body>
</html>