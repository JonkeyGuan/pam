<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.demo.web.*"%>
<html>
<head>
<style>
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 70%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>
</head>
<body>
	<%
		String devUrl = Util.getProcessDefUrl(request, "dev", "dev");
		String tradeUrl = Util.getProcessDefUrl(request, "trade", "trade");
		String deployUrl = Util.getProcessDefUrl(request, "deploy", "deploy");
		
		String basePath = Util.getBasePath(request);
	%>
	<h1>Processes</h1>

	<table>
		<tr>
			<th>Name</th>
			<th>Definition</th>
			<th>Action</th>
		</tr>

		<tr>
			<td>dev process</td>
			<td><a href="<%=devUrl%>" target="_blank">definition</a></td>
			<td><button type="button"
					onclick="location.href='<%=basePath%>/dev/startDevProcess.jsp'">Start</button></td>
		</tr>

		<tr>
			<td>trade process</td>
			<td><a href="<%=tradeUrl%>" target="_blank">definition</a></td>
			<td><button type="button"
					onclick="location.href='<%=basePath%>/trade/startTradeProcess.jsp'">Start</button></td>
		</tr>

		<tr>
			<td>deploy process</td>
			<td><a href="<%=deployUrl%>" target="_blank">definition</a></td>
			<td><button type="button"
					onclick="location.href='<%=basePath%>/deploy/startDeloyProcess.jsp'">Start</button></td>
		</tr>
	</table>
	<br/>
	<button type="button"
		onclick="location = '<%=basePath%>/taskSummary.jsp'">Go to Task Summary</button>
		
	<h1>Rules</h1>

	<table>
		<tr>
			<th>Name</th>
			<th>Description</th>
			<th>Action</th>
		</tr>

		<tr>
			<td>fibonacci rule</td>
			<td>trigger fibonacci sequence calculation</td>
			<td><button type="button"
					onclick="location.href='<%=basePath%>/fib/input.jsp'">Start</button></td>
		</tr>

	</table>
	
</body>
</html>
