﻿<%@ page contentType="text/html; charset=UTF-8" language="java" import="java.sql.*" errorPage="" %>
<%@include file="/common/common.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>report/">
<title>
${unitType }&nbsp;&nbsp;${flowval }
检修记录</title>
<link href="<%=basePath %>css/test.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath %>css/linkcss.css" type="text/css" rel="stylesheet" />
<link href="<%=basePath %>js/tree/dtree/dtree.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="<%=basePath %>js/test.js"></script>
<script type="text/javascript" src="<%=basePath %>js/jquery-1.4.js"></script>
<script type="text/javascript" src="<%=basePath %>js/tree/dtree/dtree.js"></script>
<script type="text/javascript" charset="UTF-8" src="<%=basePath %>js/float.js"></script>
<script type="text/javascript" charset="UTF-8" src="<%=basePath %>js/print.js"></script>
<script language="JavaScript" type="text/javascript">
			
function renovate(url, name){
	var substance = document.getElementById('substance');
	if(substance != undefined && url != null && url.length > 0) {
		if(url.indexOf("?")>=0)
			url+="&"+Math.random();
		else
			url+="?"+Math.random();
		substance.src = url;
	}
	
	if ('2' == '2' && (url.indexOf('enterApp=FI') > -1 || url.indexOf('fi.alisoft.com') > -1)) {
		mainbody.css('border-bottom=1px solid #4677b5,border-top=1px solid #4677b5,width=1030px,float=left,margin-left=-35px,_margin-left=0');
		mainbottom.hidden();
		iframe1.css('width=1030px,height=480px,float=left');
	} else {
		mainbody.css('border-bottom=0px,border-top=0px,width=958px,float=none,margin-left=0px');
		mainbottom.show();
		iframe1.css('width=938px,height=480px,float=none,margin-left=10px');
	}
	if(KB.bom.ie=='6.0'){
		mainbody.css('margin-left=0');
	}
	return false;
}


function setWinH(){
	SetWinHeight(document.getElementById('substance'));
}

 function SetWinHeight(obj){
      try {
      	var win=obj;
		var h = 0;
       if (document.getElementById) {
			if (win && !window.opera) {
				if (win.contentDocument && win.contentDocument.body.offsetHeight) {
					win.style.height = win.contentDocument.body.offsetHeight;
					h=win.contentDocument.body.offsetHeight;
				} else if(win.Document && win.Document.body.scrollHeight) {
					win.style.height = win.Document.body.scrollHeight;
					h=win.Document.body.scrollHeight;
				} else {
					h=win.contentDocument.body.offsetHeight;
				}
			} else {
				//win.height = 600;
			}
       } else {
		//win.height = 600;
	   }

		h = parseInt(h);
		iframe1.css('height='+h+'px');
      } catch (e) {
	     //win.height = 600;
      }
 }
