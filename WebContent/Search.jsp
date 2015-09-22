<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="edu.unsw.comp9321.*,
java.util.*,
javax.servlet.*,
java.io.*,
javax.xml.xpath.*,
org.w3c.dom.*,
org.xml.sax.InputSource,
com.sun.org.apache.xerces.internal.parsers.DOMParser"
%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Results</title>
</head>
<body>
<%@ include file="head.html"%>
<center><%@ include file="bottom.html"%></center>
<br />
<%
JourneyBean journey1 = (JourneyBean) request.getSession().getAttribute("journey1");
int pnum=Integer.parseInt((String)request.getParameter("pnum"));
Vector<String> plac=journey1.getPlaces();
if (plac.size()==0) {
	out.println("<center>Sorry, no matching datasets found!</center>");
}
else {
	if (plac.size()>10) {
		if (pnum*10<plac.size()) {
			for (int i=pnum*10-10;i<pnum*10;i++) {
				out.println("<p><a href='control?dt="+plac.elementAt(i).toString()+"&nextPage=details&num="+i+"'>"+plac.elementAt(i).toString()+"</a></p>");
			}
			if (pnum==1) {
				out.println("<center><a href='Search.jsp?pnum="+(pnum+1)+"'>Next Page</a></center>");
			}
			else {
				out.println("<center><a href='Search.jsp?pnum="+(pnum-1)+"'>Previous Page</a>");
				out.println("<a href='Search.jsp?pnum="+(pnum+1)+"'>Next Page</a></center>");
			}
		}
		else {
			for (int i=pnum*10-10;i<plac.size();i++) {
				out.println("<center><p><a href='control?dt="+plac.elementAt(i).toString()+"&nextPage=details&num="+i+"'>"+plac.elementAt(i).toString()+"</a></p>");
			}
				out.println("<a href='Search.jsp?pnum="+(pnum-1)+"'>Previous Page</a></center>");
		}
	}
	else {
		for (int i=0;i<plac.size();i++) {
			out.println("<p><a href='control?dt="+plac.elementAt(i).toString()+"&nextPage=details&num="+i+"'>"+plac.elementAt(i).toString()+"</a></p>");
		}
	}
}
%>

<button onclick='window.location.href="welcome.jsp"'>Back to search</button>
</body>
</html>