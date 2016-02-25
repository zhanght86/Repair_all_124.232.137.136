<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <base href="<%=basePath%>"/>
	<!--框架必需start-->
	<script type="text/javascript" src="js/jquery-1.4.js"></script>
	<script type="text/javascript" src="js/framework.js"></script>
	<link href="css/import_basic.css" rel="stylesheet" type="text/css"/>
	<link  rel="stylesheet" type="text/css" id="skin" prePath="<%=basePath%>"/>
	<!--框架必需end-->
	<script type="text/javascript" src="js/tree/dtree/dtree.js"></script>
	<link href="js/tree/dtree/dtree.css" rel="stylesheet" type="text/css"/>
	<!--截取文字start-->
	<script type="text/javascript" src="js/text/text-overflow.js"></script>
	<!--截取文字end-->
	<!--修正IE6支持透明PNG图start-->
    <script type="text/javascript" src="js/method/pngFix/supersleight.js"></script>
    <!--修正IE6支持透明PNG图end-->
	<script type="text/javascript" src="js/nav/ddaccordion.js"></script>
	<script type="text/javascript">
	   //根据机车类型得到一级部件信息
	   function getFirstUnit(){
		   var jcsType=$("#jcsType").val();
		   if(jcsType!=""){
			   $.post("<%=basePath%>fixItemAction!ajaxGetFirstUnit.do",{"jcsType":jcsType},function(data){
	               var result=eval("("+data+")");
	               var firstUnits=result.firstUnits;
	               var str="<option value=''>请选择大部件</option>";
	               for(var i=0;i<firstUnits.length;i++){
	                   str+="<option value="+firstUnits[i].firstUnitId+">"+firstUnits[i].firstUnitName+"</option>";
	               }
	               $("#first").children().remove();
	               $("#first").append(str);
	           });
			   $("#second").children().remove();
	           $("#second").append("<option value=''>请选择二级部件</option>");
		   }
	   }
	   
	    //得到二级部件信息
	    function getSecondUnit(){
	    	var firstUnit = ($("#first").find("option:selected").text());
	    	$("#firstUnit").val(firstUnit);
	        var firstId=$("#first").val();
	        if(firstId!=""&&firstId!=0){
	            $.post("<%=basePath%>fixItemAction!ajaxGetSecondUnit.do",{"firstUnitId":firstId},function(data){
	                var result=eval("("+data+")");
	                var secunits=result.secunits;
	                var str="<option value=''>请选择二级部件</option>";
	                for(var i=0;i<secunits.length;i++){
	                	 str+="<option value="+secunits[i].secunitId+">"+secunits[i].secunitName+"</option>";
	                }
	                $("#second").children().remove();
	                $("#second").append(str);
	            });
	        }
	    }

	    //获取二级部件名称
	    $("#secondUnit").val($("#second").text());
	    function getThirdUnit(){
            var secondUnit = ($("#second").find("option:selected").text());
	    	$("#secondUnit").val(secondUnit);
	    }

		$(document).ready(function() {
			$('#enter').bind('click', function() {
				//参数列
					var jctypeString = ",";
					$("input[name='dictjcsType']:checked").each(function() {
						jctypeString += $(this).val() + ",";
					})
					$("#jcsTypeString").val(jctypeString);
					if (jctypeString != ",") {
						$("#subForm").submit();
					} else {
						top.Dialog.alert("请选择适用车型！");
					}
				})
		});

		$(document).ready(function(){			
			if($("#fill").val()==""){
				$("#rad2").attr("checked","checked");
				xianshi2();
			}else{
				xianshi1();
			}
		});	
		
		function xianshi1(){
			$("#fill").css("visibility","visible");
			$(".ui").css("visibility","hidden");
			$(".ui").val("");
		}

		function xianshi2(){
			$("#fill").css("visibility","hidden");
			$(".ui").css("visibility","visible");
			$("#fill").val("");
		}
	</script>
  </head>
