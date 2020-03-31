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

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@192.168.137.134:1521:xe";
String id ="jsp",pwd="1234";
Connection con=DriverManager.getConnection(url,id,pwd);
String sql="select * from student where stuNumber='"+
		request.getParameter("stuNumber")+"'";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
%>

<h3>인 적 사 항</h3>
<%if(rs.next()){%>
학번:<%=rs.getString("stuNumber") %><br>
이름:<%=rs.getString("name") %><br>
국,영,수:<%=rs.getString("kor")%><%=rs.getString("eng")%><%=rs.getString("math")%>
<%}	%><br>
<input type="button" onclick="location.href='Quiz01.jsp'" value="뒤로가기">
</body>
</html>