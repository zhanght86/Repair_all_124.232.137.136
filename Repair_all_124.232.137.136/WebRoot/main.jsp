<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@include file="/common/common.jsp" %>
<%@include file="/checkLogin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>机务检修信息管理系统</title>
	<!--框架必需start-->
	<script type="text/javascript" src="js/jquery-1.4.js"></script>
	<script type="text/javascript" src="js/bsFormat.js"></script>
	<link href="css/import_basic.css" rel="stylesheet" type="text/css"/>
	<link href="skins/sky/import_skin.css" rel="stylesheet" type="text/css" id="skin" themeColor="blue"/>
	<!--框架必需end-->
	<!--引入组件start-->
	<script type="text/javascript" src="js/attention/zDialog/zDrag.js"></script>
	<script type="text/javascript" src="js/attention/zDialog/zDialog.js"></script>
	<script type="text/javascript" src="js/attention/floatPanel.js"></script>
	<script type="text/javascript" src="js/attention/messager.js"></script>
	<!--引入弹窗组件end-->
	<link href="pro_dropdown_2/pro_dropdown_2.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="pro_dropdown_2/stuHover.js"></script>
	<!--[if IE 6]>
	<script src="js/iepngfx.js" language="javascript" type="text/javascript"></script>
	<![endif]-->
	<script type="text/javascript"> 
	$(function(){
		//查询报活
		$.post("workAction!countBZJtPreDict.do",null,function(text){
			var array = eval("("+text+")");
			var str = "";
			var obj;
			for ( var i=0; i<array.length;i++) {
				obj = array[i];
				<c:choose>
			  		<c:when test="${fn:containsIgnoreCase(sessionScope.session_user.roles,',GR,')}">
			  		   if(obj.projecttype==1){
							str +='<li><a href="workAction!listZxRatifyItemsInput.do?rjhmId='+obj.rjhmId+'&xx='+obj.xx+'" target="frmright"><span class="icon_lightOn">'+obj.jctype+"-"+obj.jcnum+"-"+obj.xx+'存在<font style="color:#f00;font-size:16px;font-weight:blod">'+obj.count+'</font>个未完成报活</span></a></li><div class="clear"></div>';
						}else{
							str +='<li><a href="workAction!listRatifyItemsInput.do?rjhmId='+obj.rjhmId+'&xx='+obj.xx+'" target="frmright"><span class="icon_lightOn">'+obj.jctype+"-"+obj.jcnum+"-"+obj.xx+'存在<font style="color:#f00;font-size:16px;font-weight:blod">'+obj.count+'</font>个未完成报活</span></a></li><div class="clear"></div>';
						}
			  		</c:when>
			  		<c:otherwise>
			  		     if(obj.projecttype==1){
							str +='<li><span class="icon_lightOn">'+obj.jctype+"-"+obj.jcnum+"-"+obj.xx+'存在<font style="color:#f00;font-size:16px;font-weight:blod">'+obj.count+'</font>个未完成报活</span></li><div class="clear"></div>';
						}else{
							str +='<li><span class="icon_lightOn">'+obj.jctype+"-"+obj.jcnum+"-"+obj.xx+'存在<font style="color:#f00;font-size:16px;font-weight:blod">'+obj.count+'</font>个未完成报活</span></li><div class="clear"></div>';
						}
			  		</c:otherwise>
				</c:choose>
			}
			if(str!=""){
				$.messager.lays(300, 200);
				$.messager.show('未完成报活','<div style="overflow: auto;height:165px;"><ul>'+str+'</ul></div>','stay');
			}
		});
	});
	</script>
