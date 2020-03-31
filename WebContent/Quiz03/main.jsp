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
<style type="text/css">
td{text-align: center}
</style>
<title>Insert title here</title>
</head>
<body>Quiz03_main.jsp<br>
<script type="text/javascript">
alert("<%=session.getAttribute("name")%>"+"님 환영합니다")
</script>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@192.168.0.58:1521:xe";
String id ="jsp",pwd="1234";
Connection con=DriverManager.getConnection(url,id,pwd);
String sql = "select * from members";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
%>
<table border="1">
<tr>
<td>아이디</td><td>비밀번호</td><td>이름</td><td>주소</td><td>전화번호</td>
</tr>

<%while(rs.next()){ %>
<tr>
<td><%=rs.getString("id")%></td>
<td><%=rs.getString("pwd") %></td>
<td><%=rs.getString("name") %></td>
<td><%=rs.getString("addr") %></td>
<td><%=rs.getString("tel") %></td>
</tr>
<%} %>
</table>

<input type="button" value="로 그 아 웃" onclick="location.href='logout.jsp'">
<input type="button" value="계정 정보" onclick="location.href='showInfo.jsp'">




</body>
</html>