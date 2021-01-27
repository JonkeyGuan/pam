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

	<h1>开始应用发布</h1>
	
	<form action="<%=basePath%>/deploy/startAppDeploy.jsp">
		<input type="hidden" name="taskId" value="<%=taskId%>">
		
		备份通过：
		<input type="checkbox" name="backup" value="true" checked="checked"> <br><br> 
		
		巡检通过：
		<input type="checkbox" name="healthCheck" value="true" checked="checked"> <br><br> 

		更新通过：
		<input type="checkbox" name="updateJBoss" value="true" checked="checked"> <br><br> 
		
		重启通过：
		<input type="checkbox" name="restartJBoss" value="true" checked="checked"> <br><br> 
		
		<input type="submit" value="Submit">
	</form>

</body>

</html>
