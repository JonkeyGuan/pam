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

	<h1>【交易主管】分配交易员</h1>
	
	<form action="<%=basePath%>/trade/assign.jsp">
		<input type="hidden" name="taskId" value="<%=taskId%>">
		
		指定交易员：
		<input type="text" name="" value=""> <br><br> 
		
		<input type="submit" value="Submit">
	</form>

</body>

</html>
