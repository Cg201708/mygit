package com.lfbdc.bank.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lfbdc.bank.model.DysJ;

public interface TestDao {
	
	List<DysJ> selectByDy(@Param("bdczh")String bdczh,@Param("page")int page, @Param("rows")int rows);

}
