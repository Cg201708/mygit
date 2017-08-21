package com.lfbdc.bank.dao;

import java.util.List;
import java.util.Map;
import com.lfbdc.bank.model.DysJ;

public interface DysJMapper {
	
	List<DysJ> selectByRecord(Map<String,Object> map);
	
	int getCount(String bdczh);
	

}
