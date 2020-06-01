<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<jsp:useBean id="dao" class="DB.DAO" />
	<%
		ArrayList<String> li = dao.check();
	StringBuffer values = new StringBuffer();
	for (int i = 0; i < li.size(); i++) {
		if (values.length() > 0) {
			values.append(',');
		}
		values.append('"').append(li.get(i)).append('"');
	}
	%>

	<script>
		var checkID = 0;
		console.log("dasdfasdfas");
		function ms() {
			if (!document.getElementById("id").value) {
				alert("아이디를 입력하세요");
			} else if (!document.getElementById("pwd").value) {
				console.log(a)
				alert("비밀번호를 입력하세요");
			} else if (document.getElementById("pwd").value != document
					.getElementById("pwdc").value) {
				alert("비밀번호가 일치하지 않습니다");
			} else if (!document.getElementById("name").value) {
				alert("이름를 입력하세요");
			} else if (checkID == 0) {
				alert("아이디 중복확인을 하세요");
			} else {
				document.getElementById("form").submit();
			}
		}
		function check() {
			console.log("체크");
			var li = [
	<%=values.toString()%>
		];
			if (!document.getElementById("id").value) {
				alert("아이디를 입력하세요");
			} else {

				if (li.length == 0 && document.getElementById("id").value) {
					alert("사용가능한 아이디입니다");
					checkID = 1;
				} else {
					for (var a = 0; a < li.length; a++) {

						if (li[a] == document.getElementById("id").value) {
							alert("아이디 중복");
							break;
						} else if (a == li.length - 1) {
							alert("사용가능한 아이디입니다");
							checkID = 1;
						}
					}
				}

			}
		}
	</script>
	<form id="form" action="regchk.jsp" method="post">
		<input type="text" id="id" name="id" placeholder="아이디"> <input
			type="button" onclick="check()" value="중복체크"><br> <input
			type="password" id="pwd" name="pwd" placeholder="비밀번호"><br>
		<input type="password" id="pwdc" placeholder="비밀번호 확인"><br>
		<input type="text" id="name" name="name" placeholder="이름"><br>
		<input type="button" onclick="ms()" value="회원가입">
	</form>
	<%@ include file="../footer.jsp"%>
</body>
</html>