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
<script type="text/javascript">
function change(){
	
	
	
}
</script>



</head>
<body>showInfo.jsp<br>
<form action="modifyInfo.jsp">
<table>
<tr>
<td>아이디:</td><td><input type="text" id="dId" name="id"></td>
</tr>
<tr>
<td>비밀번호:</td><td><input type="text" id="dPwd"name="pwd"></td>
</tr>
<tr>
<td>이름:</td><td><input type="text" id="dName"name="name"></td>
</tr>
<tr>
<td>주소:</td><td><input type="text" id="dAddr"name="addr"></td>
</tr>
<tr>
<td>전화번호:</td><td><input type="text" id="dTel"name="tel"></td>
</tr>
<tr>
<td><input type="submit"value="수정"onclick="change()"></td><td><input type="button"value="삭제" onclick="location.href='delete.jsp'"></td>
</tr>
</table>
</form>

<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@192.168.0.58:1521:xe";
String id ="jsp",pwd="1234";
Connection con=DriverManager.getConnection(url,id,pwd);
String sql="select * from members where id='"+(String)session.getAttribute("id")+"'";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
%>
<%if(rs.next()){ %>
<script type="text/javascript">
document.getElementById("dId").value="<%=rs.getString("id")%>"
document.getElementById("dPwd").value="<%=rs.getString("pwd")%>"
document.getElementById("dName").value="<%=rs.getString("name")%>"
document.getElementById("dAddr").value="<%=rs.getString("addr")%>"
document.getElementById("dTel").value="<%=rs.getString("tel")%>"
</script>	

<%}%>

</body>
</html>