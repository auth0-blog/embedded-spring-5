package com.auth0.samples;

import org.apache.catalina.Context;
import org.apache.catalina.startup.Tomcat;
import org.springframework.web.context.support.GenericWebApplicationContext;

import java.io.File;
import java.io.IOException;

public class Main {
	private static final int PORT = getPort();

	public static void main(String[] args) throws Exception {
		String appBase = ".";
		Tomcat tomcat = new Tomcat();
		tomcat.setBaseDir(createTempDir());
		tomcat.setPort(PORT);
		tomcat.getHost().setAppBase(appBase);
		Context ctx = tomcat.addWebapp("", ".");
		tomcat.start();
		tomcat.getServer().await();

		new GenericWebApplicationContext(ctx.getServletContext());
	}

	private static int getPort() {
		String port = System.getenv("PORT");
		if (port != null) {
			return Integer.valueOf(port);
		}
		return 8080;
	}

	// based on AbstractEmbeddedServletContainerFactory
	private static String createTempDir() {
		try {
			File tempDir = File.createTempFile("tomcat.", "." + PORT);
			tempDir.delete();
			tempDir.mkdir();
			tempDir.deleteOnExit();
			return tempDir.getAbsolutePath();
		} catch (IOException ex) {
			throw new RuntimeException(
					"Unable to create tempDir. java.io.tmpdir is set to " + System.getProperty("java.io.tmpdir"),
					ex
			);
		}
	}
}
