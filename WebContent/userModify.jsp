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
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<body>

<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	String userID = request.getParameter("userID");
	
	UserDAO dao = new UserDAO();
	UserDTO dto = dao.userListView(userID);
	
%>
	<form action="UserModifyUpdate.jsp" id="userModiForm" method="get">
		<h1> 유저 정보 수정하기</h1>
		
		<p><input type="hidden" value="<%=dto.getuNo()%>" id="uNo" name="uNo"></p>
		<p><input type="hidden" value="<%=dto.getUerID()%>" id="userID" name="uerID"></p>
		<p>아이디 : <%=dto.getUerID()%></p>
		<p>비밀 번호 : <input type="text" value="<%=dto.getUserPW()%>" id="userPW" name="userPW"></p>
		<p>가입일 : <%=dto.getUserRegeDate()%></p>
	
		<p><input type="button" id="userModifyBtn" value="수정">
	</form>
<script type="text/javascript" src="/JSPBegin/js/mine.js"></script>
</body>
</html>