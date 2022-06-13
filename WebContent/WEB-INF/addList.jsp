<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/guestbook2/gbc" method="get">
		<table border="1" width="510px">
			<tr>
				<td>이름</td><td>
				<input type="text" name="name"></td>
				<td>비밀번호</td><td>
				<input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea name="content" cols="68" rows="5"></textarea></td>
			</tr>
			<tr>
				<td colspan="4"><button type="submit">등록</button></td>
			</tr>
		</table>
		<input type="text" name="action" value="add">
	</form>
	<br/>

	<c:forEach items="${gList}" var="gList">
		<table border="1">
			<tr>
				<td width="50px">${gList.no }</td>
				<td width="150px">${gList.name }</td>
				<td width="300px">${gList.date }</td>
				<td>
					<a href="./gbc?action=deleteForm&no=${gList.no }">삭제</a>
				</td>
			</tr>
			<tr>
				<td colspan="4" width="590px">
					<p>
						${gList.content }
					</p>
				</td>
			</tr>
		</table>
		<br>
	</c:forEach>
	
</body>
</html>