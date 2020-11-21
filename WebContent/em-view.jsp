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
String diNum = request.getParameter("di_num");
String emName = request.getParameter("em_name");
String diName = request.getParameter("di_name");
String searchType = request.getParameter("search_type");
String param = "di_num=" + diNum + "&em_name=" + emName + "&di_name=" + diName + "&search_type=" + searchType;
%>
<br>
<button onclick="goList()">리스트</button>
<script>
	function goList(){
		location.href='/em-list.jsp?<%=param%>';
	}
</script>
</body>
</html>