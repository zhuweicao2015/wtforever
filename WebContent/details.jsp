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
     
<%
JourneyBean journey1 = (JourneyBean) request.getSession().getAttribute("journey1");
JourneyBean det = (JourneyBean) request.getSession().getAttribute("detail");
Vector<String> plac=journey1.getPlaces();
int i = Integer.parseInt(det.getString());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Details</title>
</head>
<%@ include file="head.html"%>
<body>
<center>
<%
NodeList node=journey1.getNode().elementAt(i).getChildNodes();
for (int j=0;j<node.getLength();j++) {
	if (node.item(j).getNodeName() != "#text") {
		out.println("<lable>"+node.item(j).getNodeName()+": "+node.item(j).getTextContent()+"</label><br />");
	}
}

%>

<button onclick='window.location.href="control?check=add&nextPage=details"'>Add to Cart
</button>
<button onclick='window.location.href="cart.jsp"'>Go to Shopping Cart</button>
<button onclick='window.location.href="welcome.jsp"'>Back to search</button>
</center>
</body>
</html>