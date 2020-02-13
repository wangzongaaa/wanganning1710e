package com.wanganning.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanganning.cms.dao.ChannelMapper;
import com.wanganning.cms.entity.Category;
import com.wanganning.cms.entity.Channel;
import com.wanganning.cms.service.ChannelService;
@Service
public class ChannelServiceImpl implements ChannelService{
	@Autowired
	private ChannelMapper mapper;
	@Override
	public List<Channel> selects() {
		// TODO Auto-generated method stub
		return mapper.selects();
	}

	@Override
	public List<Category> selectsByCid(Integer channelId) {
		// TODO Auto-generated method stub
		return mapper.selectsByCid(channelId);
	}

}
