<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
=======
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
>>>>>>> eed6a43cc476a9c7f8c3215e8cdf3198c2a06a90
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
</head>
<body>
<<<<<<< HEAD

=======
<fmt:requestEncoding value="UTF-8"/>
<jsp:useBean id="dao" class="DB.DAO"/>
<jsp:useBean id="member" class="DB.Member" />
<jsp:setProperty property="*" name="member"/>
${dao.membership(member) }
<c:redirect url="../login/login.jsp"/>
>>>>>>> eed6a43cc476a9c7f8c3215e8cdf3198c2a06a90
</body>
</html>