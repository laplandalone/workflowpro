<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*,org.jbpm.api.*,org.jbpm.api.task.*" %>
<%
	ProcessEngine processEngine=Configuration.getProcessEngine();
	TaskService taskServace=processEngine.getTaskService();
	
	String taskId=request.getParameter("taskId");
	String result=request.getParameter("result");
	result=new String(result.getBytes("ISO-8859-1"),"UTF-8");
	
	//Map map=new HashMap();
	//taskServace.setVariables(taskId, map);
	taskServace.completeTask(taskId,result);
	
	response.sendRedirect("index.jsp");
%>