package com.demo.web;

import java.io.IOException;
import java.nio.charset.Charset;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.HttpHeaders;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;

public class HttpAdapter {

	private HttpClient httpClient;
	private String authHeader;

	public void initialize(String user, String password) {

		httpClient = HttpClients.createDefault();

		String auth = user + ":" + password;
		byte[] encodedAuth = Base64.encodeBase64(auth.getBytes(Charset.forName("US-ASCII")));
		authHeader = "Basic " + new String(encodedAuth);
	}

	@Override
	protected void finalize() throws Throwable {
		super.finalize();
	}

	public <T> T get(String url, ResponseHandler<T> handler) throws ClientProtocolException, IOException {
		T result = null;

		HttpGet httpGet = new HttpGet(url);
		httpGet.setHeader(HttpHeaders.AUTHORIZATION, authHeader);
		httpGet.addHeader("content-type", "application/json");
		httpGet.addHeader("Accept", "application/json");

		System.out.println("Executing request " + httpGet.getRequestLine());

		result = httpClient.execute(httpGet, handler);

		return result;
	}

	public <T> T post(String url, ResponseHandler<T> handler) throws ClientProtocolException, IOException {
		return post(url, null, handler);
	}

	public <T> T post(String url, String content, ResponseHandler<T> handler) throws ClientProtocolException, IOException {
		T result = null;

		HttpPost httpPost = new HttpPost(url);
		httpPost.setHeader(HttpHeaders.AUTHORIZATION, authHeader);
		httpPost.addHeader("content-type", "application/json");
		httpPost.addHeader("Accept", "application/json");
		if (content != null && !content.isEmpty()) {
			StringEntity params = new StringEntity(content);
			httpPost.setEntity(params);
		}

		System.out.println("Executing request " + httpPost.getRequestLine());

		result = httpClient.execute(httpPost, handler);

		return result;
	}

	public <T> T put(String url, ResponseHandler<T> handler) throws ClientProtocolException, IOException {
		return put(url, null, handler);
	}

	public <T> T put(String url, String content, ResponseHandler<T> handler) throws ClientProtocolException, IOException {
		T result = null;

		HttpPut httpPut = new HttpPut(url);
		httpPut.setHeader(HttpHeaders.AUTHORIZATION, authHeader);
		httpPut.addHeader("content-type", "application/json");
		httpPut.addHeader("Accept", "application/json");
		if (content != null && !content.isEmpty()) {
			StringEntity params = new StringEntity(content);
			httpPut.setEntity(params);
		}

		System.out.println("Executing request " + httpPut.getRequestLine());

		result = httpClient.execute(httpPut, handler);

		return result;
	}

}
