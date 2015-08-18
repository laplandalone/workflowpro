<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,org.jbpm.api.*,org.jbpm.api.task.*" %>
<%@ include file="/checklogin.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>经理审批</title>
</head>
<body>
<%
	ProcessEngine processEngine=Configuration.getProcessEngine();
	TaskService taskService=processEngine.getTaskService();
	String taskId=request.getParameter("id");
	Task task=taskService.getTask(taskId);
%>
<fieldset>
	<legend>经理审批</legend>
	<form action="submit_manager.jsp" method="post">
	<input type="hidden" name="taskId" value="${param.id }">
	申请人：<%=taskService.getVariable(taskId, "owner") %><br/>
	申请时间：<%=taskService.getVariable(taskId, "day") %><br/>
	申请原因：<%=taskService.getVariable(taskId, "reason") %><br/>
	<input type="submit" value="批准" name="result"/>
	<input type="submit" value="驳回" name="result"/>
	</form>
</fieldset>
</body>
</html>