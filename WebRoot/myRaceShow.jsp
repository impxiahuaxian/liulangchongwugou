<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的领养记录</title>
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
			<div class="title">个人中心  &gt;&gt;  我的领养记录</div>
			<div style="margin-top:5px">
				 <table class="ptable" style="margin-bottom:5px;">
					<tr class="head_text">
					     <td width="" align="center">宠物昵称</td>
					     <td width="" align="center">宠物品种</td>
					     <td width="" align="center">宠物年龄</td>
					     <td width="" align="center">申请日期</td>
					     <td width="" align="center">申请结果</td>
					     <td width="" align="center">领养打分</td>
					</tr>
					<s:if test="#attr.races!=null && #attr.races.size()>0">
					   <s:iterator value="#attr.races" id="race" status="status">
					   <tr> 
					    <td width="" align="center" title='<s:property value="#race.task_name"/>'>
						     <s:a href="page_queryTask.action?paramsTask.task_id=%{#race.task_id}">
						     <s:property value="#race.task_name.length()>8?#race.task_name.substring(0,7)+'..':#race.task_name"/>
						     </s:a>
					     </td>
					     <td width="" align="center"><s:property value="#race.task_type"/></td>
					     <td width="" align="center"><s:property value="#race.task_age"/></td>
					     <td width="" align="center"><s:property value="#race.race_date.substring(0,10)"/></td>
					     <td width="" align="center"><s:property value="#race.race_flagDesc"/></td>
					     <td width="" align="center"><s:property value="#race.race_scoreDesc"/></td>
					   </tr> 
					   </s:iterator>
					</s:if>
				    <s:else>
				    <tr>
				      <td height="60" colspan="6" align="center"><b>&lt;不存在我的领养记录信息&gt;</b></td>
				    </tr>
				    </s:else>
				 </table>
			</div>
			<div class="pages">
				<jsp:include page="page.jsp"></jsp:include>
			</div>
		</div>
	 <!--  购物车 -->
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
	  window.location.href="page_listMyRaces.action?pageNo="+pagenum;
	}
	function ChangePage(pagenum)
	{
		window.location.href="page_listMyRaces.action?pageNo="+pagenum;
	}
	$(document).ready(function(){
		 
	});
</script>
</body>
</html>