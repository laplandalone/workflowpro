<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*,org.jbpm.api.*,org.jbpm.api.task.*" %>
<%@ include file="/checklogin.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBPM请假流程</title>
</head>
<body>
<a href="index.jsp?action=deploy">发布流程</a>|<a href="login.jsp">登陆</a><br/>
<% 
	/**
	*流程引擎采用单例模式实现，每次调用的都是一个流程引擎，提高程序效率
	*/
	ProcessEngine processEngine=Configuration.getProcessEngine(); 

	/**
	*发布服务：
	*1、流程发布
	*2、管理流程、删除流程、查看流程
	*/
	RepositoryService repositoryService = processEngine.getRepositoryService();
	
	/**
	*执行服务
	*1、获取流程实例
	*/
	ExecutionService executionService=processEngine.getExecutionService();

	/**
	*任务服务
	*/
	TaskService taskService=processEngine.getTaskService();
	
	String action=request.getParameter("action");
	if("deploy".equals(action))
	{
		repositoryService.createDeployment().addResourceFromClasspath("leave.jpdl.xml").deploy();
	}
	else if("remove".equals(action))
	{
		repositoryService.deleteDeploymentCascade(request.getParameter("id"));
	}
	
	/**
	*获取流程定义列表，可以看到本工程都发布了哪些流程
	*/
	List<ProcessDefinition> processDefitionList=repositoryService.createProcessDefinitionQuery().list();
	
	/**
	*获取流程实例列表，可以查看本工程中启动了哪些流程实例
	*/
	List<ProcessInstance> piList=executionService.createProcessInstanceQuery().list();
	
	/**
	*获取任务列表,可以查看某人所有代表任务
	*/
	String username1=(String)session.getAttribute("username");
	List<Task> taskList=taskService.findPersonalTasks(username1);
%>
<table border=1 width="100%">
	<caption>流程定义</caption>
	<thead>
		<tr>
			<th>id</th>
			<th>name</th>
			<th>version</th>
			<th>option</th>
		</tr>
	</thead>
	<tbody>
<%
	/**
	*循环输入发布的流程定义
	*/
	for(ProcessDefinition pd : processDefitionList){
%>
		<tr>
			<td><%=pd.getId() %></td>
			<td><%=pd.getName() %></td>
			<td><%=pd.getVersion() %></td>
			<td>
			<a href="index.jsp?action=remove&id=<%=pd.getDeploymentId() %>">remove</a>|
			<a href="start.jsp?id=<%=pd.getId() %>">start</a>
			</td>
		</tr>
<%} %>
	</tbody>
</table>
<br/>
<table border="1" width="100%">
	<caption>流程实例</caption>
	<thead>
		<tr>
			<th>id</th>
			<th>action</th>
			<th>state</th>
			<th>option</th>
		</tr>
	</thead>
	<tbody>
<%
	/**
	*循环输入流程实例
	*/
	for(ProcessInstance pi : piList)
	{
%>
		<tr>
			<td><%=pi.getId() %></td>
			<td><%=pi.findActiveActivityNames() %></td>
			<td><%=pi.getState() %></td>
			<td>
				<a href="view.jsp?id=<%=pi.getId() %>">view</a>
			</td>
		</tr>
<%} %>
	</tbody>
</table>
<br/>
<table border="1" width="100%">
	<caption>代办任务</caption>
	<thead>
		<tr>
			<th>id</th>
			<th>action</th>
			<th>option</th>
		</tr>
	</thead>
	<tbody>
<%
	/**
	*循环输出代办任务列表
	*/
	for(Task task :taskList)
	{
%>
		<tr>
			<td><%=task.getId() %></td>
			<td><%=task.getActivityName() %></td>
			<td><a href="<%=task.getFormResourceName() %>?id=<%=task.getId() %>">view</a></td>
		</tr>
<%} %>
	</tbody>
</table>
</body>
</html>