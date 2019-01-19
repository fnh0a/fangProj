<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head  >
<title>HomePage</title>
<style type="text/css">
.head{color: #ADADAD}
.txtBorder{border: 1px solid #ffffff}
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
<body onload="sss()" background='${pageContext.request.contextPath }/img/bg7.jpg' >
<div align="center"><span style="font-size: 24px;font-weight: bold;"	
style="color: #ffffff">HomePage </span>|
 <a href="<%=path %>/user/toAddData" style="color: #ffffff"> To Add Record </a> |
  <a href="<%=path %>/user/showAll?year=${year}&month=${month}" style="color: #ffffff"> To View All Records</a> |
    <a href="<%=path %>/user/login" style="color: #ffffff"> Exit</a> 
  <br>  <br>
   <input id="selectedYear" value="${year}"   type="hidden" >
  <input id="selectedMon" value="${month}"   type="hidden"  >
  <input id="clearStatus1" value="${clearStatus1}"  type="hidden"    >
 
  <form action="<%=path %>/user/showUser" method="post"   >
    <input id="clearStatus"  name="clearStatus"   value="${clearStatus}" type="hidden"    >
    <input id="isclear"  name="isclear" type="hidden"  >
   <span class="head">Name</span><input class="txtBorder" id="workername" name="workername" value="${workername}" type="text">
   <span class="head">Meter NO</span> <input class="txtBorder" id="tableNo" name="tableNo" value="${tableNo}" type="text">
  <select  class="head" id="year" name="year" style="color: #000000"   >
  </select> &nbsp; &nbsp; &nbsp; &nbsp;
  <select class="head" id="month" name="month"  style="color: #000000" >
  </select>  &nbsp; &nbsp; &nbsp; &nbsp;
  <input type="submit" value="Search" style="color:#5B5B5B">
   <input type="submit" value="Refresh" style="color: #5B5B5B" >
   <input type="button" value="Reset" onclick="clear1()" style="color: #5B5B5B"/>
</form>
 
<br>
<table border="0"  align="center" width="85%"
		cellpadding="1" cellspacing="0"  >
<tr class="head"><th> Serial NO </th><th align="left">Name </th><th align="left">Meter NO </th>
<th align="left">Record Time </th><th align="left"> Start Reading  </th><th align="left"> End Reading   </th><th align="left"> Usage  </th>
<th align="left">Unit Price </th>
<th align="left">Total Amount </th><th align="left">Remarks  </th><th align="left"> Operation</th></tr>
 <c:forEach var="mcBean" items="${mcList}" varStatus="mcStatus"> 
 <tr><td colspan="11" class="head">--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</td> </tr>
 <tr style="color: #ffffff">
 	<td align="center"   >${mcStatus.index+1+page.start}</td>
 	<td align="left"  >${mcBean.workername}</td>
 	<td align="left" >${mcBean.tableNo}</td>
 	<td align="left" >${mcBean.time}</td>
 	<td align="left"  > ${mcBean.startCode}</td>
 	<td align="left"  >${mcBean.endCode}</td>
 	<td align="left">${mcBean.weight}</td>
 	<td align="left">${mcBean.price}</td>
 	<td align="left">${mcBean.total}</td>
 	<td align="left">${mcBean.remark}</td>
 	<td>
 	<a href="<%=path %>/user/delete?id=${mcBean.id}&year=${year}&month=${month}" style="color: #ffffff" onclick="return confirm('Are you sure to delete[${mcBean.workername}]?')">Delete</a>
 	<a href="<%=path %>/user/toUpdateData?id=${mcBean.id}"  style="color: #ffffff"> |Update</a>
 	<a href="<%=path %>/user/viewData?id=${mcBean.id}"  style="color: #ffffff"> |View</a>
 	<a href="<%=path %>/user/toCreateInvoice?id=${mcBean.id}" style="color: #ffffff" > |Create Invoice</a>
 	</td>
 </tr>
 
 </c:forEach>
 <tr><td colspan="11"class="head" >--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------</td> </tr>
 </table>
 <div style="text-align:center" class="head">
      <a href="?start=0" style="color: #ffffff">FirstPage</a> | 
		<a href="?start=${page.start-page.count<0?0:page.start-page.count}" style="color: #ffffff">Page up </a> |
		<a href="?start=${page.start+page.count>page.last?page.last:page.start+page.count}" style="color: #ffffff">Page down</a> |
		<a href="?start=${page.last}" style="color: #ffffff">End page</a> |
		<span style="color: #ffffff"> ${page.count} Records Per Page |  ${page.total} Records In All</span>
    </div>
 </div>
</body>
</html>
