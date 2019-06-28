<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
table{
margin-bottom:40px;
}
.h{
padding-left:10px;
padding-right:10px;
background-color:green;
margin:5px;
height:25px;
color:white;
text-shadow:2px 2px 3px green;
}
a{
float:left;
color:white;
font-weight:bold;
margin-left:10px;
background-color:black;
border-radius:15px;
padding:2px;
text-decoration:none;

}
</style>
</head>
<body>
<center><a href="view.html">Back to home</a></center>
<div class="h"><center><h3><u>Student details</u></h3></center></div>

<%

String crs=request.getParameter("crs");
String hst=request.getParameter("hst");
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
 	Statement st=con.createStatement();
 	ResultSet r=st.executeQuery("select name,s_name,gender,dat,dept,course,ad_no,mb_no,email,veg,hostel from  reg where course='"+crs+"'");
 
 	
 	while(r.next())
 	{
 		%>
 <table width="100%" border="2">
<tr><th>Name</th><th>Sname</th><th>Gender</th><th>DOB</th><th>Dept</th><th>Course</th><th>Adno</th><th>Mobno</th><th>Email</th><th>Type</th><th>Hostel</th>
</tr>
 		

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
 

</body>
</html>