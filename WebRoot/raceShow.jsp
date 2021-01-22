<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>我的宠物寄养-申请情况</title>
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
			<div class="title">个人中心  &gt;&gt;  我的宠物寄养-申请情况</div>
			<div style="margin-top:5px">
				 <form id="info" name="info" action="page_listRaces.action" method="post" style="width:100%;height:100%">
				 <input type="hidden" name="pageNo" id="pageNo" value="${pageNo}"/>    
				 <input type="hidden" name="paramsRace.task_id" id="task_id" value="<s:property value='#attr.task_id'/>"/>  
				 <input type="hidden" name="paramsRace.task_status" id="task_status" value="<s:property value='#attr.task_status'/>"/>    
				 <table class="ptable" style="margin-bottom:5px;">
				 	<tr>
					     <td colspan="9" align="right">
					     	地址：
      						<input type="text" id="paramsRace.user_address" name="paramsRace.user_address" value="${paramsRace.user_address}" class="inputstyle" Style="width:100px;"/>&nbsp;
					     	信用值：
      						<input type="text" id="paramsRace.user_levelMin" name="paramsRace.user_levelMin" value="${paramsRace.user_levelMin}" class="inputstyle" Style="width:40px;"/>
      						&nbsp;-&nbsp;
      						<input type="text" id="paramsRace.user_levelMax" name="paramsRace.user_levelMax" value="${paramsRace.user_levelMax}" class="inputstyle" Style="width:40px;"/>
					     	<input type="button" value="搜索" onclick="serch();" class="btnstyle"/>
					     </td>
					</tr>
					<tr class="head_text">
					     <td width="55" align="center">申请人</td>
					     <td width="" align="center">地址</td>
					     <td width="55" align="center">信用值</td>
					     <td width="55" align="center">联系方式</td>
					     <td width="75" align="center">申请日期</td>
					     <td width="100" align="center">申请说明</td>
					     <td width="55" align="center">申请结果</td>
					     <td width="55" align="center">领养打分</td>
					     <td width="45" align="center">操作</td>
					</tr>
					<s:if test="#attr.races!=null && #attr.races.size()>0">
					   <s:iterator value="#attr.races" id="race" status="status">
					   <tr class="<s:if test='(#status.index + 1)%2==0'>list1</s:if><s:else>list0</s:else>" onmouseover="tr_mouseover(this)" onmouseout="tr_mouseout(this)"> 
					     <td width="" align="center"><s:property value="#race.real_name"/></td>
					     <td width="" align="center"><s:property value="#race.user_address"/></td>
					     <td width="" align="center"><s:property value="#race.user_level"/></td>
					     <td width="" align="center"><s:property value="#race.user_phone"/></td>
					     <td width="" align="center"><s:property value="#race.race_date.substring(0,10)"/></td>
					     <td width="" align="center"><s:property value="#race.race_desc"/></td>
					     <td width="" align="center"><s:property value="#race.race_flagDesc"/></td>
					     <td width="" align="center"><s:property value="#race.race_scoreDesc"/></td>
					     <td width="" align="center">&nbsp;
					       <s:if test="#attr.task_status==1">
					       <s:a title="确定领养人" id="selectRace_%{#race.race_id}" href="javascript:void(0)">确定</s:a>
					       </s:if>
					       <s:elseif test="#attr.race.race_flag==3 && #attr.race.race_score==0">
					       <s:a title="确定打分" href="page_updateRaceScoreShow.action?paramsRace.race_id=%{#race.race_id}">打分</s:a>
					       </s:elseif>
					     </td>
					   </tr> 
					   </s:iterator>
					   <tr>
				       		<td height="30" colspan="9" align="center">
				       			<input type="button"  Class="btnstyle" value="返 回" onclick="window.history.back();"/>
				       		</td>
				       </tr>
					</s:if>
				    <s:else>
				    <tr>
				      <td height="60" colspan="9" align="center"><b>&lt;不存在申请信息&gt;</b></td>
				    </tr>
				    <tr>
			       		<td height="30" colspan="9" align="center">
			       			<input type="button"  Class="btnstyle" value="返 回" onclick="window.history.back();"/>
			       		</td>
			        </tr>
				    </s:else>
				 </table>
				 </form>
			</div>
			<div class="pages">
				<jsp:include page="page.jsp"></jsp:include>
			</div>
		</div>
	 <!--  购物车 -->
</div>
<jsp:include page="bottom.jsp"></jsp:include>
<script language="javascript" type="text/javascript">
    var task_id='<s:property value="#attr.task_id"/>';
    var task_status='<s:property value="#attr.task_status"/>';
    function serch()
	{
	   document.info.action="page_listRaces.action";
	   document.info.submit();
	}
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
	  document.info.action="page_listRaces.action";
	  document.info.submit();
	}
	function ChangePage(pagenum)
	{
		document.getElementById("pageNo").value=pagenum;
		document.info.action="page_listRaces.action";
		document.info.submit();
	}
	
	$(document).ready(function(){
		$("a[id^='selectRace']").bind('click',function(){
		    if(confirm('确定选为领养人吗!?'))
		    {
		    	var race_id=$(this).attr('id').split('_')[1];
		    	var aQuery = {
						'paramsRace.race_id':race_id
				};  
				$.post('page_selectRace.action',aQuery,
					function(responseObj) {
							if(responseObj.success) {	
								 alert('确认领养成功！');
								 window.location.href="page_listRaces.action?paramsRace.task_id="+task_id+"&paramsRace.task_status=2";
							}else  if(responseObj.err.msg){
								 alert('确认领养失败：'+responseObj.err.msg);
							}else{
								 alert('确认领养失败：服务器异常！');
							}	
				},'json');
		    }
		 });
		
	});
</script>
</body>
</html>