<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.demo.web.*"%>

<html>
<body>
	<%
		BPMConnector bpm = BPMConnector.getInstance();
		String taskId = request.getParameter("taskId");
		String basePath = Util.getBasePath(request);
	%>

	<h1>风控、合规检查</h1>
	
	<form action="<%=basePath%>/trade/risk.jsp">
		<input type="hidden" name="taskId" value="<%=taskId%>">
		
		检查通过：
		<input type="checkbox" name="lowRisk" value="true" checked="checked"> <br><br> 
		
		<input type="submit" value="Submit">
	</form>

</body>

</html>
