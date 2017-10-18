<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>欢迎界面</title>
</head>
<body   style="text-align: center; vertical-align: middle;">
<br><br><br><br><br><br><br><br><br><br>
<div style="font-size: 38px;font-weight: bold;color: #0099FF" align="center">

<a href="<%=path %>/user/showUser">进入管理系统</a>
</div>
</body>
</html>