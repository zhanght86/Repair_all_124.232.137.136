<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <base href="<%=basePath%>"/>
    <title>文档分类管理</title>
    
	<!--框架必需start-->
	<script type="text/javascript" src="js/jquery-1.4.js"></script>
	<script type="text/javascript" src="js/framework.js"></script>
	<link href="css/import_basic.css" rel="stylesheet" type="text/css"/>
	<link  rel="stylesheet" type="text/css" id="skin" prePath="<%=basePath%>"/>
	<!--框架必需end-->
	<script type="text/javascript" src="js/tree/dtree/dtree.js"></script>
	<link href="js/tree/dtree/dtree.css" rel="stylesheet" type="text/css"/>
	<!--引入弹窗组件end-->
	<script type="text/javascript" src="js/text/text-overflow.js"></script>
  </head>
  
 <body>
 	<div id="scrollContent">
 	<table width="100%"  border="0" cellspacing="0" cellpadding="0">
 	  	<tr>
 			<td width="22%" class="ver01">
	 			<div class="box2"  panelTitle="文档类型" panelHeight="465" overflow="auto" showStatus="false">
	 				<table>
					<tr>
						<td>
				 			<script type="text/javascript">
				 					var d = new dTree('d');
									d.add(0,-1,'全部','','','');
								
									<c:forEach var="map" items="${documentTypeMap}" varStatus="s">
										d.add(${s.index+101 },0,'<input type="hidden" id="${map.key.id}" name="documentType" value="${map.key.id}"/>${map.key.name}','<%=basePath%>document!listDocumentStandard.do?type=${map.key.id}','${map.key.name}','documentIframe');
										<c:forEach var="documentType" items="${map.value}">
											d.add(${documentType.id},${s.index+101 },'<input type="hidden" id="${documentType.id}" name="documentType" value="${documentType.id}"/>${documentType.name}','<%=basePath%>document!listDocumentStandard.do?type=${documentType.id}','${documentType.name}','documentIframe');
							 	   		</c:forEach>
							 	   	</c:forEach>
									document.write(d);
				 			</script>
			 			</td>
		 			</tr>
		 			</table>
	 			</div>
 	    	</td>
 			<td class="ver01">
	 			<div class="box2"  panelTitle="文档信息" panelHeight="465" overflow="auto" showStatus="false">
	 				<iframe scrolling="no" width="100%" frameBorder=0 id="documentIframe" name="documentIframe" onload="iframeHeight('documentIframe')" src="<%=basePath%>document!listDocumentStandard.do?temp="+<%=System.currentTimeMillis()%> allowTransparency="true"></iframe>
	 			</div>
 			</td>
		</tr>
 	</table>
	</div>	
</body>
</html>