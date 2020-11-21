<%@page import="common.DBCon"%>
<%@page import="java.sql.*"%>
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
int diNum = Integer.parseInt(request.getParameter("di_num"));
String delete = request.getParameter("delete");
String update = request.getParameter("update");
Connection con = null;
PreparedStatement ps = null;
if("true".equals(delete)){
	con = DBCon.getCon();
	String sql = "delete from depart_info where di_num=?";
	ps = con.prepareStatement(sql);
	ps.setInt(1,diNum);
	if(ps.executeUpdate()==1){
%>
<script>
	alert('삭제 완료');
	location.href='/di-list.jsp';
</script>
<%
	}else{
%>
<script>
	alert('삭제 오류');
	location.href='/di-list.jsp';
</script>
<%		
	}
	return;
}
if("true".equals(update)){

	con = DBCon.getCon();
	String sql = "update depart_info set di_name=?, di_etc=?, di_code=? where di_num=?";
	ps = con.prepareStatement(sql);
	ps.setString(1,request.getParameter("di_name"));
	ps.setString(2,request.getParameter("di_etc"));
	ps.setString(3,request.getParameter("di_code"));
	ps.setInt(4,diNum);
	if(ps.executeUpdate()==1){
%>
<script>
	alert('수정 완료');
	location.href='/di-list.jsp';
</script>
<%
	}else{
%>
<script>
	alert('수정 오류');
	location.href='/di-list.jsp';
</script>
<%		
	}
	return;
}
%>
<form method="post">
<table border="1">
	<tr>
		<th>부서번호</th>
		<th>부서코드</th>
		<th>부서명</th>
		<th>부서설명</th>
	</tr>
<%
ResultSet rs = null;
try{
	con = DBCon.getCon();
	String sql = "select * from depart_info where di_num=?";
	ps = con.prepareStatement(sql);
	ps.setInt(1,diNum);
	rs = ps.executeQuery();
	if(rs.next()){
%>
	<tr>
		<td><%=rs.getString("di_num")%></td>
		<td><input type="text" name="di_code" value="<%=rs.getString("di_code")%>"></td>
		<td><input type="text" name="di_name" value="<%=rs.getString("di_name")%>"></td>
		<td><input type="text" name="di_etc" value="<%=rs.getString("di_etc")%>"></td>
	</tr>
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
	<tr>
		<td colspan="4">
			<button>수정</button>
			<a href="./di-view.jsp?di_num=<%=diNum%>&delete=true"><button type="button">삭제</button></a>
			<button onclick="goBack()" type="button">리스트</button>
		</td>
	</tr>
</table>
<input type="hidden" name="di_num" value="<%=diNum%>">
<input type="hidden" name="update" value="true">
</form>
<script>
function goBack(){
	history.back();
}
</script>
</body>
</html>