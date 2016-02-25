<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="/common/common.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--框架必需start-->
<link href="css/import_basic.css" rel="stylesheet" type="text/css"/>
<link href="skins/sky/import_skin.css" rel="stylesheet" type="text/css" id="skin" themeColor="blue"/>
<script type="text/javascript" src="js/jquery-1.4.js"></script>
<script type="text/javascript" src="js/bsFormat.js"></script>
<!--框架必需end-->

<!--引入组件start-->
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<!--引入弹窗组件end-->

<!--修正IE6支持透明png图片start-->
<script type="text/javascript" src="js/method/pngFix/supersleight.js"></script>
<!--修正IE6支持透明png图片end-->
<script type="text/javascript" src="js/menu/jkmegamenu.js"></script>
<title>无标题文档</title>
<style>
	body,html{
		padding:0px;
		margin:0px;
		width:100%;
		height:100%;
		overflow: hidden;
	}
	#lists{
		float:left;
		width:100%;
		height:100%;
		overflow: auto;
	}

	#listitems{
		border:1px solid green;
		width:100%;
		height:100%;
		border-collapse: collapse;
		margin-left:5px;
		overflow: auto;
	}
	#listitems th{
		text-align:center;
		height:40px;
		line-height:40px;
		font-weight:bold;
		overflow: auto;
	}
	#listitems td,#listitems th{
		border:1px solid green;
		font:12px arial,宋体,sans-serif;
		overflow: auto;
	}
	#listitems td{
		padding-left:1px;
		padding-top:2px;
		padding-bottom:2px;
		overflow: auto;
	}
	#maps{
		background:url(images/1.jpg) left top no-repeat;
		width:1000px;
		height:1000px;
		position:absolute;
		border-left:1px solid #a0a0a0;
		left:0px;
		overflow: auto;
	}
	#content{
		position:relative;
		left:0px;
		width:100%;
		float:left;
		height:100%;
		background-color:#c0c0c0;
		text-align: center;
		overflow: scroll;
	}
	.box{
		width:35px;
		height:16px;
		line-height:16px;
		border:1px solid #999;
		text-align:center;
		position:absolute;
		background-color:#fff;	
	}
	div.k2{
		border:3px dashed #000;
		position: absolute;
		left:280px;
		top:44px;
		width:117px;
		height:58px;
	}
	div.k3{
		border:3px dashed #C0F;
		position: absolute;
		left:292px;
		top:142px;
		width:117px;
		height:56px;
	}
	div.k4{
		border:3px dashed red;
		position: absolute;
		left:440px;
		top:44px;
		width:117px;
		height:59px;
	}
	div.k5{
		border:3px dashed #000;
		position: absolute;
		left:440px;
		top:556px;
		width:182px;
		height:90px;
	}
	.box a{
		display:block;
		text-decoration:none;
		font-size:12px;
		font-weight:bold;
	}
	div.blue{
		background:blue;
	}
	div.green{
		background:#067d06;
	}
	div.red{
		background-color:red;
	}
	div.black{
		background-color:black;
	}
	div.yellow{
		background-color: #ff9600
	}
	div.blue a,div.red a,div.black a,div.yellow a{
		color:#FFF;
	}
	div.green a{
		color:#FFF;
	}
