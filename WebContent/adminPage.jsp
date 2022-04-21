<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	if (session.getAttribute("user_id") != null) {
%>
<%=session.getAttribute("user_id") %> 님, 환영합니다. <br>

<button type="button" onclick="location.href='logout.jsp'">로그아웃</button>

<h1> 관리자 페이지 </h1>

<table border="1">
	<tr>
		<td>번호</td>
		<td>기능</td>
	</tr>
	
	<tr>
		<td>1</td>
		<td><button type="button" onclick="location.href='userList.jsp'">유저 목록</button></td>
	</tr>
	
	<tr>
		<td>3</td>
		<td><button type="button" onclick="location.href='board.jsp'">게시판으로 가기</button></td>
	</tr>
	</table>
	
	<% } %>

</body>
</html>