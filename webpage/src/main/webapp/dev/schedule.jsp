<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.demo.web.*"%>

<html>
<body>
	<%
		BPMConnector bpm = BPMConnector.getInstance();
		String moduleB_time = request.getParameter("moduleB_time");
		String taskId = request.getParameter("taskId");
		
		bpm.doTask("dev", taskId, "moduleB_time=" + moduleB_time);
		response.sendRedirect(request.getContextPath() + "/taskSummary.jsp");
	%>
</body>
</html>