</head>
<body>
<div id="mainFrame">
<!--头部与导航start-->
	<div id="hbox">
		<div id="bs_bannercenter">
			<div id="bs_bannerleft">
				<div id="bs_bannerright2">
					<div class="bs_banner_title"></div>
					<div id="bs_bannerright2">
						<div class="bs_banner_title"></div>
						<div class="nav_icon_h">
							<div class="nav_icon_h_item">
							<a href="<%=basePath%>help.jsp" target="frmright">
								<div class="nav_icon_h_item_img"><img src="icons/png/64.png"/></div>
								<div class="nav_icon_h_item_text">帮助文档</div>
							</a>
							</div>
							<div class="nav_icon_h_item">
							<a href="<%=basePath%>update_pwd.jsp" target="frmright">
								<div class="nav_icon_h_item_img"><img src="icons/png/pwd.png"/></div>
								<div class="nav_icon_h_item_text">修改密码</div>
							</a>
							</div>
							<div class="nav_icon_h_item">
							<a onclick='Dialog.confirm("确定要退出系统吗",function(){window.location="<%=basePath%>loginAction!loginOut.do"});'>
								<div class="nav_icon_h_item_img"><img src="icons/png/out.png"/></div>
								<div class="nav_icon_h_item_text">退出系统</div>
							</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<ul id="nav">
		<li class="top"><span style="font-size: 14px;float:left; display:block; padding:8px 24px 0 12px; height:35px;color: red;">欢迎你:${session_user.xm}</span><img src="images/9.png"/></li>
		<li class="top"><a href="<%=basePath%>loginAction!login.action?userid=${sessionScope.session_user.userid}"" class="top_link"><span>机车检修 </span></a><img src="images/9.png"/></li>
		<li class="top"><a href="pj_main.jsp" class="top_link"><span>配件检修</span></a><img src="images/9.png"/></li>
		<li class="top"><a href="ts_main.jsp" class="top_link"><span>探伤检修</span></a><img src="images/9.png"/></li>
		<li class="top"><a href="js_main.jsp" class="top_link"><span>技术管理</span></a><img src="images/9.png"/></li>
		<li class="top"><a href="plant_main.jsp" class="top_link"><span>车间管理</span></a><img src="images/9.png"/></li>
		<li class="top"><a href="bz_main.jsp" class="top_link"><span>标准管理</span></a><img src="images/9.png"/></li>
		<li class="top"><a href="plan_main.jsp" class="top_link"><span>计划管理</span></a><img src="images/9.png"/></li>
		<c:if test="${parameterValue == 1}">
			<li class="top"><a href="kq_main.jsp" class="top_link"><span>考勤管理</span></a><img src="images/9.png"/></li>
		</c:if>
		<li class="top"><a class="top_link"><span class="down">检修记录</span></a><img src="images/9.png"/>
			<ul class="sub">
				<li><a href="<%=basePath %>report/select_main.jsp" class="fly" target="frmright">机车检修记录</a>
						<ul>
							<li><a href="<%=basePath%>query!queryByXcxc.do?xcxc=Z" target="frmright">中&nbsp;&nbsp;修</a></li>
							<li><a href="<%=basePath%>query!queryByXcxc.do?xcxc=X" target="frmright">小&nbsp;&nbsp;修</a></li>
							<li><a href="<%=basePath%>query!queryByXcxc.do?xcxc=F" target="frmright">辅&nbsp;&nbsp;修</a></li>
							<li><a href="<%=basePath%>query!queryByXcxc.do?xcxc=LX" target="frmright">临&nbsp;&nbsp;修</a></li>
							<li><a href="<%=basePath%>query!queryByXcxc.do?xcxc=JG" target="frmright">加&nbsp;&nbsp;改</a></li>
							<li><a href="<%=basePath%>query!queryByXcxc.do?xcxc=QZ" target="frmright">整&nbsp;&nbsp;治</a></li>
							<li><a href="<%=basePath%>qz!findOilAssayPriRecorder.do" target="frmright">油&nbsp;&nbsp;水</a></li>
							<li><a href="<%=basePath%>query!queryByXcxc.do?xcxc=CJ" target="frmright">春&nbsp;&nbsp;鉴</a></li>
							<li><a href="<%=basePath%>report/lead_select.jsp" target="frmright">其&nbsp;&nbsp;他</a></li>
						</ul>
				</li>
				<li><a href="<%=basePath%>pjManageAction!inputPartRecord.do?jcStype=DF4D" target="frmright">配件检修记录</a></li>
			</ul>
		</li>
	</ul>
