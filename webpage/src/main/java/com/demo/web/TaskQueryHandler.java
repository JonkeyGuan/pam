package com.demo.web;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.Date;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpResponseException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.util.EntityUtils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

public class TaskQueryHandler implements ResponseHandler<TaskSummary> {

    @Override
    public TaskSummary handleResponse(HttpResponse response) throws ClientProtocolException, IOException {
	StatusLine statusLine = response.getStatusLine();
	HttpEntity entity = response.getEntity();
	if (statusLine.getStatusCode() >= 300) {
	    throw new HttpResponseException(statusLine.getStatusCode(), statusLine.getReasonPhrase());
	}
	if (entity == null) {
	    throw new ClientProtocolException("Response contains no content");
	}

	System.out.println(response.getStatusLine());
	byte[] content = EntityUtils.toByteArray(entity);

	String tmp = new String(content);
	tmp = tmp.replace("-", "_").replace(".", "");
	System.out.println(tmp);

	GsonBuilder gsonBuilder = new GsonBuilder();
	gsonBuilder.registerTypeAdapter(Date.class, new JsonDeserializer<Date>() {
	    @Override
	    public Date deserialize(JsonElement json, java.lang.reflect.Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
		return new Date(json.getAsLong());
	    }
	});
	Gson gson = gsonBuilder.setPrettyPrinting().create();
	Reader reader = new InputStreamReader(new ByteArrayInputStream(tmp.getBytes()));

	return gson.fromJson(reader, TaskSummary.class);
    }

}
