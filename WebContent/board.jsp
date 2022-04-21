<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="service.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    BoardDAO dao = new BoardDAO();
	List<BoardDTO> list = dao.boardSelect();
    request.setAttribute("list", list);
    %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IndexPage</title>
</head>
<!-- <link rel="stylesheet" type="text/css" href="./css/mine.css?"> -->
<link href="/JSPBegin/css/mine.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<body>

	<a href="boardRegist.jsp">글쓰기</a> &emsp;
	<a href="index.jsp">홈으로 가기</a><br>

	<table border="1">
		<tr class="oneTr">
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>		
		</tr>
		
		<c:forEach var="dto" items="${list}">
		
			<tr>
				<td>${dto.bNoa}</td>
		
				<td><a href="boardContent.jsp?bNo=${dto.bNo}">${dto.bTitle}</a></td>

				<td>${dto.bWriter}</td>

				<td>
				<fmt:formatDate value="${dto.bRegData}" pattern="MM-dd"/>
				</td>
			</tr>
		
		</c:forEach>
	
<%-- 	<% 
	for (BoardDTO dto : list) {
	%> --%>
<%-- 	<tr>
		<td>
		<%=dto.getbNo()%>
		</td>
		<td>
		<a href="boardContent.jsp?bNo=<%=dto.getbNo()%>"><%=dto.getbTitle()%></a>
		</td>
		<td>
		<%=dto.getbWriter()%>
		</td>
		<td>
		<%=dto.getbRegData()%>
		</td>
		</tr>
	<% } %>	 --%>
	</table>



<script type="text/javascript" src="/JSPBegin/js/mine.js"></script>
</body>
</html>