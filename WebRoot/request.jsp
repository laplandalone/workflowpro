<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>填写申请单</title>
</head>
<body>
<fieldset>
	<legend>申请</legend>
	<form action="submit.jsp" method="post">
	<input type="hidden" name="taskId" value="${param.id }"/>
	申请人：<input type="text" name="owner" value="${sessionScope['username'] }"><br/>
	请假时间：<input type="text" name="day" value=""/><br/>
	请假原因：<input type="text" name="reason" value=""/><br/>
	<input type="submit" value="提交"> 
	</form>
</fieldset>
</body>
</html>