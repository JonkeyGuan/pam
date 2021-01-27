<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.demo.web.*"%>

<html>
<body>
	<%
	BPMConnector bpm = BPMConnector.getInstance();
	String lowRisk = request.getParameter("lowRisk");
	String taskId = request.getParameter("taskId");
	
	if (lowRisk != null && lowRisk.equalsIgnoreCase("true")) {
		lowRisk = "true";
	} else {
		lowRisk = "false";
	}
	
	bpm.doTask("trade", taskId, "lowRisk=" + lowRisk);
	response.sendRedirect(request.getContextPath() + "/taskSummary.jsp");
	%>
</body>
</html>