function init(){
	var navs ;
	/*--初始导航--*/
	var navs = new KB('ul@nav:li');
	/*--初始导航--*/
	var debugx = 0;
	var debugInt = true;
	/*--解决IE6下背景图片加载缓慢问题--*/
	if(KB.bom.ie=='6.0'){
       try{
         document.execCommand("BackgroundImageCache", false, true);
        }catch(e){}
    }
	
	for(var i=0; i<navs.nod.length; i++){
		if(KB.isNode('subnav_'+navs.nod[i].id)){
			var pos = KB.getPos(navs.nod[i]);
			var x = parseInt(pos.x)-160;
			if(debugInt){
				if(x<110){
					debugx = 110-x;	
				}
				if(x>120){
					debugx = 120-x;
				}
				debugInt = false;
			}
			x = x+debugx+'px';
			var y = 45+'px';
			var s = new KB('dl=subnav_'+navs.nod[i].id);
			s.css('position=absolute,left='+x+',top='+y);
		}
		(function(i,k){
				 	KB.reg(k.nod[i],'mouseover',function(){
														 		if(k.nod[i].className=="nav_active")return;
																new KB('div@header').css('position=relative');
																if(KB.isNode('subnav_'+k.nod[i].id)){
																	var s = new KB('dl=subnav_'+k.nod[i].id);
																	s.show();
																	k.nod[i].className='vor';
																}
															}); 
					KB.reg(k.nod[i],'mouseout',function(){
														 		new KB('div@header').css('position=static');
																if(k.nod[i].className=="nav_active")return;
																if(KB.isNode('subnav_'+k.nod[i].id)){
																	var s = new KB('dl=subnav_'+k.nod[i].id);
																	s.hidden();
																	k.nod[i].className='';
																}
															});
				 })(i,navs);	
	}
	//KB.regHover(navs,'','','mainmenu_1_on',changeMenu);
	/*--初始top链接切换--*/
	navs = new KB('dl@top_right:li');
	KB.regHover(navs,'','','margin10',DHchange);
	navs = new KB('div=topnav1:div');
	KB.regHover(navs,'top_nav_hover','','');
	navs = new KB('div=topnav2:div');
	KB.regHover(navs,'top_nav_hover','','');
	 /*--初始ShortCut快捷方式--*/
	ShortCut.cut = new KB('div@shortcut');
	var f = ShortCut.cut.getChild('*');
	for(var i=0; i<f.length; i++){
		(function(i){
				  KB.reg(f[i],'mouseover',ShortCut.show);
				  })(i);	
	}
	var scubtn = new KB('b=short_cu');
	ShortCut.cuBtn = scubtn.nod[0];
	ShortCut.title1 = '开启前端显示';
	ShortCut.title2 = '关闭前端显示';
	ShortCut.cutBtn = new KB('div=shortcut_btn');
	scubtn.show();
	ShortCut.init();
	tips.width=80;
	tips.xdebug = 140;
}

function openTopnav(num,t){
	if(t){
		new KB('div=topnav'+num).show();
	}else{
		new KB('div=topnav'+num).hidden();
	}
}
</script>
<script type="text/javascript">
	try{
		if(top.location != self.location) {
		   //top.location.href = 'home.jspa';
		}
	}catch(e){}
	
	//合并表格的单元格
	function cellMege(table,col){
		var lines=$('#'+table+' tr').size();
		if(lines<=2) return ;
		var v,l=0,current='',index=1;
		for(var i=1;i<lines;i++){
			var tr=$('#'+table+' tr').eq(i);
			v=tr.find('td[name="'+col+'"]').html();
			//alert(tr.find('td[name="secondname"]').size());
			l++;
			//alert(v);
			if(v!=current||i==(lines-1)){//如果两个值不相同或者是最后一行
				if(i==(lines-1)) l++;
				if(l>1){//草果两行，合并
					var td=$('#'+table+' tr').eq(index).find('td[name="'+col+'"]');
					td.attr('rowspan',l);
					for(var j=1;j<l;j++){
						var td=$('#'+table+' tr').eq(index+j).find('td[name="'+col+'"]').remove();
					}
				}
				l=0;//从新计数
				current=v;
				index=i;
			}
		}
	}
	KB.ready(init);
	$(function(){
		cellMege('datatabel','firstname');
		cellMege('datatabel','secondname');
		cellMege('datatabel','fixitemname');
		cellMege('datatabe2','preType');
		//cellMege(0);
		//cellMege('secondname');
		$('.add-collect-to').float({
			position:'rm'
		});
		//右侧菜单浮动
		$('.shortcut').float({
			position:'l'
		});
		$('.shortcut_btn').float({
			position:'l'
		});
	});
	$(function(){
		  d = new dTree('d');//创建一个树对象   

         d.add(0,-1,'机车部件'); //创建一个树对象 
         <c:forEach items="${units}" var="unit" varStatus="index">
         	d.add(${index.index+1},0,'${unit.firstunitname }','<%=basePath%>query!getInfoByUnit.do?jcStype=${jcStype }&jcNum=${jcNum }&xcxc=${xcxc }&fristUnit=${unit.firstunitid }&rjhmId=${datePlan.rjhmId }');
 		</c:forEach>
 		d.add('pj', -1, "配件","<%=basePath%>query!findXXJCPJ.do?rjhmId=${datePlan.rjhmId}");
         $('#tt').append(d.toString());
	});
