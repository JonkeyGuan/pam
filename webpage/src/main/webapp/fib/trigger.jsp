<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ page import="com.demo.web.*"%>
<%@ page import="com.demo.fibonacci.*"%>
<%@ page import="java.util.List"%>

<html>
<body>
	<%
	    DroolsConnector drools = DroolsConnector.getInstance();
		String sequence = request.getParameter("sequence");
		
		List<Fib> fibs = drools.executeFibCmd(Integer.parseInt(sequence));
		
		String basePath = Util.getBasePath(request);
	%>
</body>

<h1>Fibonacci Sequence</h1>

	<table>
		<tr>
			<th>Sequence</th>
			<th>Value</th>
		</tr>

		<%
			for (Fib fib : fibs) {
				String seq = String.valueOf(fib.getSequence());
				String value = String.valueOf(fib.getValue());
		%>
		<tr>
			<td><%=seq%></td>
			<td><%=value%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br />
	<button type="button"
		onclick="location = '<%=basePath%>/index.jsp'">Back
		to Home Page</button>

</html>
