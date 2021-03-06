/*
 * JBoss, Home of Professional Open Source
 * Copyright 2005, JBoss Inc., and individual contributors as indicated
 * by the @authors tag. See the copyright.txt in the distribution for a
 * full listing of individual contributors.
 *
 * This is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation; either version 2.1 of
 * the License, or (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this software; if not, write to the Free
 * Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
 * 02110-1301 USA, or see the FSF site: http://www.fsf.org.
 */
package org.jbpm.examples.bpmn.task.script;

import java.util.HashMap;
import java.util.Map;

import org.jbpm.api.NewDeployment;
import org.jbpm.api.ProcessInstance;
import org.jbpm.test.JbpmTestCase;

/**
 * @author Tom Baeyens
 * @author Ronald van Kuijk (kukeltje)
 * @author Joram Barrez
 */
public class ScriptTaskTest extends JbpmTestCase {

	@Override
	protected void setUp() throws Exception {
		super.setUp();
		NewDeployment deployment = repositoryService.createDeployment();
		deployment.addResourceFromClasspath("org/jbpm/examples/bpmn/task/script/script_task.bpmn.xml");
		registerDeployment(deployment.deploy());
	}

	public void testProcessExecution() {

		Map<String, Object> variables = new HashMap<String, Object>();
		Integer[] values = { 11, 23, 56, 980, 67543, 8762524 };
		variables.put("input", values);

		ProcessInstance pi = executionService.startProcessInstanceByKey("ScriptTask", variables);

		assertProcessInstanceEnded(pi);
	}
}
