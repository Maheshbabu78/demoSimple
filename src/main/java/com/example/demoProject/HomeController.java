package com.example.demoProject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
public class HomeController {
	
	@GetMapping("/hello")
	public String getHomePage() {
		return "Hello world from spring boot";
	}

}
