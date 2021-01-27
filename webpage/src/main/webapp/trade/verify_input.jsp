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

	<h1>【交易员】复核并且确认接收指令</h1>
	
	<form action="<%=basePath%>/trade/verify.jsp">
		<input type="hidden" name="taskId" value="<%=taskId%>">
		
		复核通过：
		<input type="checkbox" name="verifiedFine" value="true" checked="checked"> <br><br> 
		
		<input type="submit" value="Submit">
	</form>

</body>

</html>
