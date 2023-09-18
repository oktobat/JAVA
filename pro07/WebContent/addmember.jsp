<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="sec02.ex01.*, java.util.*"
    import="java.sql.Timestamp"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 출력창</title>
</head>
<body>

	<h1>회원 정보</h1>
	<% 
	    request.setCharacterEncoding( "utf-8" );
	%>
	<jsp:useBean id="m" class="sec02.ex01.MemberBean" scope="page" />
	<jsp:setProperty name="m" property="*" />
	
	<% 
	    MemberDAO dao = new MemberDAO();
		dao.addMember(m);
		List<MemberBean> list = dao.listMembers();
	%>
	
	<c:set var="members" value="<%=list %>" />
	
	<table border="1" width="800" align="center">
		<tr align="center" bgcolor="ffff66">
		   <th>아이디</th>
		   <th>비밀번호</th>
		   <th>이름</th>
		   <th>이메일</th>
		   <th>가입일자</th>
		   <th>취미</th>
		</tr>
		<c:forEach var="member" items="${members}">
			<tr align="center">
	       		<td>${member.id }</td>
		        <td>${member.pwd }</td>
		        <td>${member.name }</td>
		        <td>${member.email }</td>
		        <td>${member.joinDate }</td>
		        <td>${member.hobby }</td>
     		</tr>
		</c:forEach>
	</table>

</body>
</html>