</script>
</head>

<body bgcolor="#f8f7f7">
<form id="form1" name="form1" method="post" action="">
<!--top end-->
<div class="top" id="top" style="display:none">
  <!--top_right begin-->
  <dl class="top_right">
    <dd>
      <ul>
      
        <li style="position: static;" class=""><a onclick="openTopnav(1,true)" href="javascript:void(0)">系统设置</a><b class="icon9"></b>
          <div id="topnav1" class="top_nav" style="display: none;">
            <h2><a onclick="openTopnav(1,true)" href="javascript:void(0)">系统设置</a><b class="icon9"></b></h2>
            <div><a onclick="openUrlToNewPage('#','初始设置');'return false';" href="javascript:void(0)">初始设置</a></div>
            <iframe frameborder="0" style="z-index:-1; position:absolute; top:0; left:0; width:100px; height:140px; opacity:0; filter:alpha(opacity=0)"></iframe>
          </div>
        </li>
        <li class="margin10">|</li>
        <li style="position: static;" class=""><a onclick="openTopnav(2,true)" href="javascript:void(0)">在线帮助</a><b class="icon9"></b>
          <div id="topnav2" class="top_nav" style="display: none;">
            <h2><a onclick="openTopnav(2,false)" href="javascript:void(0)">在线帮助</a><b class="icon9"></b></h2>
            <div><a href="" target="_blank">在线帮助</a></div>
            <div><a href="javascript:changeFaceAdpter('STATIC_SERVER/c2c/face0/images','0');">新手上路</a></div>
            <iframe frameborder="0" style="z-index:-1; position:absolute; top:0; left:0; width:100px; height:140px; opacity:0; filter:alpha(opacity=0)"></iframe>
          </div>
        </li>
        <li class="margin10">|</li>
      </ul>
    </dd>
  </dl>
</div>
<!--left box-->
<div class="shortcut" style="z-index:1000">
  <div class="shortcut_top"><span>机车检修记录</span><b class="icon57" title="" id="short_cu" onclick="ShortCut.cu()" style="display:none;"></b></div>
  <div class="shortcut_wrap"></div>
  <div class="shortcut_body" id="left_menu">
  <ul id="tt" class="easyui-tree">  
  <!-- 
    <li>  
        <span>机车部件</span>  
        <ul>  
            <c:forEach items="${units}" var="unit" varStatus="index">
  				<li><a href="<%=basePath%>query!view.do?jcStype=${jcStype }&jcNum=${jcNum }&xcxc=${xcxc }&fristUnit=${unit.firstunitid }"><span class="icon10"></span>${unit.firstunitname }</a></li>
 			</c:forEach>
        </ul>  
    </li>  
    -->
</ul>  
  </div>
  <div class="shortcut_bottom"></div>
  <iframe style="position:absolute; left:0px; top:0px; width:142px; height:300px; border:1px solid #229900; z-index:-1; opacity:0; filter:alpha(opacity=0);"></iframe>
