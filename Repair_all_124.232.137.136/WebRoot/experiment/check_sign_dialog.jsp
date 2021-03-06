<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/common/common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

request.setAttribute("recId",request.getParameter("recId"));
request.setAttribute("type",request.getParameter("type"));
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>左侧菜单</title>
<!--框架必需start-->
<script type="text/javascript" src="js/jquery-1.4.js"></script>
<script type="text/javascript" src="js/framework.js"></script>
<link href="css/import_basic.css" rel="stylesheet" type="text/css"/>
<link  rel="stylesheet" type="text/css" id="skin" prePath="<%=basePath%>"/>
<!--框架必需end-->

<!--截取文字start-->
<script type="text/javascript" src="js/text/text-overflow.js"></script>
<!--截取文字end-->

<!--修正IE6支持透明PNG图start-->
<script type="text/javascript" src="js/method/pngFix/supersleight.js"></script>
<!--修正IE6支持透明PNG图end-->
<script type="text/javascript">
	//更换登陆方式
	function loginType(n){
		if(n==0){//直接登陆
			$("#login_0").hide();
			$("#login_1").show();
			$("#tr_username").show();
			$("#tr_password").show();
			$("#card_num").hide();
			$("#cardnum").val("");
		}else{//刷卡登陆
			$("#login_0").show();
			$("#login_1").hide();
			$("#tr_username").hide();
			$("#tr_password").hide();
			$("#card_num").show();
			$("#username").val("");
			$("#password").val("");
		}
		$("#loginType").val(n);
	}
	
	function submitForm(){
		var uname=$("#username").val();
		var pwd=$("#password").val();
		var loginType = $("#loginType").val();
		var cardnum = $("#cardnum").val();
		if(loginType==0){//直接登陆
			if(uname==""){
				top.Dialog.alert("用户名不能为空!");
				return ;
			}
			if(pwd==""){
				top.Dialog.alert("密码不能为空!");
				return ;
			}		
		}else{//刷卡
			if(cardnum==""){
				top.Dialog.alert("请刷卡!");
				return ;
			}
		}
		$.post("<%=basePath%>checkSign!nrCheckSign.do",{"uname":uname,"pwd":pwd,"cardnum":cardnum},function(data){
			if(data=="failure"){
				top.Dialog.alert("签认失败!");
			}else if(data=="login_failure"){
				top.Dialog.alert("用户不存在!");
			}else if(data=="no_authority"){
				top.Dialog.alert("没有权限!");
			}else{
				var datas=data.split("-");
				var type=datas[0];
				if(type=="1"||type==1){//交车工长
					top.jcmain.jcgz_gdt.page_tab_index0.document.getElementById("gzId").value=datas[1]
					top.jcmain.jcgz_gdt.page_tab_index0.document.getElementById("gz").value=datas[2];
				    top.jcmain.jcgz_gdt.page_tab_index1.document.getElementById("gzId").value=datas[1]
				    top.jcmain.jcgz_gdt.page_tab_index1.document.getElementById("gz").value=datas[2];
				    top.jcmain.jcgz_gdt.page_tab_index2.document.getElementById("gzId").value=datas[1]
				    top.jcmain.jcgz_gdt.page_tab_index2.document.getElementById("gz").value=datas[2];
				    top.jcmain.jcgz_gdt.page_tab_index3.document.getElementById("gzId").value=datas[1]
				   	top.jcmain.jcgz_gdt.page_tab_index3.document.getElementById("gz").value=datas[2];
				    top.jcmain.jcgz_gdt.page_tab_index4.document.getElementById("gzId").value=datas[1]
				    top.jcmain.jcgz_gdt.page_tab_index4.document.getElementById("gz").value=datas[2];
				}else if(type=="2"||type==2){//质检技术
				    //top.frmright.page_tab_index4.document.getElementById("zj").value=datas[2];
					top.jcmain.jcgz_gdt.page_tab_index0.document.getElementById("zjId").value=datas[1];
				    top.jcmain.jcgz_gdt.page_tab_index0.document.getElementById("zj").value=datas[2];
				    top.jcmain.jcgz_gdt.page_tab_index1.document.getElementById("zjId").value=datas[1];
				    top.jcmain.jcgz_gdt.page_tab_index1.document.getElementById("zj").value=datas[2];
				    top.jcmain.jcgz_gdt.page_tab_index2.document.getElementById("zjId").value=datas[1]
				    top.jcmain.jcgz_gdt.page_tab_index2.document.getElementById("zj").value=datas[2];
				    top.jcmain.jcgz_gdt.page_tab_index3.document.getElementById("zjId").value=datas[1]
				    top.jcmain.jcgz_gdt.page_tab_index3.document.getElementById("zj").value=datas[2];
				    top.jcmain.jcgz_gdt.page_tab_index4.document.getElementById("zjId").value=datas[1]
				    top.jcmain.jcgz_gdt.page_tab_index4.document.getElementById("zj").value=datas[2];
				}else if(type=="3"||type==3){//验收员
					top.jcmain.jcgz_gdt.page_tab_index0.document.getElementById("ysId").value=datas[1];
				    top.jcmain.jcgz_gdt.page_tab_index0.document.getElementById("ys").value=datas[2];
				    top.jcmain.jcgz_gdt.page_tab_index1.document.getElementById("ysId").value=datas[1];
				    top.jcmain.jcgz_gdt.page_tab_index1.document.getElementById("ys").value=datas[2];
				    top.jcmain.jcgz_gdt.page_tab_index2.document.getElementById("ysId").value=datas[1]
				    top.jcmain.jcgz_gdt.page_tab_index2.document.getElementById("ys").value=datas[2];
				    top.jcmain.jcgz_gdt.page_tab_index3.document.getElementById("ysId").value=datas[1]
				    top.jcmain.jcgz_gdt.page_tab_index3.document.getElementById("ys").value=datas[2];
				    top.jcmain.jcgz_gdt.page_tab_index4.document.getElementById("ysId").value=datas[1]
				    top.jcmain.jcgz_gdt.page_tab_index4.document.getElementById("ys").value=datas[2];
				}
				$("#cardnum").val("");
				$("#username").val("");
				$("#password").val("");
				top.Dialog.alert("签认成功!");
			}
		});
	}
	
	function closeDialog(){
		top.Dialog.close();
	}
