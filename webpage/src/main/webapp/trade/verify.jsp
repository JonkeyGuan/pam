<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.demo.web.*"%>

<html>
<body>
	<%
	BPMConnector bpm = BPMConnector.getInstance();
	String verifiedFine = request.getParameter("verifiedFine");
	String taskId = request.getParameter("taskId");
	
	if (verifiedFine != null && verifiedFine.equalsIgnoreCase("true")) {
		verifiedFine = "true";
	} else {
		verifiedFine = "false";
	}
	
	bpm.doTask("trade", taskId, "verifiedFine=" + verifiedFine);
	response.sendRedirect(request.getContextPath() + "/taskSummary.jsp");
	%>
</body>
</html>
