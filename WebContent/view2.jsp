<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
td{
width:60px;
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
table{
margin-bottom:20px;
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




</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>student fees details</title>
</head>
<body>
<h4><a href="view.html">Back</a></h4>
<div class="h"><center><h3><u>Student fees details</u></h3></center></div>

<%
long num=0;
ArrayList<Long> l=new ArrayList<Long>();
ArrayList<Long> l2=new ArrayList<Long>();
float scoller=0;
float paid=0;
//float btotal=0;
//float sum=0;
//float remain=0;
float btotal=0;
 		float sum=0;
 		float remain=0;

String crs=request.getParameter("crs");

try{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
 	Statement st=con.createStatement();
 	ResultSet rs=st.executeQuery("select ad_no,course from reg where course='"+crs+"'");
 	
 	while(rs.next())
 	{
 		
 		 
 	
 	
 	
 	
 	 	 l2.add(rs.getLong(1));
 	}
 	for(int i=0;i<l2.size();i++)
 	{
 	 	ResultSet res1=st.executeQuery("select sum(total) from monthly where ad_no='"+l2.get(i)+"' ");
 	 	if(res1.next())
 	 		
 	 	{
 	 		
 	 		btotal=res1.getFloat(1);
 	 		
 	 	}
 	 	ResultSet res=st.executeQuery("select sum(scoller),sum(candidate_paid) from entry1 where ad_no='"+l2.get(i)+"' ");
 	 	if(res.next())
 	 	{
 	 		scoller=res.getFloat(1);
 	 		paid=res.getFloat(2);
 	 	 
 	 		
 	 	}
 	 	sum=scoller+paid;
 	 	remain=btotal-sum;
 	 
 	 	PreparedStatement ps=con.prepareStatement("update tot_bill set scoller=?,c_paid=?,b_total=?,remain=?  where ad_noo='"+l2.get(i)+"' ");
 	 	//ps.setLong(1,num);
 	 	ps.setFloat(1,scoller);
 	 	ps.setFloat(2,paid);
 	 	ps.setFloat(3,btotal);
 	 	ps.setFloat(4,remain);
 	 	int n=ps.executeUpdate();
 		//System.out.println("sucess2");
 	 	if(n>0)
 	 	{
 	 		System.out.println("sucess");
 	 	}
 	 	System.out.println(scoller);
 	 	System.out.println(paid);
 	 	System.out.println(btotal);
 	 	System.out.println(remain);
 	 
 	}
 	ResultSet r=st.executeQuery("select ad_no from  reg where course='"+crs+"'");
 	while(r.next())
 	{
 		l.add(r.getLong(1));
 	}
 	
 	for(int i=0;i<l.size();i++)
 	{
 	
 	 	ResultSet r1=st.executeQuery("select name,ad_noo,scoller,c_paid,b_total,remain from tot_bill  where ad_noo='"+l.get(i)+"'");
 	 	while(r1.next())
 	 	{
 	 		%>
 	 		
 	 		<center><table border="1">
 	 		<tr><th>Name</th><th>admn no</th><th>scholarship</th><th>candidate paid</th><th>total</th><th>due</th></tr>
 	 		<tr><td><%= r1.getString(1) %></td><td><%= r1.getLong(2) %></td><td><%= r1.getFloat(3) %></td><td><%= r1.getFloat(4) %></td><td><%= r1.getFloat(5) %></td><td><%= r1.getFloat(6) %></td>
 	 		
 	 		</tr>
 	 		
 	 		</table></center>
 	 		
 	 		<% 
 	 	}
 	 	
 	 		
 	 	
 	 	}
 	
 
 	}catch(Exception e){
 		
 		System.out.println("hear...");
 		e.printStackTrace();
 
 	}


 	%>

 		
 		 
</body>
</html>