<%@page import="common.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
request.setCharacterEncoding("UTF-8");
Connection con = null;
PreparedStatement ps = null;
String emName = request.getParameter("em_name");
if(emName!=null){
	int diNum = Integer.parseInt(request.getParameter("di_num"));
	String emId = request.getParameter("em_id");
	String emPwd = request.getParameter("em_pwd");
	String sql = "insert into employee(em_num,em_name, di_num, em_id, em_pwd)";
	sql += " values(seq_em_num.nextval,?,?,?,?)";
	try{
		con = DBCon.getCon();
		ps = con.prepareStatement(sql);
		ps.setString(1,emName);
		ps.setInt(2,diNum);
		ps.setString(3,emId);
		ps.setString(4,emPwd);
		if(ps.executeUpdate()==1){
%>
		<script>
			alert('사원등록 완료~');
			location.href='/em-list.jsp';
		</script>
<%
		}
	}catch(Exception e){
		out.print(e);
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
</head>
<body>
<form method="post">
사원명 : <input type="text" name="em_name"><br>
부서명 : <select name="di_num"> 
<option value="">부서선택</option>
<%
ResultSet rs = null;
try{
	con = DBCon.getCon();
	String sql = "select * from depart_info order by di_code";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	while(rs.next()){
%>
	<option value="<%=rs.getInt("di_num") %>">
		<%=rs.getString("di_name") %>
	</option>
<%
	}
}catch(Exception e){
	out.println(e);
}finally{
	if(rs!=null){
		rs.close();
	}
	if(ps!=null){
		ps.close();
	}
	if(con!=null){
		con.close();
	}
}
%>
</select><br>
사원아이디 : <input type="text" name="em_id"><br>
사원비번 :<input type="password" name="em_pwd"> <br>
<button>사원등록</button>
</form>
</body>
</html>