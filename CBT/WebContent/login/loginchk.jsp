<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>loginchk.jsp<br>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
	<!-- 아이디,비밀번호 공백인지 확인 -->
	<jsp:useBean id="dao" class="DB.DAO" />
	<c:set var="dbpwd" value="${dao.loginchk(param.id) }" />
	${dbpwd}
	<c:choose>
		<c:when test="${param.id=='' }">
			<c:redirect url="login.jsp?userid=none" />
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${param.pwd=='' }">
					<c:redirect url="login.jsp?userpwd=none" />
				</c:when>
				<c:otherwise>
					<c:choose>
						<c:when test="${dbpwd==''}">
							<c:redirect url="login.jsp?userid=wrong" />
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${dbpwd==param.pwd}">
									<% session.setAttribute("userid",
											request.getParameter("id")); %>
									<c:redirect url="../main.jsp" />
								</c:when>
								<c:otherwise>
									<c:redirect url="login.jsp?userpwd=wrong" />
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
</body>
</html>