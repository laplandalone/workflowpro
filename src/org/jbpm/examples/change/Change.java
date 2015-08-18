package org.jbpm.examples.change;

import org.jbpm.api.Configuration;
import org.jbpm.api.ExecutionService;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.RepositoryService;
import org.jbpm.api.TaskService;

public class Change {

	  String deploymentId;
	 
	 
	 public static void main(String[] args) {
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
			
			repositoryService.createDeployment().addResourceFromClasspath("org/jbpm/examples/change/leave.jpdl.xml").deploy();
			
			/**
			*执行服务
			*1、获取流程实例
			*/
			ExecutionService executionService=processEngine.getExecutionService();

			/**
			*任务服务
			*/
			TaskService taskService=processEngine.getTaskService();
	}
}
