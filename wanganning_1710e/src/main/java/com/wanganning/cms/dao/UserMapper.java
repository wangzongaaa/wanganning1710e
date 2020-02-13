package com.wanganning.cms.dao;
/**
 * 
 * @ClassName: UserMapper 
 * @Description: TODO
 * @author: 王圣瑄
 * @date: 2020年1月8日 上午8:59:37
 */

import java.util.List;

import com.wanganning.cms.entity.User;

public interface UserMapper {
		//用户列表
	List<User> ulist(User user);
	
	//更新用户
	int update(User user);

	User selectByName(String name);
	
	int insert(User user);
	
	
	
	
}
