package com.wanganning.cms.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanganning.cms.util.CMSException;
import com.wanganning.cms.util.Md5Util;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wanganning.cms.dao.UserMapper;
import com.wanganning.cms.entity.User;
import com.wanganning.cms.service.UserService;
import com.wanganning.util.StringUtil;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper mapper;

	@Override
	public PageInfo<User> ulist(User user, Integer page, Integer pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, pageSize);
		List<User> ulist = mapper.ulist(user);
		return new PageInfo<User>(ulist);
	}

	@Override
	public boolean update(User user) {
		// TODO Auto-generated method stub
		return mapper.update(user)>0;
	}

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		//后台校验
		  if(!StringUtil.hasText(user.getUsername()))
			  throw new CMSException("用户名不能为空");
		  if(!StringUtil.hasText(user.getPassword()))
			  throw new CMSException("密码不能为空");
		  //根据用户名查询user
		  User u = mapper.selectByName(user.getUsername());
		  if(null==u)
			  throw new CMSException("用户名不存在");
		  //比较密码
		  //对输入的密码进行加密和数据库的密码进比较
		  if(!u.getPassword().equals(Md5Util.md5Encoding(user.getPassword())))
			  throw new CMSException("密码错误");
		  //账户被停用
		  if(u.getLocked()==1)
			  throw new CMSException("账户被停用");
		
		return u;
	}

	@Override
	public User selectByName(String name) {
		// TODO Auto-generated method stub
		return mapper.selectByName(name);
	}

	@Override
	public boolean insert(User user) {
		// TODO Auto-generated method stub
		//注册数据的校验
		  if(!StringUtil.hasText(user.getUsername()))
			  throw new CMSException("用户名不能为空");
			  
		  if(!(user.getUsername().length()>=2 && user.getUsername().length()<=5))
			  throw new CMSException("用户名长度应该在2-5之间");  
		  
		 // if(null!=userMapper.selectByName(user.getUsername()))
		//	  throw new CMSException("用户已经被注册");  
			
		  if(!StringUtil.hasText(user.getPassword()))
			  throw new CMSException("密码不能为空");	
		  if(!StringUtil.hasText(user.getRepassword()))
			  throw new CMSException("重复密码不能为空");	
		  if(!(user.getPassword().length()>=6 && user.getPassword().length()<=10))
			  throw new CMSException("用户名长度应该在6-10之间");  
			
		  if(!(user.getPassword().equals(user.getRepassword())))
			  throw new CMSException("两次密码不一致");  
		  //对密码进行加密处理
		   user.setPassword(Md5Util.md5Encoding(user.getPassword()));
		   
		   //补全用户的属性信息
		   user.setCreated(new Date());//创建时间
		   user.setNickname(user.getUsername());
		   user.setUpdated(new Date());//修改时间
			
		  //以上条件都满足则执行注册
			return mapper.insert(user)>0;
	}
	
	
}
