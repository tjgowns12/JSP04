<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
<%response.setCharacterEncoding("utf-8");%>
function chk(){
	var pwd=document.getElementById("pwd").value
	var chkPwd=document.getElementById("chkPwd").value	
	var name=document.getElementById("name").value
	if(name==""){
		alert("아이디는 필수 항목입니다")
	}
	else if(chkPwd==""){
		alert("비밀번호 확인은 필수 항목입니다")
	}
	
	else if(name!=""&&pwd==chkPwd){
	fo.submit();
	}
}
function Pwd(){
	var pwd=document.getElementById("pwd").value
	var chkPwd=document.getElementById("chkPwd").value	
	if(pwd!=chkPwd){
		document.getElementById("put").innerHTML=""
		document.getElementById("put").innerHTML="불일치!!"	
	}
	else{
		document.getElementById("put").innerHTML=""
		document.getElementById("put").innerHTML="일치!!"
	}
	
}

</script>


</head>
<body>register.jsp<br>

<form action="chkRegister.jsp" id="fo"><br>
<input type="text" placeholder="아이디" name="id"id="name">(*필수 항목)<br>
<input type="text" placeholder="비밀번호" name="pwd"id="pwd"><br>
<input type="text" placeholder="비밀번호 확인" name="chkPwd"id="chkPwd" onchange="Pwd()"><span id="put">(*필수 항목)</span><br>
<input type="text" placeholder="이름" name="name"><br>
<input type="text" placeholder="주소" name="addr"><br>
<input type="text" placeholder="전화번호" name="tel"><br>
<input type="button" value="회원 가입"onclick="chk()">

</form>




</body>
</html>