 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
.h{
padding-left:10px;
padding-right:10px;
background-color:black;
margin:5px;
height:px;
color:white;
text-shadow:2px 2px 3px green;
}
table{
margin-bottom:25px;
margin-top:20px;
}


</style>

</head>
<body>
<div class="h"><center>Student details</center></div>
<table width="100%" border="2">
<tr><th>Name</th><th>sname</th><th>gender</th><th>date</th><th>dept</th><th>course</th><th>adno</th><th>mobno</th><th>email</th><th>type</th><th>hostel</th>
</tr>

<%
String user="";
long pass=0;
String crs=request.getParameter("id");
long num=Long.parseLong(crs);
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
 	Statement st=con.createStatement();
 	ResultSet r=st.executeQuery("select name,s_name,gender,dat,dept,course,ad_no,mb_no,email,veg,hostel,pass from  reg where ad_no='"+num+"'");
 	while(r.next())
 	{
 		user=r.getString(9);
 		System.out.println(user);
 		pass=r.getLong(12);
 		%>
 		
 		<tr><td><%=r.getString(1) %></td>
 		<td><%=r.getString(2) %></td>
 		<td><%=r.getString(3) %></td>
 		<td><%=r.getString(4) %></td>
 		<td><%=r.getString(5) %></td>
 		<td><%=r.getString(6) %></td>
 		<td><%=r.getLong(7) %></td>
 		<td><%=r.getLong(8) %></td>
 		<td><%=r.getString(9) %></td>
 		<td><%=r.getString(10) %></td>
 		<td><%=r.getString(11) %></td>
 		</tr>
 		</table>
 		<% 
 		 
 	}
}catch(Exception e){
	
	System.out.println(e);
}



%>
<center><form action="get.jsp"><input type="text" value="<% out.print(user); %>" name="user" hidden>
<input type="text" value="<% out.print(pass); %>" name="pass" hidden>
<input type="submit" value="back to home"></form></center>

</body>
</html>