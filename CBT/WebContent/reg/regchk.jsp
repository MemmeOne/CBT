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
<fmt:requestEncoding value="UTF-8"/>
<jsp:useBean id="dao" class="DB.DAO_reg"/>
<jsp:useBean id="member" class="DB.Member"/>
<jsp:setProperty property="*" name="member"/>
${dao.membership(member) }
<c:redirect url="../login/login.jsp"/>
</body>
</html>