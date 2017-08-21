package com.lfbdc.bank.service.Impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.lfbdc.bank.dao.TestDao;
import com.lfbdc.bank.model.DysJ;
import com.lfbdc.bank.service.TestService;

@Service("testService")
public class TestServiceImpl implements TestService{
	
	@Autowired
	private TestDao testDao;

	@Override
	public List<DysJ> selectByDy(@Param("bdczh")String bdczh,@Param("page")int page, @Param("rows")int rows){
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		return testDao.selectByDy(bdczh, page, rows);
	}

}
