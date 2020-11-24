<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
var msgMap = {
		ss01 : '입력이 성공하였습니다.',
		err01 : '입력이 실패하였습니다.'
}
<c:if test="${msgCode != null}">
	alert(msgMap['${msgCode}']);
</c:if>
</script>
</head>
<body>
<form method="post" action="/depart/insert">
부서번호 : <input type="text" name="diNum" disabled><br>
부서코드 : <input type="text" name="diCode"><br>
부서명 : <input type="text" name="diName"><br>
부서설명 : <input type="text" name="diEtc"><br>
부서인원 : <input type="text" name="diCnt" disabled><br>
<button>부서등록</button>
</form>
</body>
</html>