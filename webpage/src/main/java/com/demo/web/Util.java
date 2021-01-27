package com.demo.web;

import javax.servlet.http.HttpServletRequest;

public class Util {

	public static String getProcessDefUrl(HttpServletRequest request, String container, String process) {
		String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
		String url = base + "/kie-server/services/rest/server/containers/" + container + "/images/processes/" + process;
		return url;
	}

	public static String getProcessStatusUrl(HttpServletRequest request, String container, String processId) {
		String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
		String url = base + "/kie-server/services/rest/server/containers/" + container + "/images/processes/instances/" + processId;
		return url;
	}

	public static String getBasePath(HttpServletRequest request) {
		String base = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort();
		String path = request.getContextPath();
		return base + path;
	}
}
