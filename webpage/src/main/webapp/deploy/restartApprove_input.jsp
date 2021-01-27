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

	<h1>重启结果 - 检查审批</h1>
	
	<form action="<%=basePath%>/deploy/restartApprove.jsp">
		<input type="hidden" name="taskId" value="<%=taskId%>">
		
		批准通过：
		<input type="checkbox" name="restartApprove" value="true" checked="checked"> <br><br> 
		
		<input type="submit" value="Submit">
	</form>

</body>

</html>
