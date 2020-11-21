<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>    
<jsp:useBean id="di" class="vo.DepartInfoVO"></jsp:useBean> 
<jsp:useBean id="dib" class="beans.DepartInfoBean"/> 
<jsp:setProperty property="*" name="di"/>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(di.getDiName()!=null){
	int cnt = dib.setDepartInfo(di);
	if(cnt==1){
		out.println("입력잘됨!");
	}else{
		out.println("에러남");
	}
	return;
}
%>
<form method="post">
부서번호 : <input type="text" name="diNum"><br>
부서코드 : <input type="text" name="diCode"><br>
부서명 : <input type="text" name="diName"><br>
부서설명 : <input type="text" name="diEtc"><br>
부서인원 : <input type="text" name="diCnt"><br>
<button>부서등록</button>
</form>
</body>
</html>