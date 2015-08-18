<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*,org.jbpm.api.*,org.jbpm.api.task.*" %>
<%
	ProcessEngine processEngine=Configuration.getProcessEngine();
	TaskService taskServace=processEngine.getTaskService();
	
	String taskId=request.getParameter("taskId");
	String owner=request.getParameter("owner");
	int day =Integer.parseInt(request.getParameter("day"));
	String reason=request.getParameter("reason");
	
	Map map=new HashMap();
	map.put("day", day);
	map.put("reason", reason);
	taskServace.setVariables(taskId, map);
	taskServace.completeTask(taskId);
	
	response.sendRedirect("index.jsp");
%>