<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String path = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增数据</title>
<style type="text/css">
		body{font-family: "微软雅黑"}
		.title{font-size: 24px;font-weight: bold;}
		.head{font-size: 16px;font-weight: bold;color: #0099FF}
		.headInfo{font-size: 12px;color: #0099FF;padding-left: 15px}
		.txtBorder{border: 1px solid #66CCFF}
		.myButton{
					border:1px solid #0033CC;background-color: #66CCFF;font-size:16px;
					font-weight: bold; color: #3366FF;width: 60px; height: 40px;
				  }
		.spanErr{color: red;font-size: 10px;}
		.spanOK{color: green;font-size: 10px;}
	</style>
	<style>
  body {font-size:12px}
  td {text-align:center}
  h1 {font-size:26px;}
  h4 {font-size:16px;}
  em {color:#999; margin:0 10px; font-size:11px; display:block}
  </style>
	<script type="text/javascript">
function HS_DateAdd(interval,number,date){
 number = parseInt(number);
 if (typeof(date)=="string"){var date = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2])}
 if (typeof(date)=="object"){var date = date}
 switch(interval){
 case "y":return new Date(date.getFullYear()+number,date.getMonth(),date.getDate()); break;
 case "m":return new Date(date.getFullYear(),date.getMonth()+number,checkDate(date.getFullYear(),date.getMonth()+number,date.getDate())); break;
 case "d":return new Date(date.getFullYear(),date.getMonth(),date.getDate()+number); break;
 case "w":return new Date(date.getFullYear(),date.getMonth(),7*number+date.getDate()); break;
 }
}
function checkDate(year,month,date){
 var enddate = ["31","28","31","30","31","30","31","31","30","31","30","31"];
 var returnDate = "";
 if (year%4==0){enddate[1]="29"}
 if (date>enddate[month]){returnDate = enddate[month]}else{returnDate = date}
 return returnDate;
}

function WeekDay(date){
 var theDate;
 if (typeof(date)=="string"){theDate = new Date(date.split("-")[0],date.split("-")[1],date.split("-")[2]);}
 if (typeof(date)=="object"){theDate = date}
 return theDate.getDay();
}
function HS_calender(){
 var lis = "";
 var style = "";
 style +="<style type='text/css'>";
 style +=".calender { width:170px; height:auto; font-size:12px; margin-right:14px; background:url(calenderbg.gif) no-repeat right center #fff; border:1px solid #397EAE; padding:1px}";
 style +=".calender ul {list-style-type:none; margin:0; padding:0;}";
 style +=".calender .day { background-color:#EDF5FF; height:20px;}";
 style +=".calender .day li,.calender .date li{ float:left; width:14%; height:20px; line-height:20px; text-align:center}";
 style +=".calender li a { text-decoration:none; font-family:Tahoma; font-size:11px; color:#333}";
 style +=".calender li a:hover { color:#f30; text-decoration:underline}";
 style +=".calender li a.hasArticle {font-weight:bold; color:#f60 !important}";
 style +=".lastMonthDate, .nextMonthDate {color:#bbb;font-size:11px}";
 style +=".selectThisYear a, .selectThisMonth a{text-decoration:none; margin:0 2px; color:#000; font-weight:bold}";
 style +=".calender .LastMonth, .calender .NextMonth{ text-decoration:none; color:#000; font-size:18px; font-weight:bold; line-height:16px;}";
 style +=".calender .LastMonth { float:left;}";
 style +=".calender .NextMonth { float:right;}";
 style +=".calenderBody {clear:both}";
 style +=".calenderTitle {text-align:center;height:20px; line-height:20px; clear:both}";
 style +=".today { background-color:#ffffaa;border:1px solid #f60; padding:2px}";
 style +=".today a { color:#f30; }";
 style +=".calenderBottom {clear:both; border-top:1px solid #ddd; padding: 3px 0; text-align:left}";
 style +=".calenderBottom a {text-decoration:none; margin:2px !important; font-weight:bold; color:#000}";
 style +=".calenderBottom a.closeCalender{float:right}";
 style +=".closeCalenderBox {float:right; border:1px solid #000; background:#fff; font-size:9px; width:11px; height:11px; line-height:11px; text-align:center;overflow:hidden; font-weight:normal !important}";
 style +="</style>";

 var now;
 if (typeof(arguments[0])=="string"){
  selectDate = arguments[0].split("-");
  var year = selectDate[0];
  var month = parseInt(selectDate[1])-1+"";
  var date = selectDate[2];
  now = new Date(year,month,date);
 }else if (typeof(arguments[0])=="object"){
  now = arguments[0];
 }
 var lastMonthEndDate = HS_DateAdd("d","-1",now.getFullYear()+"-"+now.getMonth()+"-01").getDate();
 var lastMonthDate = WeekDay(now.getFullYear()+"-"+now.getMonth()+"-01");
 var thisMonthLastDate = HS_DateAdd("d","-1",now.getFullYear()+"-"+(parseInt(now.getMonth())+1).toString()+"-01");
 var thisMonthEndDate = thisMonthLastDate.getDate();
 var thisMonthEndDay = thisMonthLastDate.getDay();
 var todayObj = new Date();
 today = todayObj.getFullYear()+"-"+todayObj.getMonth()+"-"+todayObj.getDate();
 
 for (i=0; i<lastMonthDate; i++){  // Last Month's Date
  lis = "<li class='lastMonthDate'>"+lastMonthEndDate+"</li>" + lis;
  lastMonthEndDate--;
 }
 for (i=1; i<=thisMonthEndDate; i++){ // Current Month's Date

  if(today == now.getFullYear()+"-"+now.getMonth()+"-"+i){
   var todayString = now.getFullYear()+"-"+(parseInt(now.getMonth())+1).toString()+"-"+i;
   lis += "<li><a href=javascript:void(0) class='today' onclick='_selectThisDay(this)' title='"+now.getFullYear()+"-"+(parseInt(now.getMonth())+1)+"-"+i+"'>"+i+"</a></li>";
  }else{
   lis += "<li><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"+now.getFullYear()+"-"+(parseInt(now.getMonth())+1)+"-"+i+"'>"+i+"</a></li>";
  }
  
 }
 var j=1;
 for (i=thisMonthEndDay; i<6; i++){  // Next Month's Date
  lis += "<li class='nextMonthDate'>"+j+"</li>";
  j++;
 }
 lis += style;

 var CalenderTitle = "<a href='javascript:void(0)' class='NextMonth' onclick=HS_calender(HS_DateAdd('m',1,'"+now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+"'),this) title='Next Month'>&raquo;</a>";
 CalenderTitle += "<a href='javascript:void(0)' class='LastMonth' onclick=HS_calender(HS_DateAdd('m',-1,'"+now.getFullYear()+"-"+now.getMonth()+"-"+now.getDate()+"'),this) title='Previous Month'>&laquo;</a>";
 CalenderTitle += "<span class='selectThisYear'><a href='javascript:void(0)' onclick='CalenderselectYear(this)' title='Click here to select other year' >"+now.getFullYear()+"</a></span>年<span class='selectThisMonth'><a href='javascript:void(0)' onclick='CalenderselectMonth(this)' title='Click here to select other month'>"+(parseInt(now.getMonth())+1).toString()+"</a></span>月";

 if (arguments.length>1){
  arguments[1].parentNode.parentNode.getElementsByTagName("ul")[1].innerHTML = lis;
  arguments[1].parentNode.innerHTML = CalenderTitle;

 }else{
  var CalenderBox = style+"<div class='calender'><div class='calenderTitle'>"+CalenderTitle+"</div><div class='calenderBody'><ul class='day'><li>日</li><li>一</li><li>二</li><li>三</li><li>四</li><li>五</li><li>六</li></ul><ul class='date' id='thisMonthDate'>"+lis+"</ul></div><div class='calenderBottom'><a href='javascript:void(0)' class='closeCalender' onclick='closeCalender(this)'>×</a><span><span><a href=javascript:void(0) onclick='_selectThisDay(this)' title='"+todayString+"'>Today</a></span></span></div></div>";
  return CalenderBox;
 }
}
function _selectThisDay(d){
 var boxObj = d.parentNode.parentNode.parentNode.parentNode.parentNode;
  boxObj.targetObj.value = d.title;
  boxObj.parentNode.removeChild(boxObj);
}
function closeCalender(d){
 var boxObj = d.parentNode.parentNode.parentNode;
  boxObj.parentNode.removeChild(boxObj);
}

function CalenderselectYear(obj){
  var opt = "";
  var thisYear = obj.innerHTML;
  for (i=1970; i<=2020; i++){
   if (i==thisYear){
    opt += "<option value="+i+" selected>"+i+"</option>";
   }else{
    opt += "<option value="+i+">"+i+"</option>";
   }
  }
  opt = "<select onblur='selectThisYear(this)' onchange='selectThisYear(this)' style='font-size:11px'>"+opt+"</select>";
  obj.parentNode.innerHTML = opt;
}

function selectThisYear(obj){
 HS_calender(obj.value+"-"+obj.parentNode.parentNode.getElementsByTagName("span")[1].getElementsByTagName("a")[0].innerHTML+"-1",obj.parentNode);
}

function CalenderselectMonth(obj){
  var opt = "";
  var thisMonth = obj.innerHTML;
  for (i=1; i<=12; i++){
   if (i==thisMonth){
    opt += "<option value="+i+" selected>"+i+"</option>";
   }else{
    opt += "<option value="+i+">"+i+"</option>";
   }
  }
  opt = "<select onblur='selectThisMonth(this)' onchange='selectThisMonth(this)' style='font-size:11px'>"+opt+"</select>";
  obj.parentNode.innerHTML = opt;
}
function selectThisMonth(obj){
 HS_calender(obj.parentNode.parentNode.getElementsByTagName("span")[0].getElementsByTagName("a")[0].innerHTML+"-"+obj.value+"-1",obj.parentNode);
}
function HS_setDate(inputObj){
 var calenderObj = document.createElement("span");
 calenderObj.innerHTML = HS_calender(new Date());
 calenderObj.style.position = "absolute";
 calenderObj.targetObj = inputObj;
 inputObj.parentNode.insertBefore(calenderObj,inputObj.nextSibling);
}
  </script>
	    <script type="text/javascript">	
	    function check(){
	    	var startCode = document.getElementById("startCode").value;
	    	var endCode = document.getElementById("endCode").value;
	    	/* if (!startCode) {
	    		alert('起码是必填项！');
	    		return false;
			}
	    	if (!endCode) {
	    		alert('止码是必填项！');
	    		return false;
			} */
	    	if(startCode&&endCode){
	    		var use=endCode-startCode;
	    		if(use<0){
	    			alert('止码不能小于起码！');
	    			return false;
	    		}
	    		var weight =  document.getElementById("weight").value=use;
	    		if(use>48){
	    			//document.getElementById("price").value=3;
	    			document.getElementById("total").value=weight*document.getElementById("price").value;
	    			if(document.getElementById("remark").value=='每年保底48吨'){
	    				document.getElementById("remark").value='';
	    			}
	    		}
				if(use<=48){
	    			document.getElementById("price").value='';
	    			document.getElementById("total").value=144;
	    			document.getElementById("remark").value='每年保底48吨';
	    		}
	    		
	    	}
	    	
	    }
	    function check1(){
	    	document.getElementById("total").value=document.getElementById("weight").value*document.getElementById("price").value;
	    }
	    function checkall(){
	    	var workername = document.getElementById("workername").value;
	    	var tableNo = document.getElementById("tableNo").value;
	    	var time = document.getElementById("time").value;
	    	
	    	var startCode = document.getElementById("startCode").value;
	    	var endCode = document.getElementById("endCode").value;
	    	var total = document.getElementById("total").value;
	    	var weight = document.getElementById("weight").value;
	    	var price = document.getElementById("price").value;
	    	if(!workername){
	    		alert("姓名是必填y项！");
	    		return false;
	    	}
	    	 if(!tableNo){
	    		alert("表号是必填项！");
	    		return false;
	    	} 
	    	if(!time){
	    		alert("时间是必填项！");
	    		return false;
	    	}
	    	if(!startCode){
	    		alert("起码是必填项！");
	    		return false;
	    	}
	    	if(!endCode){
	    		alert("止码是必填项！");
	    		return false;
	    	}
	    	if(!weight){
	    		alert("吨位是必填项！");
	    		return false;
	    	}
	    	if(!total){
	    		alert("金额是必填项！");
	    		return false;
	    	}
	    	
	    	if(!checkDigtal(startCode)){
	    		return false;
	    	}
	    		
	    	if(!checkDigtal(endCode)){
	    		return false;
	    	}
	    	if(!checkDigtal(weight)){
	    		return false;
	    	}
	    	if(price!=''&&!checkDigtal(price)){
	    		return false;
	    	}
	    	if(!checkDigtal(total)){
	    		return false;
	    	}
	    	
	    	var date = new Date();

			var y = date.getFullYear();
			var m = date.getMonth() + 1;
			var d = date.getDate();
			if (m<10) {
				m="0"+m;
			}
			if (d<10) {
				d="0"+d;
			}
			var dd=""+y+m+d;
			//var timed=time.replace('-','').replace('-','').replace('-','');
			var y1 = time.split('-')[0];
			var m1 = time.split('-')[1];
			var d1= time.split('-')[2];
			document.getElementById("year").value=y1;
			document.getElementById("month").value=m1;
			if (m1.length==1&&m1<10) {
				m1="0"+m1;
			}
			if (d1.length==1&&d1<10) {
				d1="0"+d1;
			}
			var timed=""+y1+m1+d1;
			
			if (timed>dd) {
				alert("时间不能大于今天！"); 
				return false;
			}
			var timed1=""+y1+"-"+m1+"-"+d1;
			 document.getElementById("time").value=timed1;
	    	return true;
	    	
	    }
	    function checkDigtal(txt){
	    
	    	for(var i = 0 ; i < txt.length; i++){
	    		
				var ch = txt.toLowerCase().charAt(i);	//转换小写后取出每个字符，是否满足范围
				if( !(ch>='0'&&ch<='9') ){
					alert("'"+txt+"' 必须是纯数字！");
					return false;
				}
			}
	    	return true;
	    }
	    </script>
	
</head>
<body>
<form action="<%=path %>/user/addData" method="post"  onsubmit="return retcheckall()" >
    <table border="0" align="center">
    	<tr>
    		<td colspan="3" class="title">新增数据
    		 <input id="year"  name="year" type="hidden">
             <input id="month" name="month"  type="hidden">
    		</td>
	   	</tr>
 
    	<tr>
    		<td>&nbsp;</td>
    		<td class="head">姓名</td>
    		<td>
    			<input  id="workername" name="workername" class="txtBorder"  />
    		</td>
	   	</tr>
 
	   	
	   	<tr>
    		<td>&nbsp;</td>
    		<td class="head">表号</td>
    		<td>
    			<input id="tableNo" name="tableNo" class="txtBorder" />
    		</td>
    		<td>
    		 
    		</td>
	   	</tr>
	   	 
	   	
	   	<tr>
    		<td>&nbsp;</td>
    		<td class="head">时间</td>
    		<td>
    			<input  id="time" name="time" class="txtBorder" readonly="readonly"   onfocus="HS_setDate(this)"/>
    		</td>
	   	</tr>
	    
	   		   	
    	<tr>
    		<td>&nbsp;</td>
    		<td class="head"> 起码</td>
    		<td class="head"><input id="startCode" name="startCode" class="txtBorder" onblur="check()" />    		</td>
	   	</tr>
	   
    	<tr>
    		<td>&nbsp;</td>
    		<td class="head"> 止码 </td>
    		<td>
    			<input id="endCode" name="endCode" class="txtBorder" onblur="check()"/>
    			
    			</td>
		 <td><input type="button" onclick="check()" value="计算"/></td>
	   	</tr>
	   	<tr>
    		<td>&nbsp;</td>
    		<td class="head">吨位</td>
    		<td><input  id="weight" name="weight" class="txtBorder" onblur="check1()"/></td>
	   	</tr>
	   

    	<tr>
    		<td>&nbsp;</td>
    		<td class="head"> 单价</td>
    		<td><input id="price" name="price" class="txtBorder" value="3" onblur="check()"/></td>
	   	</tr>
	    
	   	
	   	<tr>
    		<td>&nbsp;</td>
    		<td class="head"> 金额</td>
    		<td><input id="total" name="total" class="txtBorder"   /></td>
    		 
	   	</tr>
	  
	   	 	<tr>
    		<td>&nbsp;</td>
    		<td class="head">备注</td>
    		<td><textarea id="remark" name="remark" class="txtBorder" ></textarea></td>
	   	</tr>
    	<tr>
    		<td>&nbsp;</td>
    		<td>&nbsp;</td>
    		<td>
    			<input type="submit" value="保存" onclick="return checkall()"   />
    			<input type="button" value="取消" onclick="javascript:history.back(-1);"/>
			</td>
	   	</tr>
    </table>
</form>
</body>
</html>