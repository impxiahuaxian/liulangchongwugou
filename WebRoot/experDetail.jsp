<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>养宠经验内容</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/info.css">
<link rel="stylesheet" type="text/css" href="css/message.css">
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
	<div id="list">
		 <div class="nav">当前位置: 主页 > 养宠经验 >  </div>
		 <div class="article_title"><s:property value="#attr.exper.exper_title" /></div>
		 <div class="article_time">发布时间：<s:property value="#attr.exper.exper_date.substring(0,19)" />　发布人：<s:property value="#attr.exper.real_name" /></div>
		 <%--<s:if test="#attr.exper.exper_pic!=null && #attr.exper.exper_pic!=''">
		 <div class="article_pic">
			<img src='images/expers/<s:property value="#attr.exper.exper_pic" />'/>
		 </div>
		 </s:if>
		 --%><div class="article_con"><s:property value="#attr.exper.exper_contentShow" escape="false"  /></div>
		
		<div class="typehr"></div>
		<div class="title">经验交流</div>
		<div class="typehr"></div>
		
		 <!-- 信息开始 -->
		 <s:if test="totalCount > 0">
		 <s:iterator value="#attr.sblogReplys" id="sblogReply">
		 <div class="messages">
			 <div class="messages_left">
				<div class="nickName"><s:property value="#sblogReply.nick_name" /></div>
				<div class="headphoto"><img src="<s:property value='#sblogReply.sblog_pic'/>" /></div>
			</div>
	
			<div class="messages_right">
				<div class="time">
				    <s:if test="#sblogReply.reply_title!=null && #sblogReply.reply_title.length()>0">
					    <s:property value="#sblogReply.reply_title" />&nbsp;&nbsp;&nbsp;&nbsp;
					        回复时间： <s:property value="#sblogReply.reply_date.substring(0,19)" />　
				    </s:if>
				    <s:else>
				    	评论时间： <s:property value="#sblogReply.reply_date.substring(0,19)" />　
				    </s:else>
					&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/quote.gif" valign="middle"/> <s:a id="reply_%{#sblogReply.nick_name}" href="#link">[回复]</s:a>
				</div>
	
				<div class="sblog_title">
					 <s:property value="#sblogReply.reply_content" />
				</div>
			</div>
		 </div>
		 </s:iterator>
		 </s:if>
		<!-- 信息结束 -->
	
		 <jsp:include page="page.jsp"></jsp:include>
	
		 <!-- 发表回复 -->
		 <div id="addSblogReply">
		 <form name="info1" id="info1" action="page_addSblogReply.action" method="post">
		 <input type="hidden" name="paramsSblogReply.user_id" id="paramsSblogReply.user_id" value="<s:property value='#attr.userFront.user_id' />"/>
		 <input type="hidden" name="paramsSblogReply.exper_id" id="paramsSblogReply.exper_id" value="<s:property value='#attr.exper.exper_id' />"/>
		 <input type="hidden" name="paramsSblogReply.reply_title" id="paramsSblogReply.reply_title" value=""/>
		 <table class="reply_add">
				<tr>
					<td class="theme" colspan="4">发表经验交流：</td>
				</tr>
				<tr>
					<td align="right" width="18%">回复主题：</td>
					<td align="left" colspan="3">
						<input type="text" readonly="readonly" id="reply_title" value="<s:property value='#attr.exper.exper_title' />" style="width:395px;" class="inputstyle"/>
					</td>
				</tr>
				<tr>
					<td align="right" width="18%">回复内容：</td>
					<td align="left" colspan="3">
						<textarea name="paramsSblogReply.reply_content" id="paramsSblogReply.reply_content" style="width:400px;height:80px"  class="inputstyle"></textarea>
						<br/><span style="color:red">（字数在300字以内）</span>
					</td>
				</tr>
				<tr>
					<td align="right" width="18%">头像选择：</td>
					<td align="left" colspan="3">
						<input type="radio" name="paramsSblogReply.sblog_pic" checked="checked" value="images/head/1.gif" />
						<img src="images/head/1.gif" width="50" />
						<input type="radio" name="paramsSblogReply.sblog_pic" value="images/head/2.gif" />
						<img src="images/head/2.gif" width="50" />
					</td>
				</tr>
				<tr>
					<td align="center" colspan="4">
						<input type="button" id="replyBtn" class="btnstyle" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="button" id="cancelBtn" class="btnstyle" value="重置"/>
					</td>
				</tr>
		 </table>
		 </form>
		 </div>
		 <a name="link" id="link">&nbsp;</a>
	</div>
	<div id="Picture"></div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script type="text/javascript">
var user_id = "<s:property value='#attr.userFront.user_id' />";
var exper_title = "<s:property value='#attr.exper.exper_title' />";
$(document).ready(function(){
	$("a[id^='reply']").bind("click",function(){
		var nick_name = $(this).attr("id").split("_")[1];
		$("#reply_title").val("回复："+nick_name);
		$("#paramsSblogReply\\.reply_title").val("回复："+nick_name);
	});
	
	$("#replyBtn").bind("click",function(){
		if(user_id==''){
			alert('请先登录后在进行回复！')
			return;
		}
		if($("#paramsSblogReply\\.reply_content").val()==''){
			alert('回复内容不能为空！')
			return;
		}
		if($("#paramsSblogReply\\.reply_content").val().length>300){
			alert('回复内容不能超过300字！')
			return;
		}
		var aQuery = $("#info1").serialize();  
		$.post('page_addSblogReply.action',aQuery,
			function(responseObj) {
					if(responseObj.success) {	
						 alert('回复成功！');
						 window.location.reload();
					}else  if(responseObj.err.msg){
						 alert('回复失败：'+responseObj.err.msg);
					}else{
						 alert('回复失败：服务器异常！');
					}	
		},'json');
	});
	
	$("#cancelBtn").bind("click",function(){
		$("#reply_title").val(exper_title);
		$("#paramsSblogReply\\.reply_title").val("");
		$("#paramsSblogReply\\.reply_content").val("");
	});
});


</script>
</body>
</html>