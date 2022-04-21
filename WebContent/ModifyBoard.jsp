<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.BoardDTO"%>
<%@page import="service.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%

	String bNo = request.getParameter("bNo");

	String bTitle = request.getParameter("bTitle");
	String bContent = request.getParameter("bContent");
	
	BoardDAO dao = new BoardDAO();
	BoardDTO dto = dao.boardSelectView(bNo);
	request.setAttribute("dto", dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="css/mine.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<body>

	
	
	<form action="BoardModifyUpdate.jsp" id="modiForm" method="get">
		<h1> 글 수정하기</h1>
		
		<p><input type="hidden" value="${dto.bNo}" id="bNo" name="bNo"></p>
		<p>작성자 : ${dto.bWriter}</p>
		<p>글 제목 : <input type="text" value="${dto.bContent}" id="bTitle" name="bTitle"></p>
		<p>글 내용 : <input type="text" value="${dto.bRegData}" id="bContent" name="bContent"></p>
	
		<p><input type="button" id="boardModifyBtn" value="수정">
	</form>

<!-- <h1> 글 수정하기 </h1>
<form>

	글 제목 : <input type="text" name="bTitle" id="bTitle" value="">
	글 내용 : <input type="text" name="bTitle" id="bTitle" value="">
	
	<input type="button" id="boardModifyBtn" value="수정">
</form>
<form action="boardRegistProcess.jsp" method="post" id="boardRegForm">
	글 제목 : <input type="text" name="bTitle" id="bTitle"><br>
	글 내용 : <input type="text" name="bContent" id="bContent"><br>

	<input type="button" id="boardRegBtn" value="등록">

</form> -->

<script type="text/javascript" src="js/mine.js"></script>
</body>
</html>