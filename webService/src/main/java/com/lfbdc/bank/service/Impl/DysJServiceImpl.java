package com.lfbdc.bank.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lfbdc.bank.dao.DysJMapper;
import com.lfbdc.bank.model.DysJ;
import com.lfbdc.bank.service.DysJService;

@Service("dysJService")
public class DysJServiceImpl implements DysJService{
	
	@Autowired
	private DysJMapper dysJMapper;

	@Override
	public List<DysJ> selectByRecord(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return dysJMapper.selectByRecord(map);
	}

	@Override
	public int getCount(String bdczh) {
		// TODO Auto-generated method stub
		return dysJMapper.getCount(bdczh);
	}


}
