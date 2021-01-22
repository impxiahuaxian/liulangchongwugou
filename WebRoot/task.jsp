<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>宠物寄养</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
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
<div id="middleBg">
	<!--  产品检索展示 -->
	 <div id="product_info">
	 		<!--  产品列表 -->
	 		<form name="info" id="info" action="page_listTasks.action" method="post" style="width:960px;height:100%">
	 		<input type="hidden" id="pageNo" name="pageNo" value="${pageNo}"/>
			<div class="list">
					<div class="sign" style="background:none;">
						<div class="signleft">
						当前位置: 主页 > 宠物寄养 > 
						</div>
						<div class="signright">
						宠物昵称：<s:textfield name="paramsTask.task_name" value="%{#attr.paramsTask.task_name}" cssClass="inputstyle" cssStlyle="width:100px;"/>&nbsp;
						宠物品种：<s:textfield name="paramsTask.task_type" value="%{#attr.paramsTask.task_type}" cssClass="inputstyle" cssStlyle="width:100px;"/>&nbsp;&nbsp;
						<input type="button" value="搜索" onclick="serch();" class="btnstyle"/>&nbsp;
						</div>
					</div>
					<div class="products">
					<s:if test="#attr.tasks!=null&&#attr.tasks.size()>0">
					<s:iterator value="#attr.tasks" id="task">
					<div class="product">
						<div class="productPic">
							<div style="width:180px;height:125px;line-height:125px;text-align:center;background-image:url('images/gold.png');border:1px solid #b54747">
								<s:a  href="page_queryTask.action?paramsTask.task_id=%{#task.task_id}">
									<img src="images/task/<s:property value='#task.task_pic'/>" />
								</s:a>
							</div>
						</div>
						<div class="productText"><span class="title">宠物昵称：<s:property value='#task.task_name'/></span>
						<br/>宠物品种：<s:property value='#task.task_type'/> <s:property value='#task.task_age'/>岁
						</div>
					</div>
					</s:iterator>
					</s:if> 
					</div>
					
					<!--  产品分页 -->
					<jsp:include page="page.jsp"></jsp:include>
				    <!--  产品分页 -->

			</div>
			</form>
			<!--  产品列表 -->
			
	 </div>
	 <!--  产品检索展示 -->
	 
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
function GoPage()
{
  var pagenum=document.getElementById("goPage").value;
  var patten=/^\d+$/;
  if(!patten.exec(pagenum))
  {
    alert("页码必须为大于0的数字");
    return false;
  }
  document.getElementById("pageNo").value=pagenum;
  document.info.submit();
}
function ChangePage(pagenum)
{
	 document.getElementById("pageNo").value=pagenum;
	 document.info.submit();
}	 
function serch()
{
   document.info.action="page_listTasks.action";
   document.info.submit();
}
</script>
</body>
</html>