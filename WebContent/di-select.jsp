<%@page import="common.DBCon"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
부서선택 : <select name="di_num"> 
<option value="">부서를 선택해주세요</option>
<%
Connection con = null;
PreparedStatement ps = null;
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
</select>