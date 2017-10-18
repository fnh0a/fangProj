<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head >
<title>显示所有数据</title>
 <style type="text/css">
.head{color: #0099FF}
</style>
</head>
<body  >
<div align="center"><span 	style="font-size: 24px;font-weight: bold;"	
>所有数据</span>&nbsp;|
  <a href="<%=path %>/user/showAll?year=${year}&month=${month}">刷新</a> &nbsp;|
  <a href="<%=path %>/user/showUser?year=${year}&month=${month}">返回</a>
    <a href="<%=path %>/user/login">退出</a> 
<br><br> 
<table border="0"  align="center" width="85%"
		cellpadding="0" cellspacing="0"  >
<tr class="head"><th>序号</th><th align="left">姓名</th><th align="left">表号 </th>
<th align="left">时间</th><th align="left"> 起码 </th><th align="left">止码 </th><th align="left">吨位 </th>
<th align="left">单价 </th>
<th align="left">金额 </th><th align="left">备注</th><th align="left">操作 </th></tr>
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
 	<a href="<%=path %>/user/delete?id=${mcBean.id}&year=${year}&month=${month}&all=1" onclick="return confirm('确定要删除[${mcBean.workername}]吗')">删除</a>
 	<a href="<%=path %>/user/toUpdateData?id=${mcBean.id}&all=1"  >修改</a>
 	<a href="<%=path %>/user/viewData?id=${mcBean.id}"  >查看</a>
 	<a href="<%=path %>/user/toCreateInvoice?id=${mcBean.id}"  >生成发票</a>  
 	</td>
 </tr>
 
 </c:forEach>
 <tr><td colspan="11" class="head">--------------------------------------------------------------------------------------------------------------------------------------------------------------------------</td> </tr>
 </table>
 <div style="text-align:center" class="head">
      <a href="?start=0&year=${year}&month=${month}">首  页</a>
		<a href="?start=${page.start-page.count<0?0:page.start-page.count}&year=${year}&month=${month}">上一页</a>
		<a href="?start=${page.start+page.count>page.last?page.last:page.start+page.count}&year=${year}&month=${month}">下一页</a>
		<a href="?start=${page.last}&year=${year}&month=${month}">末  页</a>
		每页显示${page.count}条   共${page.total}条记录
    </div>
 </div>
</body>
</html>
