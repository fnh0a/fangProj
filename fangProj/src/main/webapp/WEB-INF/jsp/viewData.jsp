<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看详细信息</title>
<style type="text/css">
body {
	font-family: "微软雅黑"
}

.title {
	font-size: 24px;
	font-weight: bold;
}

.head {
	font-size: 16px;
	font-weight: bold;
	color: #0099FF
}

.headInfo {
	font-size: 12px;
	color: #0099FF;
	padding-left: 15px
}

.txtBorder {
	border: 1px solid #66CCFF
}

.myButton {
	border: 1px solid #0033CC;
	background-color: #66CCFF;
	font-size: 16px;
	font-weight: bold;
	color: #3366FF;
	width: 60px;
	height: 40px;
}

.spanErr {
	color: red;
	font-size: 10px;
}

.spanOK {
	color: green;
	font-size: 10px;
}
</style>
</head>
<body>
	<form action="<%=path%>/user/showUser" method="post">
		<table  align="center"  >
			<tr>
				<td colspan="3" class="title" align="center">详细信息</td>
			</tr>
			 
			<tr>
				<td>&nbsp;</td>
				<td class="head">姓名:</td>
				<td>${workInfo.workername}</td>
			</tr>


			<tr>
				<td>&nbsp;</td>
				<td class="head">表号:</td>
				<td>${workInfo.tableNo}</td>
				<td></td>
			</tr>


			<tr>
				<td>&nbsp;</td>
				<td class="head">时间:</td>
				<td>${workInfo.time}</td>
				<td><span id="sp_repwd" class="spanErr"></span></td>
			</tr>


			<tr>
				<td>&nbsp;</td>
				<td class="head">起码:</td>
				<td >${workInfo.startCode}</td>
			</tr>


			<tr>
				<td>&nbsp;</td>
				<td class="head">止码 :</td>
				<td>${workInfo.endCode}</td>

			</tr>
			<tr>
				<td>&nbsp;</td>
				<td class="head">吨位:</td>
				<td>${workInfo.weight}</td>
			</tr>


			<tr>
				<td>&nbsp;</td>
				<td class="head">单价:</td>
				<td>${workInfo.price}</td>
			</tr>


			<tr>
				<td>&nbsp;</td>
				<td class="head">金额:</td>
				<td>${workInfo.total}</td>

			</tr>

			<tr>
				<td>&nbsp;</td>
				<td class="head">备注:</td>
				<td>${workInfo.remark}</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><input type="button" value="返回"    onclick="javascript:history.back(-1);" />
					</td>
			</tr>

		</table>
	</form>
</body>
</html>