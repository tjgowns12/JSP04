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
<% 
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@192.168.0.58:1521:xe";
String id ="jsp",pwd="1234";
Connection con=DriverManager.getConnection(url,id,pwd);
String sql="delete from members where id='"+session.getAttribute("id")+"'";
PreparedStatement ps =con.prepareStatement(sql);
ps.executeUpdate();
response.sendRedirect("login.jsp");
%>






</body>
</html>