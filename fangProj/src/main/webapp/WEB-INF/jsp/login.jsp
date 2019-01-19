<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>welcome</title>
</head>
<body   style="text-align: center; vertical-align: middle;" background='${pageContext.request.contextPath }/img/bg6.jpg' >
<br><br><br><br><br><br><br><br><br><br>
<div style="font-size: 20px;font-weight: bold;" align="center">
<span style="color: #FCFCFC">Welcome to Life Water Service Unlimited company Invoice System!<br/><br/></span>
<a href="<%=path %>/user/showUser" style="color: #FCFCFC">Please click to enter the system. </a>
</div>
</body>
</html>