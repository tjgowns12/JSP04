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
<body>modifyInfo.jsp<br>
<%response.setCharacterEncoding("utf-8");%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@192.168.0.58:1521:xe";
String id ="jsp",pwd="1234";
Connection con=DriverManager.getConnection(url,id,pwd);
String sql="update members set pwd=?,name=?,addr=?,tel=? where id='"+request.getParameter("id")+"'";
PreparedStatement ps =con.prepareStatement(sql);
ps.setString(1,request.getParameter("pwd") );
ps.setString(2,request.getParameter("name") );
ps.setString(3,request.getParameter("addr") );
ps.setString(4,request.getParameter("tel") );
ps.executeUpdate();
session.setAttribute("name",request.getParameter("name"));
response.sendRedirect("main.jsp");
%>



</body>
</html>