<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.demo.web.*"%>

<html>
<body>
	<%
		BPMConnector bpm = BPMConnector.getInstance();
		String taskId = request.getParameter("taskId");

		String updateApprove = request.getParameter("updateApprove");
		if (updateApprove != null && updateApprove.equalsIgnoreCase("true")) {
			updateApprove = "true";
		} else {
			updateApprove = "false";
		}

		bpm.doTask("deploy", taskId, "updateApprove=" + updateApprove);
		response.sendRedirect(request.getContextPath() + "/taskSummary.jsp");
	%>
</body>
</html>
