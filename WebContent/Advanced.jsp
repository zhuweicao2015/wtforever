<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Advanced Search</title>
</head>
<body onload="document.all.action.select()">
<%@ include file="head.html"%>

<center>
<form action='control' method='POST'>
<input type="text" name="action">
<input type="hidden" value="1" name="pnum">
<select name="advanced">
<OPTION value="title">publications</OPTION>
<OPTION value="author">authors</OPTION>
<OPTION value="dblp">publication-type</OPTION>
<OPTION value="year">publication-date</OPTION>
<OPTION value="editor">editor</OPTION>
</select>
<input type="submit" value="Search" name="nextPage">
</form>
</center>
</body>
</html>