<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>login.jsp<br>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>
	<%	//아이디,비밀번호 공백으로 입력했을때 알림창
		if(request.getParameter("userid")!=null ) {
			String userid=request.getParameter("userid");
			if(userid.equals("none")) { %>
				<script type="text/javascript">
					alert("아이디를 입력하세요")
				</script>
	<%		}else if(userid.equals("wrong")) { %>
				<script type="text/javascript">
					alert("없는 아이디입니다")
				</script>
	<%		}
		}
		if(request.getParameter("userpwd")!=null) {
			String userpwd=request.getParameter("userpwd");
			if(userpwd.equals("none")) { %>
				<script type="text/javascript">
					alert("비밀번호를 입력하세요")
				</script>
	<%		}else if(userpwd.equals("wrong")) { %>
				<script type="text/javascript">
					alert("비밀번호가 틀렸습니다")
				</script>
	<%		}
		}
	%>
	<form action="loginchk.jsp" method="post">
		<table>
			<tr>
				<th><input type="text" placeholder="아이디" name="id"></th>
				<th rowspan="2"><input type="submit" value="로그인">
			</tr>
			<tr>
				<th><input type="password" name="pwd" placeholder="비밀번호"></th>
			</tr>
		</table>
	</form>
</body>
</html>