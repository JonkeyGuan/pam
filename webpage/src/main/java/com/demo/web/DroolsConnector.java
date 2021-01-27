package com.demo.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.http.client.ClientProtocolException;
import org.drools.core.ClassObjectSerializationFilter;
import org.kie.api.KieServices;
import org.kie.api.command.Command;
import org.kie.api.command.KieCommands;
import org.kie.api.runtime.ExecutionResults;
import org.kie.server.api.marshalling.MarshallingFormat;
import org.kie.server.api.model.KieServiceResponse.ResponseType;
import org.kie.server.api.model.ServiceResponse;
import org.kie.server.client.KieServicesClient;
import org.kie.server.client.KieServicesConfiguration;
import org.kie.server.client.KieServicesFactory;
import org.kie.server.client.RuleServicesClient;

import com.demo.fibonacci.Fib;

public class DroolsConnector {

    private static DroolsConnector instance;

    private static final String droolsUrl = "http://localhost:8180/kie-server/services/rest/server";
    private static final String username = "bpmsadmin";
    private static final String password = "123";

    private static final MarshallingFormat FORMAT = MarshallingFormat.JSON;

    private static KieServicesConfiguration conf;
    private static KieServicesClient kieServicesClient;

    private static KieServices kieServices;

    public static synchronized DroolsConnector getInstance() {
	if (instance == null) {
	    instance = new DroolsConnector();
	    instance.initialize();
	}
	return instance;
    }

    public void initialize() {
	conf = KieServicesFactory.newRestConfiguration(droolsUrl, username, password);
	conf.setMarshallingFormat(FORMAT);
	Set<Class<?>> allClasses = new HashSet<Class<?>>();
	allClasses.add(Fib.class);
	conf.addExtraClasses(allClasses);
	kieServicesClient = KieServicesFactory.newKieServicesClient(conf);
	kieServices = KieServices.Factory.get();
    }

    
    public List<Fib> executeFibCmd(int sequence) {
	List<Fib> result = new ArrayList<>();
	System.out.println("Initialising the container services");

	System.out.println("Fire Rules....");

	RuleServicesClient rulesClient = kieServicesClient.getServicesClient(RuleServicesClient.class);
	ClassObjectSerializationFilter filter = new ClassObjectSerializationFilter(Fib.class);

	KieCommands commandsFactory = kieServices.getCommands();

	Fib fib = new Fib(sequence);

	Command<?> insert = commandsFactory.newInsert(fib);
	Command<?> fireAllRules = commandsFactory.newFireAllRules();
	Command<?> getObjects = commandsFactory.newGetObjects(filter, "fibs");
	Command<?> dispose = commandsFactory.newDispose();

	Command<?> batchCommand = commandsFactory.newBatchExecution(Arrays.asList(insert, fireAllRules, getObjects, dispose));

	ServiceResponse<ExecutionResults> executeResponse = rulesClient.executeCommandsWithResults("fibonacci", batchCommand);

	if (executeResponse.getType() == ResponseType.SUCCESS) {
	    System.out.println("Commands executed with success! Response: ");
	    System.out.println(executeResponse.getResult().getValue("fibs").toString());
	    @SuppressWarnings("unchecked")
	    List<Fib> fibList = (List<Fib>) executeResponse.getResult().getValue("fibs");
	    Collections.sort(fibList, fibComparator);
	    for (int i = 0; i < fibList.size(); i++) {
		System.out.println(fibList.get(i).getSequence() + " == " + fibList.get(i).getValue());
	    }
	    result = fibList;
	} else {
	    System.out.println("Error executing rules. Message: ");
	    System.out.println(executeResponse.getMsg());
	}
	return result;
    }
    
    public static Comparator<Fib> fibComparator = new Comparator<Fib>() {

	@Override
	public int compare(Fib f1, Fib f2) {
	    int fib1 = f1.getSequence();
	    int fib2 = f2.getSequence();
	    return fib1 - fib2;
	}

    };

    public static void main(String[] args) throws ClientProtocolException, IOException {
	DroolsConnector drools = DroolsConnector.getInstance();
	drools.executeFibCmd(50);
    }

}
