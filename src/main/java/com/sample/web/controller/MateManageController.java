package com.sample.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sample.dto.JsonHallSeat;
import com.sample.dto.JsonPerformance;
import com.sample.dto.MateList;
import com.sample.dto.PerformanceDetailDto;
import com.sample.dto.PerformanceDto;
import com.sample.service.MateManagerService;
import com.sample.service.MateService;
import com.sample.service.PerformanceService;
import com.sample.web.form.MateForm;
import com.sample.web.view.Mate;
import com.sample.web.view.Pagination;
import com.sample.web.view.Performance;

@Controller
@RequestMapping("/manager")
public class MateManageController {

	@Autowired
	PerformanceService performanceService;
	
	@Autowired
	MateManagerService mateManagerService;
	
	@Autowired
	MateService mateService;
	
	@GetMapping("/mateManager.do")
	public String MateManager() {
		
		
		
		
		return "mate/mateManager";
	}
	@RequestMapping("/mateManagerJson.do")
	public @ResponseBody Map<String, Object> MateManagerAjax() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<PerformanceDetailDto> performanceList = performanceService.getAllPerformances();
		List<Map<Integer, String>> categories = mateService.getMateAllCategory();
		map.put("performanceList", performanceList);
		map.put("categories", categories);
		return map;
	}
	@RequestMapping("/addMate.do")
	public @ResponseBody void addMate(@RequestBody MateForm mateForm) {
		mateManagerService.addMate(mateForm);
		
	}
	@RequestMapping("/addCat.do")
	public @ResponseBody void addMateCat(@RequestParam("id") int id,
										@RequestParam("category") String category) {
		
		mateManagerService.addMateCat(id, category);
	}
	@RequestMapping("/countMate.do")
	public @ResponseBody int countMate(@RequestBody MateForm mateForm) {
		
		return mateManagerService.countMate(mateForm.getSeats());
	}
	@RequestMapping("/mateManagementJson.do")
	public @ResponseBody Map<String, Object> mateManagementList(@RequestParam(value="pageNo", defaultValue="1") int pageNo) {
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> queryMap = new HashMap<>();
		int totalRows = mateService.getAllMateTotalRows();

		
		//pagination
		int rowsPerPage = 2;
		int pagesPerBlock = 5;
		Pagination pagination = new Pagination(rowsPerPage, pagesPerBlock, pageNo, totalRows);
		int beginIndex = pagination.getBeginIndex() - 1;
		int endIndex = 2;
		queryMap.put("beginIndex", beginIndex);
		queryMap.put("endIndex", endIndex);
		
		List<MateList> list = mateService.getAllMateListForManagement(queryMap);
		
		map.put("pagination", pagination);
		map.put("mateList", list);
		return map;
	}
	@RequestMapping("/mateList.do")
	public String mateManagerList() {
		return "mate/mateManagerList";
	}
	@RequestMapping("/mateManagementDetail.do")
	public @ResponseBody Map<String, Object> mateManagementDetail(){
		Map<String, Object> map = new HashMap<>();
		
		
		Map<String, Object> param = new HashMap<>();
		param.put("performanceId", 130);
		List<MateList> list = mateService.getAllMateDetailForManagement(param);

		
		map.put("list", list);
		return map;
	}
}
