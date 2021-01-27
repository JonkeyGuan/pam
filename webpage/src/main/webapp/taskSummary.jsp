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
		BPMConnector bpm = BPMConnector.getInstance();
		Task_summary[] tasks = bpm.getTaskSummary("bpmsadmin");
		String basePath = Util.getBasePath(request);
	%>

	<h1>Task Summary</h1>

	<table>
		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Owner</th>
			<th>Process ID</th>
			<th>Status</th>
			<th>Action</th>
		</tr>

		<%
			for (Task_summary task : tasks) {
				String subContext = task.getTask_proc_def_id();
				String taskPage = basePath + "/" + subContext + "/" + task.getTask_description() + "_input.jsp";
				String statusUrl = Util.getProcessStatusUrl(request, task.getTask_proc_def_id(),
						task.getTask_proc_inst_id());
		%>
		<tr>
			<td><%=task.getTask_id()%></td>
			<td><%=task.getTask_name()%></td>
			<td><%=task.getTask_actual_owner()%></td>
			<td><%=task.getTask_proc_inst_id()%></td>
			<td><a href="<%=statusUrl%>" target="_blank">view</a></td>
			<td><button type="button"
					onclick="location = '<%=taskPage%>?taskId=<%=task.getTask_id()%>'">Run</button></td>
		</tr>
		<%
			}
		%>
	</table>
	<br />
	<button type="button"
		onclick="location = '<%=basePath%>/index.jsp'">Back
		to Start Process Page</button>
</body>
</html>
