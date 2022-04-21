<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IndexPage</title>
</head>
<link href="css/mine.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<body>


<c:if test="${not empty sessionScope.user_id}">

	<c:set var="sess" value="${sessionScope.user_id}"/>
	<c:out value="${sess}"/> 님 환영합니다. <br>
	<button type="button" onclick="location.href='logout.jsp'">로그아웃</button>

	
	<h1>JSP로만 이루어진 기능</h1>

	<table border="1">
	<tr>
		<td>번호</td>
		<td>기능</td>
	</tr>
	
	<tr>
		<td>2</td>
		<td><button type="button" onclick="location.href='userRegist.jsp'">회원가입</button></td>
	</tr>
	
	<tr>
		<td>3</td>
		<td><button type="button" onclick="location.href='board.jsp'">게시판으로 가기</button></td>
	</tr>
	
	<tr>
		<td>4</td>
		<td><button type="button" onclick="location.href='image.jsp'">이미지로 가기</button></td>
	</tr>
	</table>
</c:if>

<c:if test="${empty sessionScope.user_id}">

<h1>JSP로만 이루어진 기능</h1>

	<table border="1">
	<tr>
		<td>번호</td>
		<td>기능</td>
	</tr>
	<tr>
		<td>1</td>
		<td><button type="button" onclick="location.href='login.jsp'">로그인</button></td>
	</tr>
	<tr>
		<td>2</td>
		<td><button type="button" onclick="location.href='userRegist.jsp'">회원가입</button></td>
	</tr>
	<tr>
		<td>3</td>
		<td><button type="button" onclick="location.href='board.jsp'">게시판으로 가기</button></td>
	</tr>
	</table>
</c:if>

<script type="text/javascript" src="js/mine.js"></script>
</body>
</html>