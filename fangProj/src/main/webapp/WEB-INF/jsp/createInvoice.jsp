<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Invoice</title>
<%@include file="print.jsp"%>
<style type="text/css">
.STYLE4 {font-family: "新宋体"}
.STYLE6 {font-size: 22px;}
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
</style>
<script type="text/javascript">
	function sss(){
		
		var sp = document.getElementById("sp_name");
		//alert(year+"-"+month);
		var date = new Date();

		var y = date.getFullYear();

		var m = date.getMonth() + 1;
		var d = date.getDate();
		sp.innerHTML=y+"-"+m+"-"+d+"";
		
	}
		</script>
</head>
<body onload="sss()">
<div align="center">
<br>
<table width="800" border="0"
		cellpadding="0" cellspacing="0"  >
		<tr>
		    <td colspan="2" rowspan="2"><div align="center" class="STYLE6">Invoice of Life Water Service Unlimited Company </div></td>
			<td>Invoice Code</td>
			<td>IL110220</td>
		</tr>
		<tr>
		<td>Invoice NO</td>
		<td>000000000000${workInfo.id} </td>
			
		</tr>
		<tr><td></td><td></td><td></td><td></td> </tr>
		<tr>
		    <td width="548" valign="bottom" align="left">Account name&nbsp;&nbsp;：&nbsp;Life Water Service</td>
			<td width="46" valign="bottom">&nbsp;</td>
			<td width="141" valign="bottom" align="right">&nbsp;&nbsp;&nbsp;&nbsp;Invoice Create Date:</td>
			<td width="187" valign="bottom"><span id="sp_name" class="spanErr"></span></td>
		</tr>
  </table>
	<table width="1000" height="378" border="1" align="center"
		cellpadding="0" cellspacing="0" bordercolor="#CC66FF">
		<tr>
			<td width="131" height="39"  align="left" ><span >
					<label><span  >Names</span></label>&nbsp;
			</span></td>
			<td width="75" align="left">${workInfo.workername}</td>
			<td colspan="2" align="center"><span >Charge for water detail</span></td>
		</tr>
		<tr>
			<td height="39"  align="left"><span >Meter NO</span></td>
			<td align="left"><span >${workInfo.tableNo}</span></td>
			<td width="277"><table width="100%" height="40">
					<tr>
						<td width="36%" align="left" >Use type   </td>
						<td width="37%" align="left" >Unit Price  </td>
						<td width="37%" align="left" >Usage   </td>
						<td width="10%" align="left" >Total Amount</td>
					</tr>
				</table></td>
			<td width="244"><table width="100%" border="0">
					<tr>
						<td width="44%" height="34" align="left" >Collection Fee Item</td>
						<td width="23%" >Unit Price</td>
						<td width="40%" >Total Amount</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td height="39"  align="left"><span >Contract NO</span></td>
			<td align="left" ><span >&nbsp;</span></td>
			<td rowspan="6" valign="top"><table width="100%" height="229"
					border="0">
					<tr>
						<td  width="30%"  height="35" align="left" >Resident</td>

						<td width="21%"  align="left" >${workInfo.total==144?"":workInfo.price}</td>
						<td width="20%"  align="left" >${workInfo.total==144?"":workInfo.weight}</td>
						<td  width="40%" align="left" >${workInfo.total==144?"":workInfo.total}</td>
					</tr>
					<tr>
						<td height="39"  align="left" >Non resident</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
					</tr>
					<tr>
						<td height="38" align="left">Special type</td>
						<td width="57" >&nbsp;</td>
						<td width="57" >&nbsp;</td>
						<td width="57" >&nbsp;</td>
					</tr>
					<tr>
						<td height="107" valign="bottom" >Charge subtotal:</td>
						<td colspan="3" valign="bottom" >${workInfo.total}</td>
					</tr>
				</table></td>
			<td rowspan="6" valign="top"><table width="100%" height="215" border="0">
					<tr>
						<td width="51%" height="33" align="left" >Basic water consumption/annual</td>
						<td width="23%" >&nbsp;</td>
						<td width="26%" >${workInfo.total==144?workInfo.total:""}</td>
					</tr>
					<tr>
						<td height="39" align="left"  >Charge for water resources</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
					</tr>
					<tr>
						<td height="39"  align="left" align="left" >Sewage treatment fee</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
					</tr>
					<tr>
						<td height="39" align="left"  >Waste disposal fee</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
					</tr>
					<tr>
						<td height="49" align="left" >Subtotal collection：</td>
						<td colspan="2" >&nbsp;</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td height="39"  align="left"><span >Record</span></td>
			<td align="left"><span >${workInfo.time}</span></td>
		</tr>
		<tr>
			<td height="39"  align="left"><span >Start Reading</span></td>
			<td align="left"><span >${workInfo.startCode}</span></td>
		</tr>
		<tr>
			<td height="39"  align="left"><span >End Reading</span></td>
			<td align="left"><span >${workInfo.endCode}</span></td>
		</tr>
		<tr>
			<td height="39"  align="left"><span >Usage(m³)</span></td>
			<td align="left"><span >${workInfo.weight}</span></td>
		</tr>
		<tr>
			<td height="15"><span >  &nbsp; &nbsp; &nbsp;</span></td>
			<td><span > &nbsp; &nbsp;</span> </td>
		</tr>
		<tr>
			<td height="39"  align="left" colspan="4"><table width="788">
					<tr>
						<td width="233" height="35" >Last balance：</td>
						<td width="164" >This receivable：</td>
						<td width="191" >This payment：${workInfo.total}</td>
						<td width="182" >This balance：</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td height="39"  align="left" colspan="4"><table width="793" height="40">
					<tr>
						<td width="517" height="28" >Total Amount：</td>
						<td width="264" >$：${workInfo.total}</td>
					</tr>
				</table></td>
		</tr>
	</table>
	<table width="800" border="0"
		cellpadding="0" cellspacing="0"  >
		<tr>
		    <td width="33%" valign="bottom" align="left">This page NO:1</td>
			<td width="33%" valign="bottom">Cashier：Amy</td>
			<td width="33%" valign="bottom"  >Tolls：New York</td>
		</tr>
  </table>
</div>
</body>
</html>