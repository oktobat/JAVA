<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!-- errorPage="addException.jsp"  --> 

<%
	int num = Integer.parseInt(request.getParameter("num"));
	int sum = 0;
	for (int i=1; i<=num; i++) {
		sum += i;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<p>
1부터 <%=num %>까지의 총합은 <%=sum %>
</p>

</body>
</html>