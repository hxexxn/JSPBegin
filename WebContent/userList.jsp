<%@page import="model.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="service.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<a href="index.jsp">홈으로 가기</a><br>

	<table border="1">
		<tr class="oneTr">
			<td>번호</td>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>가입일</td>		
		</tr>
	
	<% 
	UserDAO dao = new UserDAO();
	List<UserDTO> list = dao.userList();
	
	for (UserDTO dto : list) {
	
	%>
	<tr>
		<td>
		<%=dto.getuNo()%>
		</td>
		<td>
		<a href="userContent.jsp?uerID=<%=dto.getUerID()%>"><%=dto.getUerID()%></a>
		</td>
		<td>
		<%=dto.getUserPW()%>
		</td>
		<td>
		<%=dto.getUserRegeDate()%>
		</td>
		</tr>	
	<% } %>
	</table>

</body>
</html>