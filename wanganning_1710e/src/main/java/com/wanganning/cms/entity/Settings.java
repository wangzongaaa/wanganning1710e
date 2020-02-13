package com.wanganning.cms.entity;

import java.io.Serializable;
/**
 * 
 * @ClassName: Settings 
 * @Description: 系统配置
 * @author: 王圣瑄
 * @date: 2020年1月8日 下午7:08:00
 */
public class Settings implements Serializable{
	/**
	 * @fieldName: serialVersionUID
	 * @fieldType: long
	 * @Description: TODO
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String siteDomain;

    private String siteName;

    private Integer articleListSize;

    private Integer slideSize;

    private String adminUsername;

    private String adminPassword;

	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * @return the siteDomain
	 */
	public String getSiteDomain() {
		return siteDomain;
	}

	/**
	 * @param siteDomain the siteDomain to set
	 */
	public void setSiteDomain(String siteDomain) {
		this.siteDomain = siteDomain;
	}

	/**
	 * @return the siteName
	 */
	public String getSiteName() {
		return siteName;
	}

	/**
	 * @param siteName the siteName to set
	 */
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}

	/**
	 * @return the articleListSize
	 */
	public Integer getArticleListSize() {
		return articleListSize;
	}

	/**
	 * @param articleListSize the articleListSize to set
	 */
	public void setArticleListSize(Integer articleListSize) {
		this.articleListSize = articleListSize;
	}

	/**
	 * @return the slideSize
	 */
	public Integer getSlideSize() {
		return slideSize;
	}

	/**
	 * @param slideSize the slideSize to set
	 */
	public void setSlideSize(Integer slideSize) {
		this.slideSize = slideSize;
	}

	/**
	 * @return the adminUsername
	 */
	public String getAdminUsername() {
		return adminUsername;
	}

	/**
	 * @param adminUsername the adminUsername to set
	 */
	public void setAdminUsername(String adminUsername) {
		this.adminUsername = adminUsername;
	}

	/**
	 * @return the adminPassword
	 */
	public String getAdminPassword() {
		return adminPassword;
	}

	/**
	 * @param adminPassword the adminPassword to set
	 */
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
    
}
