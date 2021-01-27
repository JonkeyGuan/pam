<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.demo.web.*"%>

<html>
<body>
	<%
		BPMConnector bpm = BPMConnector.getInstance();
		String taskId = request.getParameter("taskId");
		
		bpm.doTask("trade", taskId);
		response.sendRedirect(request.getContextPath() + "/taskSummary.jsp");
	%>
</body>
</html>