</style>
<link href="<%=basePath %>report/css/global.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath %>js/lhgdialog/skins/blue.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="js/jquery-1.4.js"></script>
<script type="text/javascript" src="<%=basePath %>js/lhgdialog/lhgdialog.js"></script>
<script type="text/javascript">
	//-1-新建 , 0-在修  1-待验  2-已交
	var data=${jcJSON};
	var dd;
	
	$(document).ready(function(){
		//var gtimes={};
		for(var i=0;i<data.length;i++){
			var gdh=data[i].gdh;
			var tar=$('div[group="'+gdh+'"]').eq(data[i].tw-1);
			if(data[i].statue==2){//已交
				tar.addClass('green');
			}else if(data[i].statue==1){//待验
				tar.addClass('yellow');
			}else if(data[i].statue==0){
				tar.addClass('blue');
			}else{//新建
				tar.addClass('red');
			}
			tar.html('<a href="javascript:void(0);"id="'+data[i].jcnum+'" class="jTip" name="<%=basePath %>report!getInfoDetail.do?rjhmId='+data[i].rjhmId+'">'+data[i].jcnum+'</a>');
		}

		$('.jTip').bind('click',function(event){
			var url=$(event.target).attr('name');
			 $(document).ready(function () {
            	dd =$.dialog({
	                title:"机车信息",
	                content:'url:'+url+'&temp='+new Date().getTime(),
	                height:500,
	                max:false,
	                min:false
	            });
        	})
		});
		
		setInterval(function(){//定时刷新
			if(dd!=undefined && dd.closed==false){
				dd.close();
			}
			window.location.reload();
		},29*60*1000);
	
	});
	
	$(function(){
		jkmegamenu.definemenu("megaanchor1", "megamenu1", "mouseover");
		//jkmegamenu.definemenu("megaanchor2", "megamenu2", "mouseover");
		//jkmegamenu.definemenu("megaanchor3", "megamenu3", "mouseover");
		//jkmegamenu.definemenu("megaanchor4", "megamenu4", "mouseover");
		//jkmegamenu.definemenu("megaanchor5", "megamenu5", "mouseover");
	});
	
	function clickGD(rjhmId){
		var url="<%=basePath %>report!getInfoDetail.do?rjhmId="+rjhmId;
		$(document).ready(function () {
           	dd =$.dialog({
                title:"机车信息",
                content:'url:'+url+'&temp='+new Date().getTime(),
                height:500,
                max:false,
                min:false
            });
        })
	}

</script>
</head>

<body>
<br/>
 <center>
 		<table id="tab" style=" width:70%; height:30px;margin-top:0px; ">	
		    <tr>
			  <td style="font-size: 13px;margin-top: 10px;"><a href="<%=basePath %>report/select_main.jsp" id="megaanchor1">机车检修管理</a>
			    <div id="megamenu1" class="simplemenu" style="width:100px;">
					<ul>
						<li><a href="<%=basePath%>query!query.do?lastOne=1&xcxc=Z&startTime=''&endTime=''&jcType=0&jcNum=0" target="_blank">中&nbsp;&nbsp;修</a></li>
						<li><a href="<%=basePath%>query!query.do?lastOne=1&xcxc=X&startTime=''&endTime=''&jcType=0&jcNum=0" target="_blank">小&nbsp;&nbsp;修</a></li>
						<li><a href="<%=basePath%>query!query.do?lastOne=1&xcxc=F&startTime=''&endTime=''&jcType=0&jcNum=0" target="_blank">辅&nbsp;&nbsp;修</a></li>
						<li><a href="<%=basePath%>query!query.do?lastOne=1&xcxc=LX&startTime=''&endTime=''&jcType=0&jcNum=0" target="_blank">临&nbsp;&nbsp;修</a></li>
						<li><a href="<%=basePath%>query!query.do?lastOne=1&xcxc=JG&startTime=''&endTime=''&jcType=0&jcNum=0" target="_blank">加&nbsp;&nbsp;改</a></li>
						<li><a href="<%=basePath%>query!query.do?lastOne=1&xcxc=QZ&startTime=''&endTime=''&jcType=0&jcNum=0" target="_blank">整&nbsp;&nbsp;治</a></li>
						<li><a href="<%=basePath%>query!query.do?lastOne=1&xcxc=CJ&startTime=''&endTime=''&jcType=0&jcNum=0" target="_blank">春&nbsp;&nbsp;鉴</a></li>
						<li><a href="<%=basePath %>report/select_main.jsp" target="_blank">其&nbsp;&nbsp;他</a></li>
					</ul>
				</div>
			  </td>
			  <!-- 
			  <td style="font-size: 13px"><a href="javascript:void(0)" id="megaanchor2">配件检修管理</a>
			  	<div id="megamenu2" class="simplemenu" style="width:110px;">
					<ul>
						<li><a href="javascript:void(0)" target="_blank">配件配送管理</a></li>
						<li><a href="javascript:void(0)" target="_blank">大部件检修</a></li>
						<li><a href="javascript:void(0)" target="_blank">其它备件管理</a></li>
					</ul>
				</div>
			  </td> 
			  <td style="font-size: 13px"><a href="javascript:void(0)" id="megaanchor3">配件周转管理</a>
			  	<div id="megamenu3" class="simplemenu" style="width:110px;">
					<ul>
						<li><a href="javascript:void(0)" target="_blank">配件身份</a></li>
						<li><a href="javascript:void(0)" target="_blank">中心配件库</a></li>
						<li><a href="javascript:void(0)" target="_blank">配件交接</a></li>
						<li><a href="javascript:void(0)" target="_blank">配件周期</a></li>
					</ul>
				</div>
			  </td>
			  <td style="font-size: 13px"><a href="javascript:void(0)" id="megaanchor4">技术标准管理</a>
			  	<div id="megamenu4" class="simplemenu" style="width:110px;">
					<ul>
						<li><a href="javascript:void(0)" target="_blank">大中修标准</a></li>
						<li><a href="javascript:void(0)" target="_blank">小辅修标准</a></li>
						<li><a href="javascript:void(0)" target="_blank">验收规程</a></li>
						<li><a href="javascript:void(0)" target="_blank">作业指导书</a></li>
						<li><a href="javascript:void(0)" target="_blank">配件检修标准</a></li>
						<li><a href="javascript:void(0)" target="_blank">其它标准</a></li>
					</ul>
				</div>
			  </td>
			  <td style="font-size: 13px"><a href="javascript:void(0)" id="megaanchor5">检修车间管理</a>
			  	<div id="megamenu5" class="simplemenu" style="width:110px;">
					<ul>
						<li><a href="javascript:void(0)" target="_blank">考勤</a></li>
						<li><a href="javascript:void(0)" target="_blank">班组</a></li>
						<li><a href="javascript:void(0)" target="_blank">规章</a></li>
						<li><a href="javascript:void(0)" target="_blank">问题库</a></li>
					</ul>
				</div>
			  </td>
			   -->
			  <%--
			  <td valign="bottom">
			  <form method="post" action="<%=basePath%>query!query.do" target="_blank">
			  	时间：<input class="cusDate" type="text" id="time" onfocus="javascript:WdatePicker({dateFmt:'MM-dd H:mm'})" name="startTime"/>
			  	<input type="submit" value="查&nbsp;&nbsp;询" style="width:70px;height:20px;"/>
			  	</form>
			  </td>
			   --%>
			</tr>
  		</table>
  </center>