<!--头部与导航end-->
<div id="mainFrame">
	<table width="100%" cellpadding="0" cellspacing="0" class="table_border0">
		<tr>
			<!--左侧区域start-->
			<td id="hideCon" class="ver01 ali01">
				<div id="lbox">
					<div id="lbox_topcenter">
					<div id="lbox_topleft">
					<div id="lbox_topright">
						<div class="lbox_title">操作菜单</div>
					</div>
					</div>
					</div>
					<div id="lbox_middlecenter">
					<div id="lbox_middleleft">
					<div id="lbox_middleright">
							    <c:choose>
							      <c:when test="${fn:containsIgnoreCase(sessionScope.session_user.roles,',GR,') || 
							      				  fn:containsIgnoreCase(sessionScope.session_user.roles,',GZ,') ||
							      				  fn:containsIgnoreCase(sessionScope.session_user.roles,',ZJY,') ||
							      				  fn:containsIgnoreCase(sessionScope.session_user.roles,',JSY,') ||
							      				  fn:containsIgnoreCase(sessionScope.session_user.roles,',YSY,')
							      				  }">
							        <div id="bs_left" style="width:330px;">
							          <iframe scrolling="no" width="100%" height="100%"  frameBorder=0 id=frmleft name=frmleft src="workAction!receivedWorkInput.do"  allowTransparency="true"></iframe>
							        </div>
							      </c:when>
							      <c:when test="${fn:containsIgnoreCase(sessionScope.session_user.roles,',XTGL,')}">
								      	<div id="bs_left" style="width:250px;">
								        	<iframe scrolling="no" width="100%" height="100%"  frameBorder=0 id=frmleft name=frmleft src="admin/left.jsp"  allowTransparency="true"></iframe>
								        </div>
							      </c:when>
							      <c:otherwise>
								      <div id="bs_left">
								         <iframe scrolling="no" width="100%"  frameBorder=0 id=frmleft name=frmleft src="left.jsp"  allowTransparency="true"></iframe>
								      </div>
							      </c:otherwise>
							    </c:choose>
							<!--更改左侧栏的宽度需要修改id="bs_left"的样式-->
					</div>
					</div>
					</div>
					<div id="lbox_bottomcenter">
					<div id="lbox_bottomleft">
					<div id="lbox_bottomright">
						<div class="lbox_foot"></div>
					</div>
					</div>
					</div>
				</div>
			</td>
			<!--左侧区域end-->
			
			<!--中间栏区域start-->
			<td class="main_shutiao">&nbsp;
				<div class="bs_leftArr" id="bs_center" title="收缩面板"></div>
			</td>
			<!--中间栏区域end-->
			
			<!--右侧区域start-->
			<td class="ali01 ver01"  width="100%">
				<div id="rbox">
					<div id="rbox_topcenter">
					<div id="rbox_topleft">
					<div id="rbox_topright">
						<div class="rbox_title">
							操作内容
						</div>
					</div>
					</div>
					</div>
					<div id="rbox_middlecenter">
					<div id="rbox_middleleft">
					<div id="rbox_middleright">
						<div id="bs_right">
						       <c:choose>
						       		<c:when test="${fn:containsIgnoreCase(sessionScope.session_user.roles,',GZ,')}">
						       		    <!--work/work/lead_division.jsp?nodeId=106 -->
						       			<iframe scrolling="auto" overflow="auto" width="100%" height="100%" frameBorder="0" id="frmright" name="frmright" src="templete/open.html"  allowTransparency="true"></iframe>
						       		</c:when>
						       		<c:when test="${fn:containsIgnoreCase(sessionScope.session_user.roles,',GR,')}">
						       			<iframe scrolling="auto" overflow="auto" width="100%" height="100%" frameBorder="0" id="frmright" name="frmright" src="templete/open.html"  allowTransparency="true"></iframe>
						       		</c:when>
						       		<c:otherwise>
						       			<iframe scrolling="auto" overflow="auto" width="100%" frameBorder="0" id="frmright" name="frmright" src="templete/open.html"  allowTransparency="true"></iframe>
						       		</c:otherwise>
						       </c:choose>
						</div>
					</div>
					</div>
					</div>
					<div id="rbox_bottomcenter" >
					<div id="rbox_bottomleft">
					<div id="rbox_bottomright">
					</div>
					</div>
					</div>
				</div>
			</td>
			<!--右侧区域end-->
		</tr>
	</table>
</div>
</body>
</html>
