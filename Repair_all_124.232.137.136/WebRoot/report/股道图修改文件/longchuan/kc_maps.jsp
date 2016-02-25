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
		border:3px dashed yellow;
		position: absolute;
		left:335px;
		top:273px;
		width:139px;
		height:63px;
	}
	div.k3{
		border:3px dashed #C0F;
		position: absolute;
		left:365px;
		top:648px;
		width:92px;
		height:30px;
	}
	div.k4{
		border:3px dashed red;
		position: absolute;
		left:435px;
		top:373px;
		width:92px;
		height:126px;
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
	
	$(function(){
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
		
		
		//DSJS和JCGZ可以扣车 
		var roles = $("input[name='roles']").val().replace(/,/g, "");
		if(roles == 'DSJS' || roles=='JCGZ'){
			$("body").click(function(event){
				var obj=($(event.srcElement || event.target));
				var id = obj.parent().attr('id');
				if(obj.parent().attr('id')==""){
					id = obj.parent().parent().attr('id')
				}
				//获取股道号
				var gdh = obj.attr('group');
				if(gdh == undefined){
					gdh = obj.parent().attr('group');
				}
				//获取台位号
				var twh = obj.html();
				if(twh > 100){
					twh = "";
				}
				if(id == "maps" && twh != "" && !isNaN(twh)){
					var diag = new top.Dialog();
					diag.Title = "日计划制定窗口";
					if(gdh != undefined){
						diag.URL = "<%=basePath%>planManage!addDailyPlanInput.action?gdh="+gdh+"&twh="+twh;
					}else{
						diag.URL = "<%=basePath%>planManage!addDailyPlanInput.action";
					}
					diag.Width=450;
					diag.Height=430;
					diag.show();
				}
			})
		}
	});
	
//	$(function(){
//		jkmegamenu.definemenu("megaanchor1", "megamenu1", "mouseover");
//		jkmegamenu.definemenu("megaanchor2", "megamenu2", "mouseover");
//		jkmegamenu.definemenu("megaanchor3", "megamenu3", "mouseover");
//		jkmegamenu.definemenu("megaanchor4", "megamenu4", "mouseover");
//		jkmegamenu.definemenu("megaanchor5", "megamenu5", "mouseover");
//	});
	
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
<input type="hidden" name="roles" value="${sessionScope.session_user.roles }"/>
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
				
				<div id="lbox_middlecenter">
					<div id="lbox_middleleft" >
						<div id="lbox_middleright">
							<div id="bs_left" style="width:500px;height:468px;">
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
									            <td>状态</td>
								            <th>备注</th>
							         	   </tr>	
								            <c:forEach items="${allJC }" var="plan" varStatus="index">
									            <tr>
									            	<td align="center">${index.index+1 }&nbsp;</td>
									                <td align="center"><a style="position:static;" href="<%=basePath%>query!getInfoByJC.do?jcStype=${plan.jcType }&jcNum=${plan.jcnum }&xcxc=${plan.fixFreque}" target="_blakn">${plan.jcType }-${plan.jcnum }</a>&nbsp;</td>
									                <td align="center">${plan.fixFreque }&nbsp;</td>
									                <td align="center"><a style="position:static;" href="javascript:void(0);" onclick="clickGD(${plan.rjhmId } )">${plan.gdh }道</a>&nbsp;</td>
									                <td align="center">${fn:substring(plan.kcsj,5,16) }&nbsp;</td>
									                <td align="center">${fn:substring(plan.jhqjsj,5,16) }<br/>${fn:substring(plan.sjqjsj,5,16) }&nbsp;</td>
									                <td align="center">${fn:substring(plan.jhjcsj,5,16) }<br/>${fn:substring(plan.sjjcsj,5,16) }&nbsp;</td>
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
										                &nbsp;
									                </td>
										            <td align="center" style="width: 100px;">${plan.comments }&nbsp;</td>
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
                                  <!--
	    								<div class="k2"></div>
	    								<div class="k5"></div>
	    								<div class="k3"></div>
	    								<div class="k4"></div>
                                      -->
								       <!--3-->
        <div group="3" class="box" style="left:28px;top:59px;">1 
        </div>
        <div group="3" class="box" style="left:68px;top:59px;">2 
        </div>
        <div group="3" class="box" style="left:108px;top:59px;">3 
        </div>
        <div group="3" class="box" style="left:148px;top:59px;">4 
        </div>
        <div group="3" class="box" style="left:188px;top:59px;">5 
        </div>
        <div group="3" class="box" style="left:228px;top:59px;">6 
        </div>
        <div group="3" class="box" style="left:268px;top:59px;">7 
        </div>
        <div group="3" class="box" style="left:308px;top:59px;">8 
        </div>
        <div group="3" class="box" style="left:348px;top:59px;">9 
        </div>
        <div group="3" class="box" style="left:388px;top:59px;">10
        </div>
        <div group="3" class="box" style="left:428px;top:59px;">11
        </div>
        <div group="3" class="box" style="left:468px;top:59px;">12 
        </div>
        <div group="3" class="box" style="left:508px;top:59px;">13 
        </div>
        <!--5-->
        <div group="5" class="box" style="left:85px;top:115px;">1 
        </div>
        <div group="5" class="box" style="left:125px;top:115px;">2 
        </div>
        <div group="5" class="box" style="left:165px;top:115px;">3 
        </div>
        <div group="5" class="box" style="left:205px;top:115px;">4 
        </div>
        <div group="5" class="box" style="left:245px;top:115px;">5 
        </div>
        <div group="5" class="box" style="left:285px;top:115px;">6 
        </div>
        <div group="5" class="box" style="left:325px;top:115px;">7 
        </div>
        <!--6-->
        <div group="6" class="box" style="left:85px;top:138px;">1 
        </div>
        <div group="6" class="box" style="left:125px;top:138px;">2 
        </div>
        <div group="6" class="box" style="left:165px;top:138px;">3 
        </div>
        <div group="6" class="box" style="left:205px;top:138px;">4 
        </div>
        <div group="6" class="box" style="left:245px;top:138px;">5 
        </div>
        <div group="6" class="box" style="left:285px;top:138px;">6 
        </div>
        <!--7-->
        <div group="7" class="box" style="left:85px;top:168px;">1 
        </div>
        <div group="7" class="box" style="left:125px;top:168px;">2 
        </div>
        <div group="7" class="box" style="left:165px;top:168px;">3 
        </div>
        <div group="7" class="box" style="left:205px;top:168px;">4 
        </div>
        <div group="7" class="box" style="left:245px;top:168px;">5 
        </div>
        <div group="7" class="box" style="left:285px;top:168px;">6 
        </div>
        <!--9-->
        <div group="9" class="box" style="left:81px;top:227px;">1 
        </div>
        <div group="9" class="box" style="left:121px;top:227px;">2 
        </div>
        <div group="9" class="box" style="left:161px;top:227px;">3 
        </div>
        <div group="9" class="box" style="left:201px;top:227px;">4 
        </div>
        <div group="9" class="box" style="left:241px;top:227px;">5 
        </div>
        <div group="9" class="box" style="left:281px;top:227px;">6 
        </div>
        <div group="9" class="box" style="left:321px;top:227px;">7 
        </div>
        <div group="9" class="box" style="left:361px;top:227px;">8 
        </div>
        <div group="9" class="box" style="left:401px;top:227px;">9 
        </div>
        <div group="9" class="box" style="left:441px;top:227px;">10 
        </div>
        <div group="9" class="box" style="left:481px;top:227px;">11 
        </div>
        <div group="9" class="box" style="left:521px;top:227px;">12 
        </div>
        <div group="9" class="box" style="left:561px;top:227px;">13 
        </div>
        <!--10-->
        <div group="10" class="box" style="left:110px;top:254px;">1 
        </div>
        <div group="10" class="box" style="left:150px;top:254px;">2 
        </div>
        <div group="10" class="box" style="left:190px;top:254px;">3 
        </div>
        <div group="10" class="box" style="left:230px;top:254px;">4 
        </div>
        <div group="10" class="box" style="left:270px;top:254px;">5 
        </div>
        <div group="10" class="box" style="left:310px;top:254px;">6 
        </div>
        <!--11-->
        <div group="11" class="box" style="left:110px;top:282px;">1 
        </div>
        <div group="11" class="box" style="left:150px;top:282px;">2 
        </div>
        <div group="11" class="box" style="left:190px;top:282px;">3 
        </div>
        <div group="11" class="box" style="left:230px;top:282px;">4 
        </div>
        <div group="11" class="box" style="left:270px;top:282px;">5 
        </div>
        <div group="11" class="box" style="left:310px;top:282px;">6 
        </div>
        <!--12-->
        <div group="12" class="box" style="left:110px;top:310px;">1 
        </div>
        <div group="12" class="box" style="left:150px;top:310px;">2 
        </div>
        <div group="12" class="box" style="left:190px;top:310px;">3 
        </div>
        <div group="12" class="box" style="left:230px;top:310px;">4 
        </div>
        <div group="12" class="box" style="left:270px;top:310px;">5 
        </div>
        <div group="12" class="box" style="left:310px;top:310px;">6
        </div>
        <!--21-->
        <div group="21" class="box" style="left:465px;top:310px;">1 
        </div>
        <div group="21" class="box" style="left:505px;top:310px;">2 
        </div>
        <div group="21" class="box" style="left:545px;top:310px;">3 
        </div>
        <div group="21" class="box" style="left:585px;top:310px;">4 
        </div>
        <div group="21" class="box" style="left:625px;top:310px;">5 
        </div>
        <div group="21" class="box" style="left:665px;top:310px;">6 
        </div>
        <div group="21" class="box" style="left:705px;top:310px;">7 
        </div>
        <!--22-->
        <div group="22" class="box" style="left:465px;top:337px;">1 
        </div>
        <div group="22" class="box" style="left:505px;top:337px;">2 
        </div>
        <div group="22" class="box" style="left:545px;top:337px;">3 
        </div>
        <div group="22" class="box" style="left:585px;top:337px;">4 
        </div>
        <div group="22" class="box" style="left:625px;top:337px;">5
        </div>
        <div group="22" class="box" style="left:665px;top:337px;">6 
        </div>
        <div group="22" class="box" style="left:705px;top:337px;">7 
        </div>
        <!--14-->
        <div group="14" class="box" style="left:155px;top:367px;">1 
        </div>
        <div group="14" class="box" style="left:195px;top:367px;">2 
        </div>
        <div group="14" class="box" style="left:235px;top:367px;">3 
        </div>
        <!--23-->
        <div group="23" class="box" style="left:465px;top:364px;">1 
        </div>
        <div group="23" class="box" style="left:505px;top:364px;">2 
        </div>
        <div group="23" class="box" style="left:545px;top:364px;">3 
        </div>
        <div group="23" class="box" style="left:585px;top:364px;">4 
        </div>
        <div group="23" class="box" style="left:625px;top:364px;">5 
        </div>
        <div group="23" class="box" style="left:665px;top:364px;">6 
        </div>
        <!--24-->
        <div group="24" class="box" style="left:465px;top:393px;">1 
        </div>
        <div group="24" class="box" style="left:505px;top:393px;">2 
        </div>
        <div group="24" class="box" style="left:545px;top:393px;">3 
        </div>
        <div group="24" class="box" style="left:585px;top:393px;">4 
        </div>
        </div>
        <!--25-->
        <div group="25" class="box" style="left:465px;top:421px;">1 
        </div>
        <div group="25" class="box" style="left:505px;top:421px;">2 
        </div>
        <div group="25" class="box" style="left:545px;top:421px;">3 
        </div>
        <div group="25" class="box" style="left:585px;top:421px;">4
        </div>
        <!--16-->
        <div group="16" class="box" style="left:125px;top:448px;">1 
        </div>
        <div group="16" class="box" style="left:165px;top:448px;">2 
        </div>
        <div group="16" class="box" style="left:205px;top:448px;">3 
        </div>
        <div group="16" class="box" style="left:245px;top:448px;">4 
        </div>
        <div group="16" class="box" style="left:285px;top:448px;">5 
        </div>
        <div group="16" class="box" style="left:325px;top:448px;">6 
        </div>
        <div group="16" class="box" style="left:365px;top:448px;">7 
        </div>
        <!--37-->
        <div group="37" class="box" style="left:465px;top:451px;">1 
        </div>
        <div group="37" class="box" style="left:505px;top:451px;">2 
        </div>
        <div group="37" class="box" style="left:545px;top:451px;">3 
        </div>
        <!--17-->
        <div group="17" class="box" style="left:145px;top:478px;">1 
        </div>
        <div group="17" class="box" style="left:185px;top:478px;">2 
        </div>
        <div group="17" class="box" style="left:225px;top:478px;">3 
        </div>
        <div group="17" class="box" style="left:265px;top:478px;">4 
        </div>
        <div group="17" class="box" style="left:305px;top:478px;">5 
        </div>
        <div group="17" class="box" style="left:345px;top:478px;">6 
        </div>
        <div group="17" class="box" style="left:385px;top:478px;">7 
        </div>
        <!--19-->
        <div group="19" class="box" style="left:465px;top:478px;">1 
        </div>
        <div group="19" class="box" style="left:505px;top:478px;">2 
        </div>
        <!--18-->
        <div group="18" class="box" style="left:175px;top:505px;">1 
        </div>
        <div group="18" class="box" style="left:215px;top:505px;">2 
        </div>
        <div group="18" class="box" style="left:255px;top:505px;">3 
        </div>
        <div group="18" class="box" style="left:295px;top:505px;">4 
        </div>
        <div group="18" class="box" style="left:335px;top:505px;">5
        </div>
        <div group="18" class="box" style="left:375px;top:505px;">6 
        </div>
        <div group="18" class="box" style="left:415px;top:505px;">7 
        </div>
        <!--32-->
        <div group="32" class="box" style="left:215px;top:535px;">1 
        </div>
        <div group="32" class="box" style="left:255px;top:535px;">2 
        </div>
        <!--31-->
        <div group="31" class="box" style="left:485px;top:533px;">1 
        </div>
        <!--33-->
        <div group="33" class="box" style="left:295px;top:563px;">1 
        </div>
        <div group="33" class="box" style="left:335px;top:563px;">2 
        </div>
        <div group="33" class="box" style="left:375px;top:563px;">3 
        </div>
        <div group="33" class="box" style="left:415px;top:563px;">4 
        </div>
        <!--34-->
        <div group="34" class="box" style="left:295px;top:590px;">1 
        </div>
        <div group="34" class="box" style="left:335px;top:590px;">2 
        </div>
        <div group="34" class="box" style="left:375px;top:590px;">3 
        </div>
        <div group="34" class="box" style="left:415px;top:590px;">4 
        </div>
        <!--35-->
        <div group="35" class="box" style="left:295px;top:618px;">1 
        </div>
        <div group="35" class="box" style="left:335px;top:618px;">2 
        </div>
		<div group="35" class="box" style="left:375px;top:618px;">3 
        </div>
        <div group="35" class="box" style="left:415px;top:618px;">4 
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
