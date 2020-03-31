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
<body>loginCheck.jsp<br>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@192.168.0.58:1521:xe";
String id ="jsp",pwd="1234";
Connection con=DriverManager.getConnection(url,id,pwd);
String sql ="select * from members where id='"+request.getParameter("id") + "'";
PreparedStatement ps=con.prepareStatement(sql); 
ResultSet rs=ps.executeQuery();

if(!rs.next()){%>
<script type="text/javascript">
	alert("아이디가 일치하지 않습니다.");
	location.href = "login.jsp";
</script>
<%}else{
if(!rs.getString("pwd").equals(request.getParameter("pwd"))){%>
<script type="text/javascript">
	alert("비밀번호가 일치하지 않습니다.");
	location.href = "login.jsp";
</script>
<%}else{
	session.setAttribute("name", rs.getString("name"));
	session.setAttribute("id", rs.getString("id"));
	response.sendRedirect("main.jsp");
}
}%>
</body>
</html>