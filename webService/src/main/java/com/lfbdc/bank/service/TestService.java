package com.lfbdc.bank.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lfbdc.bank.model.DysJ;

public interface TestService {
	
	List<DysJ> selectByDy(@Param("bdczh")String bdczh,@Param("page")int page, @Param("rows")int rows);

}
