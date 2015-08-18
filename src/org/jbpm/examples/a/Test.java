package org.jbpm.examples.a;

import org.jbpm.test.JbpmTestCase;

public class Test extends JbpmTestCase 
{
	  String deploymentId;
	  
	  protected void setUp() throws Exception {
	    super.setUp();
	    
	    deploymentId = repositoryService.createDeployment()
	        .addResourceFromClasspath("org/jbpm/examples/a/process.jpdl.xml")
	        .deploy();
	  }
	
	  protected void tearDown() throws Exception 
	  {
//		    repositoryService.deleteDeploymentCascade(deploymentId);
		    
//		    super.tearDown();
		  }
	  
	  public void testTest()
	  {
		  executionService.startProcessInstanceByKey("ICL-2");
	  }
	
}
