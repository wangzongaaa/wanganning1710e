package com.wanganning.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanganning.cms.dao.SlideMapper;
import com.wanganning.cms.entity.Slide;
import com.wanganning.cms.service.SlideService;
@Service
public class SlideServiceImpl implements SlideService{
	@Autowired
	private SlideMapper mapper;
	@Override
	public List<Slide> selects() {
		// TODO Auto-generated method stub
		return mapper.selects();
	}
	
}
