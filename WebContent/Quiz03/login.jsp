<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="loginCheck.jsp">
<input type="text" placeholder="아이디" name="id"><br>
<input type="text" placeholder="비밀번호" name="pwd"><br>
<input type="submit" value="로 그 인">
<a href="register.jsp">회 원 가 입</a> 
</form>

</body>
</html>