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

	<h1>设置工时</h1>
	
	<form action="<%=basePath%>/dev/schedule.jsp">
		<input type="hidden" name="taskId" value="<%=taskId%>">
		
		模块B开发时间：
		<input type="text" name=moduleB_time value="1m"> <br><br> 
		
		<input type="submit" value="Submit">
	</form>

</body>

</html>
