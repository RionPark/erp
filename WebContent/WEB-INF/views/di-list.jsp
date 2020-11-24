<%@page import="vo.DepartInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>부서번호</th>
		<th>부서코드</th>
		<th>부서명</th>
		<th>부서설명</th>
		<th>부서인원</th>
	</tr>
<c:forEach items="${diList}" var="di">
	<tr>
		<td>${di.diNum}</td>
		<td>${di.diCode}</td>
		<td>${di.diName}</td>
		<td>${di.diEtc}</td>
		<td>${di.diCnt}</td>
	</tr>
</c:forEach>
</table>
<a href="/views/di-insert"><button>부서등록</button></a>

</body>
</html>