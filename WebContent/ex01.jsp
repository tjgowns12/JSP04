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
<body>ex01.jsp<br>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@192.168.0.58:1521:xe";
String id ="java",pwd="1234";
Connection con=DriverManager.getConnection(url,id,pwd);
String sql="select * from newst";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs= ps.executeQuery();
out.print("id    이름 나이<hr>");
while(rs.next()){%>
	<%=rs.getString("id") %>
	<%=rs.getString("name") %>
	<%=rs.getString("age") %>
	<hr>
	
<%} %>

<!-- Class.forName ojdbc를 오라클에 올림 에러가 뜨면 안됨 -->
<!-- 쿼리문: 전송할수 있는 전송객체를 만듬 -->
<!-- 결과물을 가져옴 resultset -->
</body>
</html>