<body>
    <form action="fixItemAction!editItem.do" method="post" target="frmright" id="subForm"> 
    	<input type="hidden" name="thirdUnitId" value="${jcFixitem.thirdUnitId }"/>
    	<input type="hidden" id="firstUnit" name="fixItem.unitName" value="${jcFixitem.unitName }"/>
    	<input type="hidden" id="secondUnit" name="fixItem.secUnitName" value="${jcFixitem.secUnitName }"/>
    	<input type="hidden" id="jcsTypeString" name="fixItem.jcsType" value="${jcFixitem.jcsType}"/>
		<table class="tableStyle"><!-- transMode="true" -->
		   	<tr>
				<td>适用车型: </td>
				<td colspan="3">				   
				<div id="checkGroup" class="render">
	                  <c:forEach items="${jcsTypes}" var="entry">
	                      <input type="checkbox"  name="dictjcsType" value="${entry.jcStypeValue}"  <c:if test="${fn:containsIgnoreCase(jcFixitem.jcsType,entry.jcStypeValue)}">checked="checked"</c:if>/>${entry.jcStypeValue}
	                  </c:forEach>          	
                </div>
				</td>
			</tr>
			<tr>
			    <td>机车类型: </td>
			    <td >
			    		<select id="jcsType" onchange="getFirstUnit();" class="default" name="jcsType">
		                     <c:forEach var="jc" items="${jcsTypes}">
		                         <option value="${jc.jcStypeValue }" <c:if test="${jc.jcStypeValue==jcsType}">selected="selected"</c:if>>${jc.jcStypeValue  }</option>
		                     </c:forEach>
                        </select>
               </td>
               <td>检修时长: </td>
				<td>
				   <input class="easyui-validatebox" type="text" name="fixItem.duration" value="${jcFixitem.duration }"></input>
				</td>
			</tr>
			<tr>
			     <td>大部件名称:</td>
			     <td>
			     <select id="first" onchange="getSecondUnit();" class="default" name="fixItem.firstUnitId">
                     	 <option value="${jcFixitem.firstUnitId }" >${jcFixitem.unitName }</option>
               	 </select>
               	 </td>
				 <td>二级部件名称:</td>
				 <td>
				 <select id="second" onchange="getThirdUnit();" class="default" name="fixItem.secUnitId">
                     	<option value="${jcFixitem.secUnitId }">${jcFixitem.secUnitName }</option>
                 </select>
                 </td>
			</tr>
	 		<tr>
				<td>部位名称: </td>
				<td>
				   <input class="easyui-validatebox" type="text" name="fixItem.posiName" value="${jcFixitem.posiName }"></input>
				</td>
				<td>所属班组: </td>
				<td>
				   <select id="teamId" class="default" name="proteamid">
                     <c:forEach var="team" items="${proTeams}">
                         <option value="${team.proteamid}" <c:if test="${team.proteamid==jcFixitem.banzuId.proteamid}">selected="selected"</c:if>>${team.proteamname }</option>
                     </c:forEach>
                 </select>
				</td>
			</tr>
			<tr>
			<td colspan="4">
			<input onclick="xianshi1()" class="rad" id="rad1" type="radio" name="item" checked="checked" value="111"/>检查项目
			<input onclick="xianshi2()" class="rad" id="rad2" type="radio" name="item" value="222"/>检测项目
			</td>
			</tr>
			<tr>
				<td>填报默认值: </td>
				<td>
				   <input id="fill" class="uu" type="text" name="fixItem.fillDefaVal" value="${jcFixitem.fillDefaVal }"></input>
				</td>
			
				<td>单位: </td>
				<td>
					<input class="ui" type="text" name="fixItem.unit" value="${jcFixitem.unit}"></input>
				</td>
			</tr>
			<tr>
				<td>最小值: </td>
				<td>
					<input class="ui" type="text" name="fixItem.min" value="${jcFixitem.min}"></input>
				</td>
			
				<td>最大值: </td>
				<td>
					<input class="ui" type="text" name="fixItem.max" value="${jcFixitem.max}"></input>
				</td>
			</tr>
			<tr>
				<td>技术员卡控: </td>
				<td>
					<c:if test="${jcFixitem.itemCtrlTech==1}">
						<input type="radio" name="fixItem.itemCtrlTech" value="1" checked="checked"/>卡控
						<input type="radio" name="fixItem.itemCtrlTech" value="0" />不卡控
					</c:if>					
					<c:if test="${jcFixitem.itemCtrlTech==0}">
						<input type="radio" name="fixItem.itemCtrlTech" value="1" />卡控
						<input type="radio" name="fixItem.itemCtrlTech" value="0" checked="checked"/>不卡控
					</c:if>
				</td>
				<td>质检员卡控: </td>
				<td>
					<c:if test="${jcFixitem.itemCtrlQI==1}">
						<input type="radio" name="fixItem.itemCtrlQI" value="1" checked="checked"/>卡控
						<input type="radio" name="fixItem.itemCtrlQI" value="0" />不卡控
					</c:if>					
					<c:if test="${jcFixitem.itemCtrlQI==0}">
						<input type="radio" name="fixItem.itemCtrlQI" value="1" />卡控
						<input type="radio" name="fixItem.itemCtrlQI" value="0" checked="checked"/>不卡控
					</c:if>
				</td>
			</tr>
			<tr>
				<td>交车工长卡控: </td>
				<td>
					<c:if test="${jcFixitem.itemCtrlComLd==1}">
						<input type="radio" name="fixItem.itemCtrlComLd" value="1" checked="checked"/>卡控
						<input type="radio" name="fixItem.itemCtrlComLd" value="0" />不卡控
					</c:if>					
					<c:if test="${jcFixitem.itemCtrlComLd==0}">
						<input type="radio" name="fixItem.itemCtrlComLd" value="1" />卡控
						<input type="radio" name="fixItem.itemCtrlComLd" value="0" checked="checked"/>不卡控
					</c:if>
				</td>
			
				<td>验收员卡控: </td>
				<td>
					<c:if test="${jcFixitem.itemCtrlAcce==1}">
						<input type="radio" name="fixItem.itemCtrlAcce" value="1" checked="checked"/>卡控
						<input type="radio" name="fixItem.itemCtrlAcce" value="0" />不卡控
					</c:if>					
					<c:if test="${jcFixitem.itemCtrlAcce==0}">
						<input type="radio" name="fixItem.itemCtrlAcce" value="1" />卡控
						<input type="radio" name="fixItem.itemCtrlAcce" value="0" checked="checked"/>不卡控
					</c:if>
				</td>
			</tr>
			<tr>
				<td>项目名称: </td>
				<td colspan="3">
				   <textarea rows="5" cols="50" class="default" name="fixItem.itemName">${jcFixitem.itemName }</textarea>
				</td>
			</tr>
			<tr>
				<td>修程修次: </td>
				<td colspan="3">
				   <textarea rows="5" cols="50" class="default" name="fixItem.xcxc">${jcFixitem.xcxc }</textarea>
				</td>
			</tr>
			<tr><td colspan="4" align="center"><input type="button" id="enter" value="确定"/></td></tr>         
		</table>
	</form>
</body>
</html>