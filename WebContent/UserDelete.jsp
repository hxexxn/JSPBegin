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

	String userID = request.getParameter("userID");
	
	UserDAO dao = new UserDAO();
	dao.userDelete(userID);
%>

<script type="text/javascript">
	location.href="adminPage.jsp";
</script>

</body>
</html>