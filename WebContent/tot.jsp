<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
//System.out.println(id);
long num=Long.parseLong(id);
float scoller=0;
float c_paid=0;
float remain=0;
float mtotal=0;
float tt=0;
try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
 Statement s=con.createStatement();
 ResultSet rs=s.executeQuery("select sum(total) from monthly where ad_no='"+num+"'");
if(rs.next())
{
mtotal=rs.getFloat(1);	
}

 ResultSet r=s.executeQuery("select sum(scoller),sum(candidate_paid) from entry1 where ad_no='"+num+"'");
 
 if(r.next())
 {
	 	 scoller=r.getFloat(1);
	 c_paid=r.getFloat(2);
	 tt=(c_paid)+(scoller);
	 remain=mtotal-tt;
	 %>
	 
	 <center><h3><u>Student Total Bill</u></h3>
	 <table border="2">
	 <tr><th>Admn no</th><th>Scholarship</th><th>candidate paid</th><th>total_mess_bill</th><th>Due fees</th>
	 </tr>
	 <tr>
	 <td><%=num %></td><td><%=scoller %></td><td><%=c_paid %></td><td><%=mtotal %></td><td><%=remain %></td>
	 </tr><br><tr>
	 </tr>
	 </table><br><br>
	 <form action="std.jsp"><input type="text" name="id" value="<% out.print(num);%>" hidden><input type="submit" value="back to student home"></form></center>
	 <% 
 }else{

		%>
		<h1>Opps !.. data is not available of this month</h1>
		<form action="std.jsp"><input type="text" name="id" value="<%out.print(num); %>" hidden>
		<input type="submit" value="back to student home"></form>
		<%
		 
	 
 }
	
	
	
	
}catch(Exception e)
{
	System.out.println(e);
}


%>

</body>
</html>