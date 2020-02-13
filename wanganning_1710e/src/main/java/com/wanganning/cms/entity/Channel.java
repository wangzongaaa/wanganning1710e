package com.wanganning.cms.entity;

import java.io.Serializable;
/**
 * 
 * @ClassName: Channel 
 * @Description: 栏目
 * @author: 王圣瑄
 * @date: 2020年1月8日 下午7:07:14
 */
public class Channel implements Serializable{
	/**
	 * @fieldName: serialVersionUID
	 * @fieldType: long
	 * @Description: TODO
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String name;

    private String description;

    private String icon;

    private Integer sorted;

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
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the icon
	 */
	public String getIcon() {
		return icon;
	}

	/**
	 * @param icon the icon to set
	 */
	public void setIcon(String icon) {
		this.icon = icon;
	}

	/**
	 * @return the sorted
	 */
	public Integer getSorted() {
		return sorted;
	}

	/**
	 * @param sorted the sorted to set
	 */
	public void setSorted(Integer sorted) {
		this.sorted = sorted;
	}
    
}
