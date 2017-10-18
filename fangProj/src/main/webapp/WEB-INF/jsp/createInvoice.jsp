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
		sp.innerHTML=y+"年"+m+"月"+d+"日";
		
	}
		</script>
</head>
<body onload="sss()">
<div align="center">
<br>
<table width="800" border="0"
		cellpadding="0" cellspacing="0"  >
		<tr>
		    <td colspan="2" rowspan="2"><div align="center" class="STYLE6">荆州八岭山路遥水务有限公司发票</div></td>
			<td>发票代码</td>
			<td></td>
		</tr>
		<tr>
		<td>开票号码</td>
		<td>&nbsp; </td>
			
		</tr>
		<tr><td></td><td></td><td></td><td></td> </tr>
		<tr>
		    <td width="548" valign="bottom" align="left">户&nbsp;&nbsp;名：&nbsp;荆州八岭山镇</td>
			<td width="46" valign="bottom">&nbsp;</td>
			<td width="141" valign="bottom" align="right">&nbsp;&nbsp;&nbsp;&nbsp;开票日期:</td>
			<td width="187" valign="bottom"><span id="sp_name" class="spanErr"></span></td>
		</tr>
  </table>
	<table width="800" height="378" border="1" align="center"
		cellpadding="0" cellspacing="0" bordercolor="#CC66FF">
		<tr>
			<td width="131" height="39"  align="left" ><span >
					<label><span  >客户号0123</span></label>&nbsp;
			</span></td>
			<td width="75" align="left">${workInfo.workername}</td>
			<td colspan="2" align="center"><span >收 费 详
					情</span></td>
		</tr>
		<tr>
			<td height="39"  align="left"><span >水表号</span></td>
			<td align="left"><span >${workInfo.tableNo}</span></td>
			<td width="277"><table width="100%" height="40">
					<tr>
						<td width="30%" align="left" >用水类型</td>
						<td width="21%" align="left" >单价</td>
						<td width="20%" align="left" >水量</td>
						<td width="40%" align="left" >金额(元)</td>
					</tr>
				</table></td>
			<td width="244"><table width="100%" border="0">
					<tr>
						<td width="44%" height="34" align="left" >代收项目</td>
						<td width="23%" >单价</td>
						<td width="40%" >金额(元)</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td height="39"  align="left"><span >合同号</span></td>
			<td align="left" ><span >&nbsp;</span></td>
			<td rowspan="6" valign="top"><table width="100%" height="229"
					border="0">
					<tr>
						<td  width="30%"  height="35" align="left" >居民</td>

						<td width="21%"  align="left" >${workInfo.price}</td>
						<td width="20%"  align="left" >${workInfo.weight}</td>
						<td  width="40%" align="left" >${workInfo.total}</td>
					</tr>
					<tr>
						<td height="39"  align="left" >非居民</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
					</tr>
					<tr>
						<td height="38" align="left">特种</td>
						<td width="57" >&nbsp;</td>
						<td width="57" >&nbsp;</td>
						<td width="57" >&nbsp;</td>
					</tr>
					<tr>
						<td height="107" valign="bottom" >水费小计：</td>
						<td colspan="3" valign="bottom" >&nbsp;</td>
					</tr>
				</table></td>
			<td rowspan="6" valign="top"><table width="100%" height="215" border="0">
					<tr>
						<td width="51%" height="33" align="left" >公用附加费(保底)</td>
						<td width="23%" >&nbsp;</td>
						<td width="26%" >&nbsp;</td>
					</tr>
					<tr>
						<td height="39" align="left"  >水资源费</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
					</tr>
					<tr>
						<td height="39"  align="left" align="left" >污水处理费</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
					</tr>
					<tr>
						<td height="39" align="left"  >垃圾处理费</td>
						<td >&nbsp;</td>
						<td >&nbsp;</td>
					</tr>
					<tr>
						<td height="49" align="left" >代收小计：</td>
						<td colspan="2" >&nbsp;</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td height="39"  align="left"><span >起止月份</span></td>
			<td align="left"><span >${workInfo.time}</span></td>
		</tr>
		<tr>
			<td height="39"  align="left"><span >起码</span></td>
			<td align="left"><span >${workInfo.startCode}</span></td>
		</tr>
		<tr>
			<td height="39"  align="left"><span >止码</span></td>
			<td align="left"><span >${workInfo.endCode}</span></td>
		</tr>
		<tr>
			<td height="39"  align="left"><span >用水量(m³)</span></td>
			<td align="left"><span >${workInfo.weight}</span></td>
		</tr>
		<tr>
			<td height="15"><span >  &nbsp; &nbsp; &nbsp;</span></td>
			<td><span > &nbsp; &nbsp;</span> </td>
		</tr>
		<tr>
			<td height="39"  align="left" colspan="4"><table width="788">
					<tr>
						<td width="233" height="35" >上次余额：</td>
						<td width="164" >本次应收：</td>
						<td width="191" >本次缴款：${workInfo.total}</td>
						<td width="182" >本次余额：</td>
					</tr>
				</table></td>
		</tr>
		<tr>
			<td height="39"  align="left" colspan="4"><table width="793" height="40">
					<tr>
						<td width="517" height="28" >金额（大写）：</td>
						<td width="264" >¥：${workInfo.total}</td>
					</tr>
				</table></td>
		</tr>
	</table>
	<table width="800" border="0"
		cellpadding="0" cellspacing="0"  >
		<tr>
		    <td width="33%" valign="bottom" align="left">本页码</td>
			<td width="33%" valign="bottom">收款员：</td>
			<td width="33%" valign="bottom"  >收费点：</td>
		</tr>
  </table>
</div>
</body>
</html>