<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ page import="com.javaex.dao.GuestbookDao"%>
<%@ page import="com.javaex.vo.GuestbookVo"%>
<%@ page import="java.util.List"%>


<%
List<GuestbookVo> gList = (List<GuestbookVo>)request.getAttribute("gList");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록입니다</title>
</head>
<body>
	<form action="./gbc" method="post">
		<input type="hidden" name="action" value="add">
		<table border="1">
		<tr>
			<td><label for="name">이름</label></td>
			<td><input id="name" type="text" name="name" value=""></td>
			<td><label for="password">비밀번호</label></td>
			<td><input id="password" type="text" name="password" value=""></td>
		</tr>
		<tr>
			<td colspan="4"><textarea name="content"></textarea></td>
		</tr>
		<tr>
			<td><button type="submit">등록</button></td>
		</tr>
	</table></form><br>

	<% for (int i=0; i < gList.size(); i++) {%>
		<table border="1">
			<tr>
				<td><%=gList.get(i).getNo()%></td>
				<td><%=gList.get(i).getName()%></td>
				<td><%=gList.get(i).getRegDate()%></td>
				<td><a href="./gbc?action=deleteForm&no=<%=gList.get(i).getNo()%>">[삭제]</a></td> 
			</tr>
			<tr>
				<td colspan="4"><%=gList.get(i).getContent()%></td>
			</tr>
		</table><br>
	<%} %>	


</body>
</html>