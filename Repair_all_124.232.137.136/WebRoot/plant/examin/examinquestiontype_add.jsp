<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/common.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--框架必需start-->
<script type="text/javascript" src="js/jquery-1.4.js"></script>
<script type="text/javascript" src="js/framework.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<link href="css/import_basic.css" rel="stylesheet" type="text/css"/>
<link  rel="stylesheet" type="text/css" id="skin" prePath="<%=basePath%>"/>
<script src="js/form/validationEngine-cn.js" type="text/javascript"></script>
<script src="js/form/validationEngine.js" type="text/javascript"></script>
<!--框架必需end-->

<!--截取文字start-->
<script type="text/javascript" src="js/text/text-overflow.js"></script>
<!--截取文字end-->
</head>
<body>
	<form action="examin!examinQuestionTypeAdd.do" method="post" target="frmright" id="subform">
	<table class="tableStyle" transMode="true" overflow="auto">
		<tr>
			<td>问题类名：</td><td><input type="text" name="examinQuestionType.name " id="name"/></td>
		</tr>
		<tr>
			<td>选择专业: </td>
			<td>
				<select name="examinQuestionType.type"  id="type">
				    <option value="0">请选择班组</option>
				    <c:if test="${!empty dictProTeams}">
				    	<c:forEach items="${dictProTeams}" var="dictProTeam">
				    		<option value="${dictProTeam.proteamid}">${dictProTeam.proteamname}</option>
				    	</c:forEach>
				    </c:if>
				</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value=" 提 交 "/>
				<input type="reset" value=" 重 置 "/>
			</td>
		</tr>
	</table>
	</form>		
</body>
<script type="text/javascript">
</script>
</html>