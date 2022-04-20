<%@page import="service.BoardDAO"%>
<%@page import="model.BoardDTO"%>
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
	
	String bTitle = request.getParameter("bTitle");
	String bContent = request.getParameter("bContent");
	String bNo = request.getParameter("bNo");
	
	BoardDAO dao = new BoardDAO();
	dao.boardUpdate(bTitle, bContent, bNo);
	response.sendRedirect("boardContent.jsp?bNo=" + bNo);
	
%>

<script type="text/javascript">

location.href = "board.jsp"</script>



</body>
</html>