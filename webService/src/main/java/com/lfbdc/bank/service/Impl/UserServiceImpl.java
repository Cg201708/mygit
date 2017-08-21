package com.lfbdc.bank.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lfbdc.bank.dao.UserMapper;
import com.lfbdc.bank.model.User;
import com.lfbdc.bank.service.UserService;


@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserMapper userMapper;

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return userMapper.login(user);
	}


}
