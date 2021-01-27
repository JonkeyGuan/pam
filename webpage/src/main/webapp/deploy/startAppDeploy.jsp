<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.demo.web.*"%>

<html>
<body>
	<%
		BPMConnector bpm = BPMConnector.getInstance();
		String taskId = request.getParameter("taskId");

		String backup = request.getParameter("backup");
		if (backup != null && backup.equalsIgnoreCase("true")) {
			backup = "true";
		} else {
			backup = "false";
		}

		String healthCheck = request.getParameter("healthCheck");
		if (healthCheck != null && healthCheck.equalsIgnoreCase("true")) {
			healthCheck = "true";
		} else {
			healthCheck = "false";
		}

		String updateJBoss = request.getParameter("updateJBoss");
		if (updateJBoss != null && updateJBoss.equalsIgnoreCase("true")) {
			updateJBoss = "true";
		} else {
			updateJBoss = "false";
		}

		String restartJBoss = request.getParameter("restartJBoss");
		if (restartJBoss != null && backup.equalsIgnoreCase("true")) {
			restartJBoss = "true";
		} else {
			restartJBoss = "false";
		}

		bpm.doTask("deploy", taskId, "backup=" + backup + "|healthCheck=" + healthCheck + "|updateJBoss="
				+ updateJBoss + "|restartJBoss=" + restartJBoss);
		response.sendRedirect(request.getContextPath() + "/taskSummary.jsp");
	%>
</body>
</html>
