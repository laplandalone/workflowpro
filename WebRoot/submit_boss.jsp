<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*,org.jbpm.api.*,org.jbpm.api.task.*" %>
<%
	ProcessEngine processEngine=Configuration.getProcessEngine();
	TaskService taskServace=processEngine.getTaskService();
	
	String taskId=request.getParameter("taskId");
	taskServace.completeTask(taskId,"结束");
	
	response.sendRedirect("index.jsp");
%>