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
	
	String uNo = request.getParameter("uNo");
	String uerID = request.getParameter("uerID");
	String userPW = request.getParameter("userPW");
	
	UserDAO dao = new UserDAO();
	
	dao.userUpdate(userPW, uerID);
	
%>

<script type="text/javascript">

location.href = "adminPage.jsp"</script>
</body>
</html>