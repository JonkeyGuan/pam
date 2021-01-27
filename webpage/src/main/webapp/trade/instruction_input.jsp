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

	<h1>【投资经理】下达交易指令</h1>
	
	<form action="<%=basePath%>/trade/instruction.jsp">
		<input type="hidden" name="taskId" value="<%=taskId%>">
		
		产品：
		<input type="text" name="a" value=""> <br><br> 
		
		指令类型：
		<input type="text" name="b" value=""> <br><br> 
	
		指令市值：
		<input type="text" name="c" value=""> <br><br> 	
		
		日期：
		<input type="text" name="d" value=""> <br><br> 
		
		交易代码：
		<input type="text" name="e" value=""> <br><br> 
		
		其它：
		<input type="text" name="f" value=""> <br><br> 
		
		<input type="submit" value="Submit">
	</form>

</body>

</html>
