<%@page import="model.UserDTO"%>
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

<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
		String uerID = request.getParameter("uerID");
	
		UserDAO dao = new UserDAO();
		UserDTO dto = dao.userListView(uerID);
%>
	
	<h1> 유저 상세보기 </h1>

	<h3> 번호 : 
		<span><%=dto.getuNo()%></span>
	</h3>
	
	<h3> 유저 아이디 : 
		<span><%=dto.getUerID()%></span>
	</h3>
	
	<h3> 글 유저 비밀번호 : 
		<span><%=dto.getUserPW()%></span>
	</h3>
	
	<h3> 가입일 : 
		<span><%=dto.getUserRegeDate()%></span>
	</h3>

			
	<a href="userModify.jsp?userID=<%=dto.getUerID()%>">유저 정보 수정</a> &emsp; 
	<a href="UserDelete.jsp?userID=<%=dto.getUerID()%>">삭제</a> &emsp; 
	<a href="board.jsp">목록</a> 

</body>
</html>