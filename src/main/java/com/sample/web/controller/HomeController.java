package com.sample.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.sample.dto.PerformanceDto;
import com.sample.service.PerformanceService;

@Controller
public class HomeController {

	@Autowired
	PerformanceService performanceService;
	
	@GetMapping("/home.do")
	public String home(Model model) {
		
		String concert = "콘서트";
		String musical = "뮤지컬";
		String theater = "연극";
		
		List<PerformanceDto> concerts =  performanceService.getPerformanceByCategoryLimit(concert);
		List<PerformanceDto> musicals =  performanceService.getPerformanceByCategoryLimit(musical);
		List<PerformanceDto> theaters =  performanceService.getPerformanceByCategoryLimit(theater);		
	
		model.addAttribute("concerts", concerts);
		model.addAttribute("musicals", musicals);
		model.addAttribute("theaters", theaters);
		
		return "home";
	}
	
}
