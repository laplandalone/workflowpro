<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,org.jbpm.api.*" %>
<%

	/**
	*根据流程定义部署ID启动一个流程定义
	*/
	ProcessEngine processEngine=Configuration.getProcessEngine();
	ExecutionService executionService=processEngine.getExecutionService();
	Map map=new HashMap();
	map.put("owner", session.getAttribute("username"));
	System.out.print(request.getParameter("id"));
	executionService.startProcessInstanceById(request.getParameter("id"),map);
	
	response.sendRedirect("index.jsp");
%>