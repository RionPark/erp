<%@page import="vo.DepartInfoVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
List<DepartInfoVO> diList = (List<DepartInfoVO>)request.getAttribute("diList");
for(DepartInfoVO diVO:diList){
	out.println("번호  : " + diVO.getDiNum() + "<br>");
}
%>
</body>
</html>