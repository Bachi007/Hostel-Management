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



String sname=request.getPrameter("sname");
String adno=request.getPrameter("adno");
long ano=Long.parseLong(adno);
String crs=request.getPrameter("crs");
String hname=request.getPrameter("hm");
String days=request.getPrameter("day");
int dy=Integer.parseInt(days);
String cp=request.getPrameter("cp");
int cnp=Integer.parseInt(cp);
String ld=request.getPrameter("ld");
int lev=Integer.parseInt(ld);
String ss=request.getPrameter("ss");
float scs=Float.parseFloat(ss);

String cs=request.getPrameter("cp1");
float csp=Float.parseFloat(cs);
try
{
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");
 	
	Statement st=con.createStatement();
	ResultSet r=st.executeQuery("select name,ad_no from reg where name='"+sname+"' and ad_no='"+ano+"'");
	if(r.next()){
		
	
	
	PreparedStatement ps=con.prepareStatement("insert into entry values(?,?,?,?,?,?,?,?,?)");
	ps.setString(1,sname);
	ps.setLong(2,ano);
	ps.setString(3,crs);
	ps.setString(4,hname);
	ps.setInt(5,dy);
	ps.setInt(6,cnp);
	ps.setInt(7,lev);
	ps.setFloat(8,scs);
	ps.setFloat(9,csp);
	int n=ps.executeUpdate();
	if(n>0)
	{
		out.println("<h1><a href=admin.html>Sucessfully updated student details</a></h1>");
		
		
	}
	
	
	
	
	}else
	{
		out.println("<h1>not a valid student please enter valid admition number</h1><br><a href=adentry.html>try again</a>");
	}
	
	
}catch(Exception e){
	System.out.println(e);
	
}
%>

</body>
</html>