</div>
<div class="shortcut_btn" id="shortcut_btn"></div>
<div style="width:870px;margin-left:-435px;left:50%;position:absolute;" id="content2">
<table width="864" border="0" align="center" cellspacing="0" vspace="0" style="padding-top:10px;">
<tr>
<td colspan="6" align="center" height="40"><h2 align="center"><font style="font-family:'隶书'">
<b>
${unitType }&nbsp;&nbsp;${flowval }&nbsp;&nbsp;
检修记录</b></font></h2></td>
<td  align="right"></td>
</tr>
<tr>
<td width="163" align="right">机车号：</td>
<td width="240">${datePlan.jcType }  ${datePlan.jcnum }</td>
<td width="55" align="left">修程：</td><td width="251">${datePlan.fixFreque}</td>
<td width="140" align="left">检修日期：</td><td width="195" algin="left">${datePlan.kcsj }</td>
</tr>
<tr><td colspan="6">
<table width="864" border="0" align="center" cellspacing="0" vspace="0">
 <tr>
	<td align="center" colspan="3" class="tbCELL3">
	<table width="864" border="0" align="center" cellspacing="0" vspace="0" id="datatabel">
		<tr style="line-height:40px;height: 40px;background-color: lightblue;font-weight: bolder;">
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="10%">大部件</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap; min-width" width="15%">检修部件</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="25%">检修项目</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="10%">部位</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="10%">检修情况</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="6%">检修人</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="6%">工长</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="6%">质检员</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="6%">技术员</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="6%">交车工长</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="6%">验收员</td>
		</tr>
        <c:forEach items="${fixRecs}" var="item">
		<tr>
			<td class="tbCELL1" align="center" name="firstname">${item.unitName }&nbsp;</td>
			<td class="tbCELL1" align="center" name="secondname">${item.secUnitName}&nbsp;</td>
			<td class="tbCELL1" align="center" name="fixitemname">${item.itemName }&nbsp;</td>
			<td class="tbCELL1" align="center">${item.posiName }&nbsp;</td>
			<td class="tbCELL1" align="center">${item.fixSituation }${item.unit }&nbsp;
			      <c:if test="${!empty item.upPjNum}">
				      <br/>
		              <c:forTokens items="${item.upPjNum }" delims="," var="num">
							<a href="query!findPjRecordByPjNum.do?rjhmId=${datePlan.rjhmId}&pjNum=${num}" target="_blank" style="color:blue;">${num }</a>&nbsp;
					  </c:forTokens>
				  </c:if>
			</td>
		      <td class="tbCELL1" align="center">
                            <c:choose>
					<c:when test="${empty item.fixEmp}"><font color="#FF0000">待签</font></c:when>
					<c:otherwise>
						${fn:substring(item.fixEmp,1,fn:length(item.fixEmp)-1)}<br>${fn:substring(item.empAfformTime, 5, 16) }
					</c:otherwise>
				</c:choose>
                        </td>
                        <td class="tbCELL1" align="center">
				<c:choose>
					<c:when test="${empty item.lead}"><font color="#FF0000">待签</font></c:when>
					<c:otherwise>
						${item.lead }<br>${fn:substring(item.ldAffirmTime, 5, 16) }
					</c:otherwise>
				</c:choose>
                        </td>
                        <td class="tbCELL1" align="center">
				<c:choose>
					<c:when test="${empty item.qi && item.itemCtrlQI==1}"><font color="#FF0000">待签</font></c:when>
                    <c:when test="${empty item.qi && item.itemCtrlQI==0}">/</c:when>
					<c:otherwise>
						${item.qi }<br>${fn:substring(item.qiAffiTime, 5, 16) }
					</c:otherwise>	
				</c:choose>
                        </td>
                        <td class="tbCELL1" align="center">
                <c:choose>
					<c:when test="${empty item.tech && item.itemCtrlTech==1}"><font color="#FF0000">待签</font></c:when>
                    <c:when test="${empty item.tech && item.itemCtrlTech==0}">/</c:when>
					<c:otherwise>
						${item.tech }<br>${fn:substring(item.techAffiTime, 5, 16) }
					</c:otherwise>	
				</c:choose>
                        </td>
                        <td class="tbCELL1" align="center">
                <c:choose>
					<c:when test="${empty item.commitLead && item.itemCtrlComLd==1}"><font color="#FF0000">待签</font></c:when>
                    <c:when test="${empty item.commitLead && item.itemCtrlComLd==0}">/</c:when>
					<c:otherwise>
						${item.commitLead }<br>${fn:substring(item.comLdAffiTime, 5, 16) }
					</c:otherwise>	
				</c:choose>
                        </td>
                        <td class="tbCELL1" align="center">
                <c:choose>
					<c:when test="${empty item.accepter && item.itemCtrlAcce==1}"><font color="#FF0000">待签</font></c:when>
                    <c:when test="${empty item.accepter && item.itemCtrlAcce==0}">/</c:when>
					<c:otherwise>
						${item.accepter }<br>${fn:substring(item.acceAffiTime, 5, 16) }
					</c:otherwise>	
				</c:choose>
                        </td>
	                                  
		</tr>
		</c:forEach>
	</table>
  </td>
  </tr>
  <tr>
  <td align="center" colspan="3" class="tbCELL3">
  <%-- 报活项目 begin --%>
  	<br>
	<table width="864" border="0" align="center" cellspacing="0" vspace="0" id="datatabe2">
		<tr style="line-height:40px;height: 40px;background-color: lightblue;font-weight: bolder;">
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="10%">报活类别</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="20%">报活内容</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="6%">报活人</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="10%">报活时间</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="15%">检修情况</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="6%">检修人</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="6%">工长</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="6%">质检员</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="6%">技术员</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="6%">交车工长</td>
			<td class="tbCELL1" align="center" style="white-space:nowrap" width="6%">验收员</td>
		</tr>
		<c:forEach items="${preDictRecs}" var="preItem">
			<tr>
				<td class="tbCELL1" align="center"  name="preType">
					<c:if test="${preItem.type==0}">
						JT28报活
					</c:if>
					<c:if test="${preItem.type==1}">
						复检报活
					</c:if>
					<c:if test="${preItem.type==2}">
						检修过程报活
					</c:if>
					<c:if test="${preItem.type==6}">
						零公里检查
					</c:if>
				</td>
				<td class="tbCELL1" align="center">${preItem.repsituation }&nbsp;</td>
				<td class="tbCELL1" align="center">${preItem.repemp}&nbsp;</td>
				<td class="tbCELL1" align="center">${preItem.repTime }&nbsp;</td>
				<td class="tbCELL1" align="center">${preItem.dealSituation }&nbsp;</td>
				<td class="tbCELL1" align="center">
					<c:if test="${empty preItem.fixEmp && empty preItem.dealFixEmp}"><font style="color: red;font-weight: bold;">(未派工)</font></c:if>
					<c:if test="${!empty preItem.fixEmp && empty preItem.dealFixEmp}">
						${preItem.fixEmp}<font style="color: red;font-weight: bold;">(未签认)</font>
					</c:if>
					<c:if test="${!empty preItem.fixEmp && !empty preItem.dealFixEmp}">${preItem.fixEmp}<br>${fn:substring(preItem.fixEndTime, 5, 16) }&nbsp;</c:if>
					<c:if test="${empty preItem.fixEmp && !empty preItem.dealFixEmp}">${fn:replace(preItem.dealFixEmp,',','')}<br>${fn:substring(preItem.fixEndTime, 5, 16) }&nbsp;</c:if>
				</td>
				<td class="tbCELL1" align="center">
					<c:if test="${empty preItem.lead}"><font style="color: red;font-weight: bold;">(未签认)</font></c:if>
					<c:if test="${!empty preItem.lead}">${preItem.lead}<br>${fn:substring(preItem.ldAffirmTime, 5, 16) }&nbsp;</c:if>
				</td>
				<td class="tbCELL1" align="center">${preItem.qi }<br>${fn:substring(preItem.qiAffiTime, 5, 16) }&nbsp;</td>
				<td class="tbCELL1" align="center">${preItem.technician }<br>${fn:substring(preItem.techAffiTime, 5, 16) }&nbsp;</td>
				<td class="tbCELL1" align="center">${preItem.commitLd }<br>${fn:substring(preItem.comLdAffiTime, 5, 16) }&nbsp;</td>
				<td class="tbCELL1" align="center">${preItem.accepter }<br>${fn:substring(preItem.acceTime, 5, 16) }&nbsp;</td>
			</tr>
		</c:forEach>
	</table>
	<%-- 报活项目 end--%>
	</td>
	</tr>
  </table>
  </td>
  </tr>
  </table>
  </div>
  <!–endprint–>
  <div class="add-collect-to" >
  <a href="javascript:window.print();" style="font-size:14px;font-weight: bold;">打印</a>
  </div>
</form>
</body>
</html>