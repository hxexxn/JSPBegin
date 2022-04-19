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

	<h1>결과 출력 (result2.jsp 내용입니다.)</h1>
	
	<%
	request.setCharacterEncoding("utf-8");
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	%>
	
	<%
		if (user_id == null || user_id.length() == 0) {
	%>
	
		<h3>아이디를 입력해주세요.</h3>
		<button id="homeBtn"> go home </button>
	
	<%
		} else {
	%>

		<h3>환영합니다. <%=user_id %> 님!</h3>
	
	<% 
		} 
	%>


<script type="text/javascript" src="js/mine.js"></script>
</body>
</html>