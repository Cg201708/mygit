package com.lfbdc.bank.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.github.pagehelper.PageInfo;
import com.lfbdc.bank.model.DysJ;
import com.lfbdc.bank.service.TestService;

@Controller
public class DySController {
	
	@Autowired
	private TestService testService;
	
	private String page_list = "dysj";
	
	@RequestMapping(value="/list")
	public ModelAndView getAllCount(DysJ dysJ,
			@RequestParam(required = false, defaultValue = "1") int page,
            @RequestParam(required = false, defaultValue = "10") int rows){
		
		ModelAndView result = new ModelAndView(page_list);
		List<DysJ> recordlist = testService.selectByDy(dysJ.getBdczh(), page, rows);
		for(DysJ dysj:recordlist){
			System.out.println(dysj.getBdczh());
		}
		result.addObject("pageInfo", new PageInfo<DysJ>(recordlist));
        result.addObject("page", page);
        result.addObject("rows", rows);
        result.addObject("queryParam", dysJ);
        return result;
	}

}
