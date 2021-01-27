<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.demo.web.*"%>

<html>
<body>
	<%
		BPMConnector bpm = BPMConnector.getInstance();
		String taskId = request.getParameter("taskId");

		String restartApprove = request.getParameter("restartApprove");
		if (restartApprove != null && restartApprove.equalsIgnoreCase("true")) {
			restartApprove = "true";
		} else {
			restartApprove = "false";
		}

		bpm.doTask("deploy", taskId, "restartApprove=" + restartApprove);
		response.sendRedirect(request.getContextPath() + "/taskSummary.jsp");
	%>
</body>
</html>
