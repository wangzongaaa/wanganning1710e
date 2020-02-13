package com.wanganning.cms.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.wanganning.cms.entity.Article;
import com.wanganning.cms.entity.Category;
import com.wanganning.cms.entity.Channel;
import com.wanganning.cms.service.ArticleService;
import com.wanganning.cms.service.ChannelService;

@RequestMapping("my")
@Controller
public class MyController {
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ChannelService channelService;

	// 个人中心首页
	@RequestMapping(value = { "", "/", "index" })
	public String index() {
		return "my/index";

	}

	// 我的文章
	@RequestMapping("/article/articles")
	public String articles(Model model, Article article, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "3") Integer pageSize) {

		// article.setUserId(userId);
		// 暂时先把所有文章查询出来。
		PageInfo<Article> info = articleService.selects(article, page, pageSize);
		model.addAttribute("pg", info);
		model.addAttribute("article", article);
		return "my/article/articles";
	}

	// 去发布文章页面
	@GetMapping("article/publish")
	public String publish() {

		return "my/article/publish";

	}

	// 去发布文章页面
	@ResponseBody
	@PostMapping("article/publish")
	public boolean publish(@RequestParam("file2") MultipartFile file, Article article) {

		if (!file.isEmpty()) {
			String upload = "d:/photo/"; // 文件路径
			// 获取文件名称
			String filename = file.getOriginalFilename();
			// 防止文件重名。改文件名称
			String newFilename = UUID.randomUUID() + filename.substring(filename.lastIndexOf("."));
			File f = new File(upload, newFilename);
			try {
				file.transferTo(f);
			} catch (IllegalStateException e) {
			} catch (IOException e) {
				e.printStackTrace();
			}
			article.setPicture(newFilename);// 封装上传的文件名称
		}

		// 封装文件的基本属性

		article.setUserId(177);
		article.setStatus(0);// 默认待审核
		article.setHits(0);// 默认点击量为 0
		article.setDeleted(0);// 默认未删除
		article.setCreated(new Date());// 默认发布时间
		article.setUpdated(new Date());// 默认发布时间
		article.setContentType(0);// 发布的文章类型

		return articleService.insert(article);

	}

	// 查询单个文章
	@ResponseBody
	@RequestMapping("article/select")
	public Article select(Integer id) {
		return articleService.select(id);
	}

	/**
	 * 
	 * @Title: channels
	 * @Description: 返回所有分类
	 * @return
	 * @return: List<Channel>
	 */
	@ResponseBody
	@RequestMapping("channel/channels")
	public List<Channel> channels() {
		return channelService.selects();

	}
	
	/**
	 * 
	 * @Title: channels
	 * @Description: 返回所有分类
	 * @return
	 * @return: List<Channel>
	 */
	@ResponseBody
	@RequestMapping("channel/categorys")
	public List<Category> categorys(Integer channelId) {
		return channelService.selectsByCid(channelId);

	}
	
	
	
}
