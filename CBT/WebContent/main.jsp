<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main {	display: flex;	flex-flow: column;	margin: 0 auto;}
.header {	order: 1;}
.section {	order: 2; height:500px;}

.footer {	order: 3;}
</style>
</head>
<body>
	<div class="main">
		<header class="header">
			<%@ include file="header.jsp"%>
		</header>
		<section class="section">
		zzzzzzzzzzzzzz
		</section>
		<footer class="footer">
			<%@ include file="footer.jsp"%>
		</footer>
	</div>
</body>
</html>