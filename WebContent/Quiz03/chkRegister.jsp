<%@page import="java.sql.SQLIntegrityConstraintViolationException"%>
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
<body>
<% 
request.setCharacterEncoding("utf8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String name = request.getParameter("name");
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");
String sql = "insert into members values(?,?,?,?,?)";
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@192.168.0.58:1521:xe";
Connection conn = DriverManager.getConnection(url, "jsp", "1234");
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);   pstmt.setString(2, pwd);
pstmt.setString(3, name); pstmt.setString(4, addr);
pstmt.setString(5, tel);
int howRow = 0 ;
	try{
		howRow = pstmt.executeUpdate();
	}catch(Exception e){
		out.print("<script>alert('아이디가 존재합니다.');"
				+"location.href='register.jsp';</script>");


	}	
	if(howRow == 1){
		out.print("<script>alert('회원가입을 축하합니다.');"
					+"location.href='login.jsp';</script>");
	}


%>




</body>
</html>