</script>
<script type="text/javascript" src="js/timer2.src.js"></script> 
<script type='text/javascript'>
var CallShowMsg = function(){
	var xx = document.getElementById("x");
	xx.Test('这是读卡数据：');
	document.getElementById("cardnum").value=xx.Msg;
	if (document.getElementById("cardnum").value!=""){
		//alert(document.all.idkid.value); 
		//alert(document.all.idkid.value); 
		//submitForm();
	}
}
//CallShowMsg()
var timer = new Timer(50); 
var globalTimer = new Timer(1000); 

function init() { 
	timer.addEventListener(TimerEvent.TIMER, calTime); 
	timer.start(); 
	globalTimer.addEventListener(TimerEvent.TIMER, controlTime); 
	globalTimer.start(); 
} 

function controlTime() { 
	if (!timer.running) { 
		timer.reset(); 
		timer.start(); 
	} 
} 

function calTime() { 
	CallShowMsg();
	var v=document.getElementById("cardnum").value;
	if (v != null) { 
		timer.stop(); 
		document.getElementById("cardnum").value=x.Msg; 
		CallShowMsg();
	} 
} 
window.onload = init;
</script>
</head>
<body>
<form action="" method="post" id="form">
<input type="hidden" id="loginType" name="loginType" value="0"/>
<input type="hidden" id="type" name="type" value="${type}"/>
<input type="hidden" id="djmId" name="djmId" value="${djm.jymxId}"/>
<table class="tableStyle" transMode="true">
	<tr ><td><a href="javascript:loginType(1);" id="login_1" style="margin-left: 10px;">刷卡签认</a>
			<a href="javascript:loginType(0);" id="login_0" style="margin-left: 10px;display: none;">直接签认</a></td>
	</tr>
	<tr id="tr_username"><td>用户名：</td><td><input type="text" style="width: 150px;" id="username" name="username"/></td></tr>
	<tr id="tr_password"><td>密码：</td><td><input type="password" style="width: 150px;" id="password" name="password"/></td></tr>
	<tr id="card_num" style="display: none;"><td>刷卡：</td><td><input type="text" style="width: 150px;" id="cardnum" name="cardnum"/></td></tr>
	<tr>
		<td colspan="2">
			<object width="32" height="32" title="MyActiveX" id="x" name="x" classid="clsid:A4D8D89A-CF2A-49BB-B703-25E48360D2A8" codebase="ActiveX.CAB#version=1,0,0,0"></object>
			<input type="button" value=" 确 定 " onclick="submitForm();"/>
			<input type="reset" value=" 关 闭 " onclick="closeDialog();"/>
		</td>
	</tr>
</table>
</form>
</body>
</html>