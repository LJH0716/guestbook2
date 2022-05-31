<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제폼</title>
</head>
<body>
	<form action="./gbc" method="post">
	비밀번호 <input type="password" name="password" value=""> <button type="submit">확인</button><br>
	<input type="hidden" name="no" value="<%=no%>">
	<a href="/guestbook2/gbc?action=addList">메인으로 돌아가기</a>
	<input type="hidden" name="action" value="delete">
	</form>
</body>
</html>