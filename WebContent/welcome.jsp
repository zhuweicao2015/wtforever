<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
    <jsp:useBean id="journey" class="edu.unsw.comp9321.JourneyBean" scope="session" />
    <jsp:useBean id="journey1" class="edu.unsw.comp9321.JourneyBean" scope="session" />
	<jsp:useBean id="cart" class="edu.unsw.comp9321.JourneyBean" scope="session" />
	<jsp:useBean id="detail" class="edu.unsw.comp9321.JourneyBean" scope="session" />
    <%

	XPathFactory fac=XPathFactory.newInstance();
	XPath nav=fac.newXPath();
	//JourneyBean journe = (JourneyBean) request.getSession().getAttribute("journey");
	Vector<String> places=new Vector<String>();
    try{
	 	
		DOMParser parser=new DOMParser();
		ServletContext context = getServletContext();
		InputSource xmlFile = new InputSource(context.getResourceAsStream("/WEB-INF/dblp.xml"));
		parser.parse(xmlFile);
		Document doc = parser.getDocument();
		//NodeList nodelist=doc.getElementsByTagName("title");
		//String s ="Total number :"+ nodelist.getLength();
		//Element root = doc.getDocumentElement();
		//doc.getFirstChild()
		XPathExpression xp;
		xp=nav.compile("//title");
		NodeList nodes = (NodeList) xp.evaluate(doc, XPathConstants.NODESET);
		for (int i = 0;i<=10;i++) {
			Random r= new Random();
			int x=Math.abs(r.nextInt())%20000+1;
				places.add(nodes.item(x).getTextContent());
				//journey.setPlaces(places);
			//String v = node.getNodeValue();
			//places.add(v);
		}
		//System.out.println("This file contains "+nodelist.getLength()+" <article> elements!");
		journey.setPlaces(places);
	}
	catch (Exception e){
		e.printStackTrace(System.err);
	} %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome!</title>
</head>
<body onload="document.all.action.select()">
<%@ include file="head.html"%><center><%@ include file="bottom.html"%></center>
<center>

<form action='control' method='POST'>
<input type="text" name="action">
    <input type='submit' value='Search' name="nextPage">
    <input type="hidden" value='1' name="pnum">
    <input type="submit" value="Advanced" name="nextPage">
</form>
</center>
<p>
<c:forEach var="place" items="${journey.places}">
<table>
<tr><td>
<c:out value="${place}" />
</td></tr>
</table>
</c:forEach>
</p>
</body>
</html>