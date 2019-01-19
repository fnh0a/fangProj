<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head >
<title>View All Records</title>
 <style type="text/css">
.head{color:  #ADADAD }
</style>
</head>
<body  background='${pageContext.request.contextPath }/img/bg7.jpg'>
<div align="center"><span 	style="font-size: 24px;font-weight: bold;color:  #ffffff"	
>All Records</span>&nbsp;|
  <a href="<%=path %>/user/showAll?year=${year}&month=${month}" style="color: #ffffff"> Refresh</a> &nbsp;|
  <a href="<%=path %>/user/showUser?year=${year}&month=${month}" style="color: #ffffff"> Back</a> &nbsp;|
    <a href="<%=path %>/user/login" style="color: #ffffff">    Exit</a> 
<br><br> 
<table border="0"  align="center" width="85%"
		cellpadding="0" cellspacing="0"  >
<tr class="head"><th>Serial NO</th><th align="left">Name</th><th align="left">Meter NO </th>
<th align="left">Record Time</th><th align="left">  Start Reading </th><th align="left"> End Reading </th><th align="left">Usage </th>
<th align="left">Unit Price </th>
<th align="left">Total Amount </th><th align="left">Remarks</th><th align="left">Operation </th></tr>
 <c:forEach var="mcBean" items="${mcList}" varStatus="mcStatus"> 
 <tr><td colspan="11" class="head">--------------------------------------------------------------------------------------------------------------------------------------------------------------------------</td> </tr>
 <tr style="color: #ffffff">
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
 	<a href="<%=path %>/user/delete?id=${mcBean.id}&year=${year}&month=${month}&all=1" style="color: #ffffff" onclick="return confirm('Are you sure to delete[${mcBean.workername}]?')">Delete</a>
 	<a href="<%=path %>/user/toUpdateData?id=${mcBean.id}&all=1" style="color: #ffffff" > Update</a>
 	<a href="<%=path %>/user/viewData?id=${mcBean.id}"  style="color: #ffffff">View</a>
 	<a href="<%=path %>/user/toCreateInvoice?id=${mcBean.id}" style="color: #ffffff" >Create Invoice</a>  
 	</td>
 </tr>
 
 </c:forEach>
 <tr><td colspan="11" class="head">--------------------------------------------------------------------------------------------------------------------------------------------------------------------------</td> </tr>
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
