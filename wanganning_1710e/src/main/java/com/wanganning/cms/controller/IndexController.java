package com.wanganning.cms.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.github.pagehelper.PageInfo;
import com.wanganning.cms.entity.Article;
import com.wanganning.cms.entity.Category;
import com.wanganning.cms.entity.Channel;
import com.wanganning.cms.entity.Slide;
import com.wanganning.cms.service.ArticleService;
import com.wanganning.cms.service.ChannelService;
import com.wanganning.cms.service.SlideService;
import com.wanganning.util.DateUtil;

@Controller
public class IndexController {
	@Autowired
	private ChannelService channelService;
	@Autowired
	private SlideService slideService;
	@Autowired
	private ArticleService articleService;
	
	
	@RequestMapping(value = {"","/","index"})
	public String index(Model model,Article article,@RequestParam(defaultValue = "1")Integer page,
			@RequestParam(defaultValue = "5")Integer pageSize) {
		article.setStatus(1);//查询审核过的文章
		article.setDeleted(0);//未删除
		//查询出所有的栏目
		List<Channel> channels = channelService.selects();
		model.addAttribute("channels", channels);
		
		
		if(article.getChannelId()!=null) {//如果栏目不为空空则显示栏目及分类下文章
		//根据栏目查询其下所有分类
		List<Category> categorys = channelService.selectsByCid(article.getChannelId());
		model.addAttribute("categorys", categorys);
		model.addAttribute("article", article);
		//根据栏目或分类查询文章
		PageInfo<Article> info = articleService.selects(article, page, pageSize);
		model.addAttribute("pg", info);
		}else {
	       //显示热点文章
			PageInfo<Article> hotInfo = articleService.selects(article, page, pageSize);
			model.addAttribute("pg", hotInfo);
			//查询广告
			List<Slide> slides = slideService.selects();
			model.addAttribute("slides",slides);
		}
		//查询出最新的5篇文章
		
		Article lastArticle = new Article();
		lastArticle.setStatus(1);//只能查询最新的并且审过的文章
		lastArticle.setDeleted(0);//未删除
		PageInfo<Article> lastInfo = articleService.selects(null, 1, 3);
		model.addAttribute("lastInfo", lastInfo);
		
		//24热文

		Article hot24Article = new Article();
		hot24Article.setStatus(1);//审核过的文章
		hot24Article .setHot (1);//热点文童
		hot24Article.setCreated(DateUtil.getDateByBefore(new Date())); //diaoyong
		PageInfo<Article> hot24ArticleInfo=articleService.selects(hot24Article, 1, 2);
		model.addAttribute("hot24ArticleInfo", hot24ArticleInfo);
		return "index/index";//返回首页	
		
	}
	
	
	
	//文章详情
	@RequestMapping("articleDetail")
	public String articleDetail(Model model ,Integer id) {
		
		Article article = articleService.select(id);
		model.addAttribute("article", article);
		return "index/article";
	}
	
	
	

	
	
	
	
	
	
}
