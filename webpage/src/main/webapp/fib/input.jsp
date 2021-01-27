<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.demo.web.*"%>

<html>
<body>
	<%
		String basePath = Util.getBasePath(request);
	%>

	<h1>Fibonacci序列计算</h1>
	
	<form action="<%=basePath%>/fib/trigger.jsp">
		
		计算终止序列数：
		<input type="text" name="sequence" value="10"> <br><br> 
		
		<input type="submit" value="Submit">
	</form>

</body>

</html>
