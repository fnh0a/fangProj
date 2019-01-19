<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Record Detail</title>
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
	color: #ffffff;
	algin:left
}

.headInfo {
	font-size: 12px;
	color: #ffffff;
	padding-left: 15px
}

.txtBorder {
	border: 1px solid #ffffff
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
<body background='${pageContext.request.contextPath }/img/bg7.jpg'>
	<form action="<%=path%>/user/showUser" method="post">
		<table  align="center"  >
			<tr style="color: #ffffff">
				<td colspan="3" class="title" align="center">Record Detail</td>
			</tr>
			 
			<tr>
				<td>&nbsp;</td>
				<td class="head">Name:</td>
				<td style="color: #ffffff">${workInfo.workername}</td>
			</tr>


			<tr>
				<td>&nbsp;</td>
				<td class="head">Meter NO:</td>
				<td style="color: #ffffff">${workInfo.tableNo}</td>
				<td></td>
			</tr>


			<tr>
				<td>&nbsp;</td>
				<td class="head">Record Time:</td>
				<td style="color: #ffffff">${workInfo.time}</td>
				<td><span id="sp_repwd" class="spanErr"></span></td>
			</tr>


			<tr>
				<td>&nbsp;</td>
				<td class="head">Start Reading:</td>
				<td  style="color: #ffffff">${workInfo.startCode}</td>
			</tr>


			<tr>
				<td>&nbsp;</td>
				<td class="head">End Reading :</td>
				<td style="color: #ffffff">${workInfo.endCode}</td>

			</tr>
			<tr>
				<td>&nbsp;</td>
				<td class="head">Usage:</td>
				<td style="color: #ffffff">${workInfo.weight}</td>
			</tr>


			<tr>
				<td>&nbsp;</td>
				<td class="head">Unit Price:</td>
				<td style="color: #ffffff">${workInfo.price}</td>
			</tr>


			<tr>
				<td>&nbsp;</td>
				<td class="head">Total Amount:</td>
				<td  align="left" style="color: #ffffff">${workInfo.total}</td>

			</tr>

			<tr>
				<td>&nbsp;</td>
				<td class="head">Remarks:</td>
				<td align="left" style="color: #ffffff">${workInfo.remark}</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><input type="button" value="Back"  style="color:#5B5B5B"    onclick="javascript:history.back(-1);" />
					</td>
			</tr>

		</table>
	</form>
</body>
</html>