<table style="width: 100%;height:100%;" cellspacing="0" class="table_border0">
	<tr >
		<!--左侧区域start-->
		<td id="hideCon" class="ver01 ali01">
			<div>
				<div id="lbox_topcenter">
					<div id="lbox_topleft">
						<div id="lbox_topright">
							<div class="lbox_title">操作菜单</div>
						</div>
					</div>
				</div>
				
				<div id="lbox_middlecenter" >
					<div id="lbox_middleleft">
						<div id="lbox_middleright" >
							<div id="bs_left" style="width:500px; height:525px;">
									<div id="lists">
								    	<table id="listitems">
								        	<tr>
								            	<th>序号</th>
								                <th>机车号</th>
								                <th>修程</th>
								                <th>股道</th>
								                <th>扣车时间</th>
								                <th>计划起机时间<br/>实际起机时间</th>
									            <th>计划交车时间<br/>实际交车时间</th>
									            <th>状态</th>
								            	<th>备注</th>
							         	   </tr>	
								            <c:forEach items="${allJC }" var="plan" varStatus="index">
									            <tr>
									            	<td align="center">${index.index+1 }</td>
									                <td align="center"><a style="position:static;" href="<%=basePath%>query!getInfoByJC.do?jcStype=${plan.jcType }&jcNum=${plan.jcnum }&xcxc=${plan.fixFreque}" target="_blakn">${plan.jcType }-${plan.jcnum }</a></td>
									                <td align="center">${plan.fixFreque }</td>
									                <td align="center"><a style="position:static;" href="javascript:void(0);" onclick="clickGD(${plan.rjhmId } )">${plan.gdh }道</a></td>
									                <td align="center">${fn:substring(plan.kcsj,5,16) }</td>
									                <td align="center">${fn:substring(plan.jhqjsj,5,16) }<br/>${fn:substring(plan.sjqjsj,5,16) }</td>
									                <td align="center">${fn:substring(plan.jhjcsj,5,16) }<br/>${fn:substring(plan.sjjcsj,5,16) }</td>
									                <td>
										                <c:if test="${plan.planStatue == -1}">
										                	新建
										                </c:if>
										                <c:if test="${plan.planStatue == 0}">
										                	在修
										                </c:if>
										                <c:if test="${plan.planStatue == 1}">
										                	待验
										                </c:if>
										                <c:if test="${plan.planStatue == 2}">
										                	已交
										                </c:if>
										                 <c:if test="${plan.planStatue == 3}">
										                	转出
										                </c:if>
									                </td>
										            <td align="center" style="width: 100px;">${plan.comments }</td>
									            </tr>
								            </c:forEach>
							           		 <c:if test="${fn:length(allJC )<15 }">
									            <c:forEach begin="0" end="${15-fn:length(allJC )}">
									            	<tr>
									            		<td>&nbsp;</td>
									            		<td>&nbsp;</td>
									            		<td>&nbsp;</td>
									            		<td>&nbsp;</td>
									            		<td>&nbsp;</td>
									            		<td>&nbsp;</td>
									            		<td>&nbsp;</td>
									            		<td>&nbsp;</td>
									            		<td>&nbsp;</td>
									            	</tr>
									            </c:forEach>
							            	</c:if>
							      	  </table>
						    		</div>
								</div>
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
		<td class="main_shutiao">
			<div class="bs_leftArr" id="bs_center" title="收缩面板"></div>
		</td>
		<!--中间栏区域end-->
		
		<!--右侧区域start-->
		<td class="ali01 ver01"  width="100%">
			<div id="rbox">
				
				<div id="rbox_middlecenter">
					<div id="rbox_middleleft">
						<div id="rbox_middleright">
							<div id="bs_right">
			  					<div id="content">
	    							<div id="maps">
	    						<!--    <div class="k2"></div>
	    								<div class="k5"></div>  
	    								<div class="k3"></div>
	    								<div class="k4"></div>    -->
								       <!--32-->
        <div group="32" class="box" style="left:163px;top:80px;">1 
        </div>
        <div group="32" class="box" style="left:203px;top:80px;">2 
        </div>
        <div group="32" class="box" style="left:243px;top:80px;">3 
        </div>
        <div group="32" class="box" style="left:283px;top:80px;">4 
        </div>
        <div group="32" class="box" style="left:323px;top:80px;">5 
        </div>
        <div group="32" class="box" style="left:363px;top:80px;">6 
        </div>
        <div group="32" class="box" style="left:403px;top:80px;">7 
        </div>
        <div group="32" class="box" style="left:443px;top:80px;">8 
        </div>
        <div group="32" class="box" style="left:483px;top:80px;">9
        </div>
        <div group="32" class="box" style="left:523px;top:80px;">10 
        </div>
        <div group="32" class="box" style="left:563px;top:80px;">11 
        </div>
        <div group="32" class="box" style="left:603px;top:80px;">12 
        </div>
        <!--31-->
        <div group="31" class="box" style="left:163px;top:128px;">1 
        </div>
        <div group="31" class="box" style="left:203px;top:128px;">2 
        </div>
        <div group="31" class="box" style="left:243px;top:128px;">3 
        </div>
        <div group="31" class="box" style="left:283px;top:128px;">4 
        </div>
        <div group="31" class="box" style="left:323px;top:128px;">5 
        </div>
        <div group="31" class="box" style="left:363px;top:128px;">6 
        </div>
        <div group="31" class="box" style="left:403px;top:128px;">7 
        </div>
        <div group="31" class="box" style="left:443px;top:128px;">8 
        </div>
        <div group="31" class="box" style="left:483px;top:128px;">9
        </div>
        <div group="31" class="box" style="left:523px;top:128px;">10 
        </div>
        <div group="31" class="box" style="left:563px;top:128px;">11 
        </div>
        <div group="31" class="box" style="left:603px;top:128px;">12 
        </div>
        <!--30-->
        <div group="30" class="box" style="left:163px;top:174px;">1 
        </div>
        <div group="30" class="box" style="left:203px;top:174px;">2 
        </div>
        <div group="30" class="box" style="left:243px;top:174px;">3 
        </div>
        <div group="30" class="box" style="left:283px;top:174px;">4 
        </div>
        <div group="30" class="box" style="left:323px;top:174px;">5 
        </div>
        <div group="30" class="box" style="left:363px;top:174px;">6 
        </div>
        <div group="30" class="box" style="left:403px;top:174px;">7 
        </div>
        <div group="30" class="box" style="left:443px;top:174px;">8 
        </div>
        <div group="30" class="box" style="left:483px;top:174px;">9 
        </div>
        <div group="30" class="box" style="left:523px;top:174px;">10 
        </div>
        <div group="30" class="box" style="left:563px;top:174px;">11 
        </div>
        <div group="30" class="box" style="left:603px;top:174px;">12 
        </div>
        <div group="30" class="box" style="left:643px;top:174px;">13 
        </div>
        <!--35-->
        <div group="35" class="box" style="left:363px;top:220px;">1
        </div>
        <div group="35" class="box" style="left:403px;top:220px;">2 
        </div>
        <div group="35" class="box" style="left:443px;top:220px;">3 
        </div>
        <!--36-->
        <div group="36" class="box" style="left:368px;top:263px;">1
        </div>
        <div group="36" class="box" style="left:408px;top:263px;">2 
        </div>
        <div group="36" class="box" style="left:448px;top:263px;">3 
        </div>
        <!--29-->
        <div group="29" class="box" style="left:200px;top:315px;">1
        </div>
        <div group="29" class="box" style="left:240px;top:315px;">2
        </div>
        <div group="29" class="box" style="left:280px;top:315px;">3
        </div>
        <div group="29" class="box" style="left:320px;top:315px;">4
        </div>
        <div group="29" class="box" style="left:360px;top:315px;">5
        </div>
        <div group="29" class="box" style="left:400px;top:315px;">6
        </div>
        <div group="29" class="box" style="left:440px;top:315px;">7
        </div>
        <div group="29" class="box" style="left:480px;top:315px;">8
        </div>
        <div group="29" class="box" style="left:520px;top:315px;">9
        </div>
        <div group="29" class="box" style="left:560px;top:315px;">10
        </div>
        <div group="29" class="box" style="left:600px;top:315px;">11
        </div>
        <div group="29" class="box" style="left:640px;top:315px;">12
        </div>
        <div group="29" class="box" style="left:680px;top:315px;">13
        </div>
        <div group="29" class="box" style="left:720px;top:315px;">14
        </div>
        <!--28-->
        <div group="28" class="box" style="left:225px;top:358px;">1
        </div>
        <div group="28" class="box" style="left:265px;top:358px;">2
        </div>
        <div group="28" class="box" style="left:305px;top:358px;">3
        </div>
        <div group="28" class="box" style="left:345px;top:358px;">4
        </div>
        <div group="28" class="box" style="left:385px;top:358px;">5
        </div>
        <div group="28" class="box" style="left:425px;top:358px;">6
        </div>
        <div group="28" class="box" style="left:465px;top:358px;">7
        </div>
        <div group="28" class="box" style="left:505px;top:358px;">8
        </div>
        <div group="28" class="box" style="left:545px;top:358px;">9
        </div>
        <div group="28" class="box" style="left:585px;top:358px;">10
        </div>
        <div group="28" class="box" style="left:625px;top:358px;">11
        </div>
        <!--27-->
        <div group="27" class="box" style="left:250px;top:408px;">1
        </div>
        <div group="27" class="box" style="left:290px;top:408px;">2
        </div>
        <div group="27" class="box" style="left:330px;top:408px;">3
        </div>
        <div group="27" class="box" style="left:370px;top:408px;">4
        </div>
        <div group="27" class="box" style="left:410px;top:408px;">5
        </div>
        <div group="27" class="box" style="left:450px;top:408px;">6
        </div>
        <div group="27" class="box" style="left:490px;top:408px;">7
        </div>
        <div group="27" class="box" style="left:530px;top:408px;">8
        </div>
        <div group="27" class="box" style="left:570px;top:408px;">9
        </div>
        <div group="27" class="box" style="left:610px;top:408px;">10
        </div>
        <!--25-->
        <div group="25" class="box" style="left:453px;top:508px;">1
        </div>
        <div group="25" class="box" style="left:493px;top:508px;">2
        </div>
        <div group="25" class="box" style="left:533px;top:508px;">3
        </div>
        <div group="25" class="box" style="left:573px;top:508px;">4
        </div>
        <div group="25" class="box" style="left:613px;top:508px;">5
        </div>
        <div group="25" class="box" style="left:653px;top:508px;">6
        </div>
        <!--24-->
        <div group="24" class="box" style="left:483px;top:551px;">1
        </div>
        <div group="24" class="box" style="left:523px;top:551px;">2
        </div>
        <div group="24" class="box" style="left:563px;top:551px;">3
        </div>
	    							</div>
	    						</div>
							</div>
						</div>
					</div>
				</div>
			<div id="rbox_bottomcenter" >
				<div id="rbox_bottomleft">
					<div id="rbox_bottomright"></div>
				</div>
			</div>
			</div>
		</td>
		<!--右侧区域end-->
	</tr>
</table>
</body>
</html>
