<%@page import="common.DBCon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 
    em-update.jsp : 업데이트하는 로직
    em-view.jsp : 보는것, 삭제하는것, 업데이트페이지로 가는버튼
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
window.onload = function(){
	var search_type = '<%=(request.getParameter("search_type")==null)?"":request.getParameter("search_type")%>';
	var di_num = '<%=request.getParameter("di_num")%>';
	var di_name = '<%=request.getParameter("di_name")%>';
	var em_name = '<%=request.getParameter("em_name")%>';
	document.querySelector('#em_name').value = em_name;
	document.querySelector('[name=search_type][value=' + search_type +']').checked = true;
	document.querySelector('#di_num').value = di_num;
	document.querySelector('#di_name').value = di_name;
	checkSearchType(document.querySelector('[name=search_type]:checked'));
}
function checkSearchType(obj){
	document.querySelector('#di_num').style.display='none';
	document.querySelector('#di_name').style.display='none';
	document.querySelector('#' + obj.value).style.display='';
}
</script>
<h1>JSP Test</h1>
<form>
<input type="radio" name="search_type" id="type1" value="di_num" checked onchange="checkSearchType(this)">
<label for="type1">선택</label>
<input type="radio" name="search_type" id="type2" value="di_name" onchange="checkSearchType(this)">
<label for="type2">검색</label>
부서명 : <select name="di_num" id="di_num"> 
<option value="">부서선택</option>
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
<input type="text" name="di_name" id="di_name" style="display:none"><br>
사원명 : <input type="text" name="em_name" id="em_name"><br>
<button>검색</button>
</form>
<table border="1">
	<tr>
		<th>사원번호</th>
		<th>사원이름</th>
		<th>부서번호</th>
		<th>부서명</th>
		<th>사원아이디</th>
		<th>입사일</th>
	</tr>
<%

String diNum = request.getParameter("di_num");
String emName = request.getParameter("em_name");
String diName = request.getParameter("di_name");
String searchType = request.getParameter("search_type");
String param = "di_num=" + diNum + "&em_name=" + emName + "&di_name=" + diName + "&search_type=" + searchType;
try{
	con = DBCon.getCon();
	String sql = "select em.em_num, em.em_name,em.em_id, em.di_num, di.di_name, to_char(to_date(em.credat) ,'YYYY-MM-DD') as credat\r\n" + 
			"from employee em\r\n" + 
			"left join depart_info di \r\n" + 
			"on em.di_num = di.di_num where 1=1 ";
	int cnt = 0;
	if(diNum!=null && !"".equals(diNum)){
		sql += " and di.di_num=?";
		cnt++;
	}
	if(emName!=null && !"".equals(emName)){
		sql += " and em_name = ?";
		cnt++;
	}
	if(diName!=null && !"".equals(diName)){
		sql += " and di_name like '%' ||  ? || '%'";
		cnt++;
	}
	
	sql += " order by em_num ";

	ps = con.prepareStatement(sql);

	if(diName!=null && !"".equals(diName)){
		ps.setString(cnt--, diName);
	}
	if(emName!=null && !"".equals(emName)){
		ps.setString(cnt--, emName);
	}
	if(diNum!=null && !"".equals(diNum)){
		ps.setString(cnt--, diNum);
	}
	rs = ps.executeQuery();
	boolean hasRow = false;
	while(rs.next()){
		hasRow = true;
%>
	<tr>
		<td><%=rs.getString("em_num")%></td>
		<td><a href="/em-view.jsp?em_num=<%=rs.getString("em_num")%>&<%=param%>"><%=rs.getString("em_name")%></a></td>
		<td><%=rs.getString("di_num")%></td>
		<td><%=rs.getString("di_name")%></td>
		<td><%=rs.getString("em_id")%></td>
		<td><%=rs.getString("credat")%></td>
	</tr>
<%
	}
	if(!hasRow){
%>
	<tr>
		<td colspan="5d">데이터 없단다</td>
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
</table>
<a href="/em-insert.jsp?<%=param%>"><button>사원등록</button></a>
</body>
</html>