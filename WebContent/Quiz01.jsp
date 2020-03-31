<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
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
String url="jdbc:oracle:thin:@192.168.0.58:1521:xe";
String id ="jsp",pwd="1234";
Connection con=DriverManager.getConnection(url,id,pwd);
String sql = "select * from student";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
out.print("<table border='1'");
ArrayList st=new ArrayList();
st.add("학번");st.add("이름");st.add("국어");st.add("영어");st.add("수학");
out.print("<tr>");
for(int i=0;i<st.size();i++){
out.print("<td>");
out.print(st.get(i));
out.print("</td>");
}
out.print("</tr>");

while(rs.next()){%>
<tr>
<td><%=rs.getString("stuNumber")%></td>
<td><a href="Quiz02.jsp?stuNumber=<%=rs.getString("stuNumber")%>"><%=rs.getString("name")%></a></td>
<td><%=rs.getString("kor")%></td>
<td><%=rs.getString("eng")%></td>
<td><%=rs.getString("math")%></td>
</tr>

<%}%>
</table>

</body>
</html>