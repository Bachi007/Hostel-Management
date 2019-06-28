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
String sname=request.getParameter("sname");
String adno=request.getParameter("adno");
long ano=Long.parseLong(adno);
String crs=request.getParameter("crs");
String hname=request.getParameter("hm");
String days=request.getParameter("day");
int dy=Integer.parseInt(days)*55;
String cp=request.getParameter("cp");
int cnp=Integer.parseInt(cp)*20;
String ld=request.getParameter("ld");
int lev=Integer.parseInt(ld);
String ss=request.getParameter("ss");
float scs=Float.parseFloat(ss);
String mnt=request.getParameter("mnt");
String cs=request.getParameter("cp1");
float csp=Float.parseFloat(cs);
float room=450;
float total=cnp+dy+(room);
System.out.println(total);
try
{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
 	
	Statement st=con.createStatement();
	ResultSet r=st.executeQuery("select name,ad_no from reg where name='"+sname+"' and ad_no='"+ano+"'");
	if(r.next()){
		
	
	
	PreparedStatement ps=con.prepareStatement("insert into entry1 values(?,?,?,?,?,?,?,?,?,?)");
	ps.setString(1,sname);
	ps.setLong(2,ano);
	ps.setString(3,crs);
	ps.setString(4,hname);
	ps.setInt(5,dy);
	ps.setInt(6,cnp);
	ps.setInt(7,lev);
	ps.setFloat(8,scs);
	ps.setFloat(9,csp);
	ps.setString(10,mnt);
	int n=ps.executeUpdate();
	if(n>0)
	{
		
			
		
		PreparedStatement p=con.prepareStatement("insert into monthly values(?,?,?,?,?,?,?,?)");
		p.setString(1,sname);
		p.setLong(2,ano);
		p.setString(3,mnt);
		p.setInt(4,cnp);
		p.setInt(5,dy);
		p.setInt(6,lev);
		p.setFloat(7,room);
		p.setFloat(8,total);
		int b=p.executeUpdate();
		System.out.println(total);
	  
	if(b>0)
	{
		out.println("<center><h1><a href=admin.html>Sucessfully updated student monthly bill</a></h1></center>");
		
		
	}
	}
	
	
	
	
	}else
	{
		out.println("<h1>not a valid student please enter valid admition number ans student name</h1><br><a href=adentry.html>try again</a>");
	}
	
	
}catch(Exception e){
	System.out.println(e);
	
}
%>

</body>
</html>