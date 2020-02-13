package com.wanganning.cms.service.impl;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.github.pagehelper.PageInfo;
import com.wanganning.cms.entity.User;
import com.wanganning.cms.service.UserService;




@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-beans.xml")
public class UserServiceImplTest {
	@Autowired
	UserService userService;

	@Test
	public void testSelects() {
		PageInfo<User> info = userService.ulist(null, 1, 10);
		System.out.println(info);
	}

}
