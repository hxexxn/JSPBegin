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


	<form id="loginForm">
		
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id" id="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="user_pw" id="user_pw"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" id="loginBtn" value="login">
					<input type="button" value="go home" id="homeBtn">
				</td>
			</tr>
		</table>
	
	
	</form>

<script type="text/javascript" src="js/mine.js"></script>
</body>
</html>