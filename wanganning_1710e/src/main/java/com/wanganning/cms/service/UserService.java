package com.wanganning.cms.service;



import com.github.pagehelper.PageInfo;
import com.wanganning.cms.entity.User;

public interface UserService {
	PageInfo<User> ulist(User user,Integer page,Integer pageSize);
	
	boolean update(User user);
	
	User login(User user);
	
	User selectByName(String name);
	
	boolean insert(User user);
	
	
	
	
}
