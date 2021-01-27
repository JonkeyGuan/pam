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

	<h1>开发完成</h1>
	
	<form action="<%=basePath%>/dev/develop.jsp">
		<input type="hidden" name="taskId" value="<%=taskId%>">
		
		<input type="submit" value="Submit">
	</form>

</body>

</html>
