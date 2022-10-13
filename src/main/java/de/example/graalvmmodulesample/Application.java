package de.example.graalvmmodulesample;

import java.io.IOException;
import java.io.InputStream;

public class Application {
	private static final String RESOURCE_PATH = "/de/example/graalvmmodulesample/testfile.csv";
	
	public static void main(String[] args) {
		Module module = Application.class.getModule();
		
		System.out.println("My current module is " + module.getName());
		
		try(InputStream resourceStream = module.getResourceAsStream(RESOURCE_PATH)) {
			if(resourceStream == null) {
				System.out.println("Resource not found at path '" + RESOURCE_PATH + "' in module '" + module.getName() + "'");
			}
			else {
				System.out.println("Found resource with " + resourceStream.readAllBytes().length + " bytes via module api");
			}
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		
		try(InputStream resourceStream = Application.class.getResourceAsStream(RESOURCE_PATH)) {
			if(resourceStream == null) {
				System.out.println("Resource not found at '" + RESOURCE_PATH + "' via classpath access");
			}
			else {
				System.out.println("Found resource with " + resourceStream.readAllBytes().length + " bytes via classpath access");
			}
		}
		catch(IOException e) {
			e.printStackTrace();
		}
	}
}