<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.demo.web.*"%>

<html>
<body>
	<%
		BPMConnector bpm = BPMConnector.getInstance();
		String taskId = request.getParameter("taskId");

		String backupHealthCheckApprove = request.getParameter("backupHealthCheckApprove");
		if (backupHealthCheckApprove != null && backupHealthCheckApprove.equalsIgnoreCase("true")) {
			backupHealthCheckApprove = "true";
		} else {
			backupHealthCheckApprove = "false";
		}

		bpm.doTask("deploy", taskId, "backupHealthCheckApprove=" + backupHealthCheckApprove);
		response.sendRedirect(request.getContextPath() + "/taskSummary.jsp");
	%>
</body>
</html>
