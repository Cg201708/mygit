package com.lfbdc.bank.service;

import java.util.List;
import java.util.Map;

import com.lfbdc.bank.model.DysJ;

public interface DysJService {
	
	List<DysJ> selectByRecord(Map<String,Object> map);
	
	int getCount(String bdczh);
	

}
