package com.demo.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.client.ClientProtocolException;

import com.google.gson.Gson;

public class BPMConnector {

    private static BPMConnector instance;

    private String bpmUrl = "http://localhost:8180/kie-server/services/rest/server";

    private HttpAdapter adapter;

    public static synchronized BPMConnector getInstance() {
	if (instance == null) {
	    instance = new BPMConnector();
	    instance.initialize();
	}
	return instance;
    }

    public void initialize() {
	adapter = new HttpAdapter();
	adapter.initialize("bpmsadmin", "123");
    }

    public void startProcess(String containerName, String processName) {
	String text;
	try {
	    text = adapter.post(bpmUrl + "/containers/" + containerName + "/processes/" + processName + "/instances", new EmptyOutputHandler());
	    System.out.println(text);
	} catch (IOException e) {
	    e.printStackTrace();
	}
    }

    public Task_summary[] getTaskSummary(String owner) {
	Task_summary[] result = null;
	TaskSummary taskSummary;
	try {
	    taskSummary = adapter.get(bpmUrl + "/queries/tasks/instances/pot-owners?user=" + owner, new TaskQueryHandler());
	    if (taskSummary != null) {
		result = taskSummary.getTask_summary();
	    }
	} catch (IOException e) {
	    e.printStackTrace();
	}
	return result;
    }

    public String pickupTask(String owner, String taskName) {
	String result = "";
	TaskSummary taskSummary;
	try {
	    taskSummary = adapter.get(bpmUrl + "/queries/tasks/instances/pot-owners?user=" + owner, new TaskQueryHandler());
	    if (taskSummary != null) {
		Task_summary[] task_summary = taskSummary.getTask_summary();
		if (task_summary != null) {
		    for (Task_summary summary : task_summary) {
			if (summary.getTask_name().equalsIgnoreCase(taskName)) {
			    result = summary.getTask_id();
			}
		    }
		}
	    }
	} catch (IOException e) {
	    e.printStackTrace();
	}
	return result;
    }

    public void doTask(String containerName, String taskId) {
	doTask(containerName, taskId, null);
    }

    public void doTask(String containerName, String taskId, String parametersText) {
	try {
	    String text = adapter.put(bpmUrl + "/containers/" + containerName + "/tasks/" + taskId + "/states/started", new EmptyOutputHandler());
	    System.out.println(text);

	    Map<String, String> map = null;
	    if (parametersText != null && !parametersText.isEmpty()) {
		String[] array = parametersText.split("\\|");
		if (array != null && array.length > 0) {
		    map = new HashMap<String, String>();
		    for (int i = 0; i < array.length; i++) {
			String keyValueText = array[i];
			String[] keyValue = keyValueText.split("=");
			if (keyValue != null && keyValue.length >= 2) {
			    String key = keyValue[0];
			    String value = keyValue[1];
			    map.put(key, value);
			}
		    }
		}
	    }

	    String parameters = null;
	    if (map != null && map.size() > 0) {
		Gson gsonObj = new Gson();
		parameters = gsonObj.toJson(map);
	    }

	    text = adapter.put(bpmUrl + "/containers/" + containerName + "/tasks/" + taskId + "/states/completed", parameters, new EmptyOutputHandler());
	    System.out.println(text);
	} catch (IOException e) {
	    e.printStackTrace();
	}
    }

    public static void main(String[] args) throws ClientProtocolException, IOException {

	BPMConnector bpm = BPMConnector.getInstance();
	String taskId = bpm.pickupTask("bpms", "Query output");
	System.out.println(taskId);

    }

}
