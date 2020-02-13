package com.wanganning.cms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.wanganning.cms.entity.Article;
import com.wanganning.cms.entity.User;
import com.wanganning.cms.service.ArticleService;
import com.wanganning.cms.service.UserService;


/**
 * 
 * @ClassName: AdminController 
 * @Description: TODO
 * @author: 王圣瑄
 * @date: 2020年1月10日 下午7:00:31
 */
@RequestMapping("admin")
@Controller
public class AdminController {
	@Autowired
	private UserService userService;
	@Autowired
	private ArticleService articleService;
	//后台首页
	@RequestMapping(value = {"","/","index"})
	public String index() {
		return "admin/index";
	}
	
	
	//用户模块列表
	@RequestMapping("user/users")
	public String user(Model model,User user,@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "5") Integer pageSize) {
		PageInfo<User> ulist = userService.ulist(user, page, pageSize);
		model.addAttribute("pg", ulist);
		model.addAttribute("user", user);
		return "admin/user/users";
		
	}
	//更新用户信息
	@ResponseBody
	@RequestMapping("user/update")
	public boolean Update(User user) {
		return userService.update(user);
	}
	
	//文章列表
	@RequestMapping("article/articles")
	public String areicles(Model model,Article article,@RequestParam(defaultValue = "1") Integer page,@RequestParam(defaultValue = "5") Integer pageSize) {
		
		PageInfo<Article> selects = articleService.selects(article, page, pageSize);
		model.addAttribute("pg", selects);
		model.addAttribute("article", article);
		return "admin/article/articles";
	}
	
	//修改文章
	@RequestMapping("article/update")
	@ResponseBody
	public boolean update(Article article) {
		return articleService.update(article);
	}
	
	//查询单个文章
	@ResponseBody
	@RequestMapping("article/select")
	public Article select(Integer id) {
		return articleService.select(id);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
