package com.wanganning.cms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wanganning.cms.dao.ArticleMapper;
import com.wanganning.cms.entity.Article;
import com.wanganning.cms.service.ArticleService;
@Service
public class ArticleServiceImpl implements ArticleService{
	@Autowired
	private ArticleMapper mapper;

	@Override
	public PageInfo<Article> selects(Article article, Integer page, Integer pageSize) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, pageSize);
		List<Article> selects = mapper.selects(article);
		return new PageInfo<Article>(selects);
	}

	@Override
	public boolean update(Article article) {
		// TODO Auto-generated method stub
		return mapper.update(article)>0;
	}

	@Override
	public Article select(Integer id) {
		// TODO Auto-generated method stub
		return mapper.select(id);
	}

	@Override
	public boolean insert(Article article) {
		// TODO Auto-generated method stub
		return mapper.insert(article)>0;
	}
	
}
