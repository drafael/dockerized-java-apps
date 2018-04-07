package com.example.template.modern;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
public class ModernApplication {

	public static void main(String[] args) {
		SpringApplication.run(ModernApplication.class, args);
	}

	@Controller
	@RequestMapping("/")
	public class HomePageController {

		@GetMapping
		public String index() {
			return "index";
		}

	}
}
