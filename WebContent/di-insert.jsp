<%@page import="common.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
request.setCharacterEncoding("UTF-8");
String diCode = request.getParameter("di_code");
String diName = request.getParameter("di_name");
String diEtc = request.getParameter("di_etc");
if(diCode!=null && diName!=null){
	Connection con = null;
	PreparedStatement ps = null;
	try{
		con = DBCon.getCon();
		String sql = "insert into depart_info(di_num, di_code, di_name, di_etc)";
		sql +=" values(seq_di_no.nextval, ?,?,?)";
		ps = con.prepareStatement(sql);
		ps.setString(1,diCode);
		ps.setString(2,diName);
		ps.setString(3,diEtc);
		if(ps.executeUpdate()==1){
%>
	<script>
		alert('등록 완료');
		location.href='/di-list.jsp';
	</script>
<%
		}
	}catch(Exception e){
		out.println(e);
	}finally{
		if(ps!=null){
			ps.close();
		}
		if(con!=null){
			con.close();
		}
	}
	return;
}
%>
<form method="post">
부서코드 : <input type="text" name="di_code"><br>
부서명 : <input type="text" name="di_name"><br>
부서설명 : <input type="text" name="di_etc"><br>
<button>부서등록</button>
</form>
</body>
</html>