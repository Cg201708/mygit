package com.lfbdc.bank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections.map.HashedMap;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lfbdc.bank.model.DysJ;
import com.lfbdc.bank.model.Page;
import com.lfbdc.bank.model.SeeRecord;
import com.lfbdc.bank.service.DysJService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/dysJ")
public class DysJController {
	
	 @Autowired
	 private DysJService dysJService;
	 
	 private static Logger logger = LogManager.getLogger(DysJController.class);
	 
	 @RequestMapping(value="/queryAll", method = RequestMethod.POST)
	 public String record(String bdczh , Model model, String pageNow)
	 				throws Exception{
		 System.out.println(bdczh+pageNow);
		 Page page = null;
		 int totalCount = dysJService.getCount(bdczh);
		 if(pageNow != null && pageNow != "") {//防止出现空指针异常
	            int pageNow1 = Integer.parseInt(pageNow);
	            page = new Page(totalCount, pageNow1);//这样写的好处，判断完成外面可以继续调用
	     }
		 Map<String,Object> map = new HashMap<String,Object>();
		 map.put("bdczh", bdczh);
		 map.put("page", page);
		 List<DysJ> recordList = dysJService.selectByRecord(map);
		 System.out.println(totalCount);
		 System.out.println(recordList);
		 model.addAttribute("page",page);
	     model.addAttribute("recordList",recordList);
	     //JSONArray jsonArray = new JSONArray();
	     return "test";
	 }
}
