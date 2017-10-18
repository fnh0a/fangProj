<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head >
<title>首页</title>
<style type="text/css">
.head{color: #0099FF}
.txtBorder{border: 1px solid #66CCFF}
</style>

	<script type="text/javascript">
	function sss(){
		
		var selectedYear=document.getElementById('selectedYear').value;
		var selectedMon=document.getElementById('selectedMon').value;
		//alert(selectedYear+selectedMon);
	var clearStatus=document.getElementById('clearStatus').value;
	var clearStatus1=document.getElementById('clearStatus1').value;
	
	
		//alert(year+"-"+month);
		var date = new Date();

		var y = date.getFullYear();

		var m = date.getMonth() + 1;
 
	// alert("g"+clearStatus1);
		
	    if((clearStatus==''||clearStatus==null)&&selectedYear==''){
	    	//alert("g8");
			document.getElementById('selectedYear').value=y;
		} 
		 
	    if((clearStatus==''||clearStatus==null)&&selectedMon==''){
			document.getElementById('selectedMon').value=m;
		} 
	    if(selectedMon!=''){
			//y=document.getElementById('selectedYear').value;
			m=selectedMon;
			//alert("lll"+m);
		}
		for (i = 0; i < 10; i++) {

		var oP = document.createElement("option");

		var oText = document.createTextNode(y);

		oP.appendChild(oText);

		oP.setAttribute("value", y);
		if (selectedYear!=''&&y == selectedYear) {

			oP.setAttribute("selected", "selected");

			}
			;
		document.getElementById('year').appendChild(oP);

		y = y - 1;

		};
		var j = 1;
		for (i = 1; i < 13; i++) {

		var month = document.createElement("option");

		var monthText = document.createTextNode(j);

		month.appendChild(monthText);

		month.setAttribute("value", j);
		
		if (j == m) {

		month.setAttribute("selected", "selected");

		}
		;

		document.getElementById('month').appendChild(month);

		j = j + 1;
		};
	
		if(clearStatus=='year'){
			document.getElementById('year').value='';
			document.getElementById('isclear').value='clear';
		}
		if(clearStatus=='month'){
			document.getElementById('month').value='';
			document.getElementById('isclear').value='clear';
		}
		if(clearStatus=='yearmonth'){
			document.getElementById('year').value='';
			document.getElementById('month').value='';
			document.getElementById('isclear').value='clear';
		}
		//window.location.href="showUser";
	}
	function clear1(){
		document.getElementById('workername').value='';
		document.getElementById('tableNo').value='';
		//document.getElementById('year').value='';
		//document.getElementById('month').value='';
		//document.getElementById('isclear').value='clear';
		
	//	document.getElementById('selectedMon').value='';
		//document.getElementById('selectedYear').value='';
		
	}
	</script>
</head>
<body onload="sss()">
<div align="center"><span 	style="font-size: 24px;font-weight: bold;"	
>首页</span>|
 <a href="<%=path %>/user/toAddData">新增数据</a> |
  <a href="<%=path %>/user/showAll?year=${year}&month=${month}">查看所有数据</a> 
    <a href="<%=path %>/user/login">退出</a> 
  <br>  <br>
   <input id="selectedYear" value="${year}"   type="hidden" >
  <input id="selectedMon" value="${month}"   type="hidden"  >
  <input id="clearStatus1" value="${clearStatus1}"  type="hidden"    >
 
  <form action="<%=path %>/user/showUser" method="post"   >
    <input id="clearStatus"  name="clearStatus"   value="${clearStatus}" type="hidden"    >
    <input id="isclear"  name="isclear" type="hidden"  >
   <span class="head">姓名</span><input class="txtBorder" id="workername" name="workername" value="${workername}" type="text">
   <span class="head">表号</span> <input class="txtBorder" id="tableNo" name="tableNo" value="${tableNo}" type="text">
  <select  class="head" id="year" name="year"    >
  </select> &nbsp; &nbsp; &nbsp; &nbsp;
  <select class="head" id="month" name="month"  >
  </select>  &nbsp; &nbsp; &nbsp; &nbsp;
  <input type="submit" value="查询">
   <input type="submit" value="刷新">
   <input type="button" value="重置" onclick="clear1()" />
</form>
 
<br>
<table border="0"  align="center" width="85%"
		cellpadding="0" cellspacing="0"  >
<tr class="head"><th>序号</th><th align="left">姓名</th><th align="left">表号 </th>
<th align="left">时间</th><th align="left"> 起码 </th><th align="left">止码 </th><th align="left">吨位 </th>
<th align="left">单价 </th>
<th align="left">金额 </th><th align="left">备注</th><th align="left">操作</th></tr>
 <c:forEach var="mcBean" items="${mcList}" varStatus="mcStatus"> 
 <tr><td colspan="11" class="head">--------------------------------------------------------------------------------------------------------------------------------------------------------------------------</td> </tr>
 <tr>
 	<td align="center">${mcStatus.index+1+page.start}</td>
 	<td align="left">${mcBean.workername}</td>
 	<td align="left">${mcBean.tableNo}</td>
 	<td align="left">${mcBean.time}</td>
 	<td align="left">${mcBean.startCode}</td>
 	<td align="left">${mcBean.endCode}</td>
 	<td align="left">${mcBean.weight}</td>
 	<td align="left">${mcBean.price}</td>
 	<td align="left">${mcBean.total}</td>
 	<td align="left">${mcBean.remark}</td>
 	<td>
 	<a href="<%=path %>/user/delete?id=${mcBean.id}&year=${year}&month=${month}" onclick="return confirm('确定要删除[${mcBean.workername}]吗')">删除</a>
 	<a href="<%=path %>/user/toUpdateData?id=${mcBean.id}"  >修改</a>
 	<a href="<%=path %>/user/viewData?id=${mcBean.id}"  >查看</a>
 	<a href="<%=path %>/user/toCreateInvoice?id=${mcBean.id}"  >生成发票</a>
 	</td>
 </tr>
 
 </c:forEach>
 <tr><td colspan="11"class="head" >--------------------------------------------------------------------------------------------------------------------------------------------------------------------------</td> </tr>
 </table>
 <div style="text-align:center" class="head">
      <a href="?start=0">首  页</a>
		<a href="?start=${page.start-page.count<0?0:page.start-page.count}">上一页</a>
		<a href="?start=${page.start+page.count>page.last?page.last:page.start+page.count}">下一页</a>
		<a href="?start=${page.last}">末  页</a>
		每页显示${page.count}条   共${page.total}条记录
    </div>
 </div>
</body>
</html>
