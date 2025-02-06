package com.karateTestcases;
import org.junit.runner.RunWith;
import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit4.Karate;

@RunWith(Karate.class)
@KarateOptions(tags = "@todays")
public class TestRunner {

}







/*
@RunWith(Karate.class): This tells JUnit to use Karate's test runner for executing the feature files.
TestRunner class: This class doesn't need any specific method. Karate will automatically 
look for feature files in the classpath and execute them.

*/