<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<!--框架必需start-->
		<script type="text/javascript" src="js/jquery-1.4.js"></script>
		<script type="text/javascript" src="js/framework.js"></script>
		<link href="css/import_basic.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" id="skin"
			prePath="<%=basePath%>" />
		<!--框架必需end-->

		<script type="text/javascript" src="js/nav/ddaccordion.js"></script>
		<script type="text/javascript" src="js/text/text-overflow.js"></script>
		<style>
			a {
				behavior: url(js/method/focus.htc)
			}
			
			.categoryitems span {
				width: 160px;
			}
		</style>
	</head>

	<body leftFrame="true">
		<div id="scrollContent">
			<div class="arrowlistmenu" overflow="auto">
				<div class="menuheader expandable">
					<span class="normal_icon1"></span>计划管理
				</div>
				<ul class="categoryitems">
					<li>
						<a href="planManage!monthPlanMake.action" target="frmright"><span
							class="text_slice">月计划制定</span>
						</a>
						<a href="planManage!monthPlanAudit.action" target="frmright"><span
							class="text_slice">月计划审核</span>
						</a>
						<a href="planManage!weekPlanMake.action" target="frmright"><span
							class="text_slice">周计划制定</span>
						</a>
						<a href="planManage!dailyPlanMake.action" target="frmright"><span
							class="text_slice">日计划制定</span>
						</a>
						<a href="pdiFroemanManage!findDatePlanBySign.action" target="frmright"><span
							class="text_slice">交车工长签字</span>
						</a>
					</li>
				</ul>
			
				<div class="menuheader expandable">
					<span class="normal_icon2"></span>机车检修
				</div>
				<ul class="categoryitems">
				    <li>
						<a href="presetDivisionAction!presetDivisionInput.do?nodeId=106" target="frmright"><span
							class="text_slice">预设分类管理</span>
						</a>
					</li>
					<li>
						<a href="work/work/lead_division.jsp?nodeId=106" target="frmright"><span
							class="text_slice">工长分工</span>
						</a>
					</li>
					<li>
						<a href="work/work/worker_work.jsp" target="frmright"><span
							class="text_slice">接活</span>
						</a>
					</li>
					<li>
						<a href="work/sign/sign.jsp?rtype=1&nodeId=106&role=foreman" target="frmright"><span
							class="text_slice">工长签认</span>
						</a>
					</li>
					<li>
						<a href="work/sign/sign.jsp?rtype=2&nodeId=106&role=tech" target="frmright"><span
							class="text_slice">技术员签认</span>
						</a>
					</li>
					<li>
						<a href="work/sign/sign.jsp?rtype=3&nodeId=106&role=qi" target="frmright"><span
							class="text_slice">质检员签认</span>
						</a>
					</li>
					<li>
						<a href="work/sign/sign.jsp?rtype=4&nodeId=106&role=comm" target="frmright"><span
							class="text_slice">交车工长签认</span>
						</a>
					</li>
					<li>
						<a href="work/sign/sign.jsp?rtype=5&nodeId=106&role=accept" target="frmright"><span
							class="text_slice">验收员签认</span>
						</a>
					</li>
					<li>
						<a href="presetDivisionAction!techDivisionInput.do" target="frmright"><span
							class="text_slice">质检技术人员预分工</span>
						</a>
					</li>
					<li>
						<a href="reportWorkManage!reportWork.action" target="frmright"><span
							class="text_slice">报活</span>
						</a>
					</li>
					<li>
						<a href="reportWorkManage!reportWorkDistribution.action?role=dispatcher" target="frmright"><span
							class="text_slice">调度室报活派工</span>
						</a>
					</li>
				</ul>
				
					
				<div class="menuheader expandable">
					<span class="normal_icon3"></span>机车交验
				</div>
				<ul class="categoryitems">
				    <li>
						<a href="checkSign!checkSignInput.do?nodeId=107" target="frmright"><span
							class="text_slice">交车验收签到</span>
						</a>
					</li>
					<li>
						<a href="checkDealJc!checkDealJcInput.do" target="frmright"><span
							class="text_slice">机车验收交车</span>
						</a>
					</li>
					<li>
						<a href="zeroCheck!zeroCheckInput.do" target="frmright"><span
							class="text_slice">零公里检查</span>
						</a>
					</li>
					<li>
						<a href="zeroCheck!jcRollOutInput.do" target="frmright"><span
							class="text_slice">机车转出运用</span>
						</a>
					</li>
				</ul>
				
				<div class="menuheader expandable">
					<span class="normal_icon4"></span>检修记录
				</div>
				<ul class="categoryitems">
					    <li>
							<a href="report/main.jsp" target="_blank"><span
								class="text_slice">记名记录查询</span>
							</a>
						</li>
				</ul>
	</body>
</html>
