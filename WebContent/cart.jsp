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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping Cart</title>
</head>
<%@ include file="head.html"%>
<body>
<form action="control" method="post">
<%
JourneyBean cart = (JourneyBean) request.getSession().getAttribute("cart");
Vector<Node> plac=cart.getNode();
if (plac.size()==0) {
	out.println("<center>Shopping Cart is Empty!</center>");
	}
else {
for (int i=0;i<plac.size();i++) {
	NodeList n=plac.elementAt(i).getChildNodes();
	for (int j=0;j<n.getLength();j++) {
		if (n.item(j) != null && n.item(j).getNodeName()=="title") {
		out.println("<p><input type='checkbox' id='"+i+"' name='delete' value='"+i+"'><label for='"+i+"'>"+n.item(j).getTextContent()+"</label></p>");
		}
	}
}
out.println("<center><input type='hidden' name='nextPage' value='cart'><input type='submit' name='yes' value='Delete'></center>");
}
%>
</form>
<center><button onclick='window.location.href="welcome.jsp"'>Back to search</button>
</center>
</body>
</html>