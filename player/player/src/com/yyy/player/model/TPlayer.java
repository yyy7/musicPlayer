package com.yyy.player.model;

import java.math.BigDecimal;

/**
 * TPlayer entity. @author MyEclipse Persistence Tools
 */

public class TPlayer implements java.io.Serializable {

	// Fields

	private Integer id;
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	private String name;
	private String singer;
	private String type;
	private String link;
	private String img;

	// Constructors

	/** default constructor */
	public TPlayer() {
	}

	/** full constructor */
	public TPlayer(String name, String singer, String type, String link,
			String img) {
		this.name = name;
		this.singer = singer;
		this.type = type;
		this.link = link;
		this.img = img;
	}

	// Property accessors

	

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSinger() {
		return this.singer;
	}

	public void setSinger(String singer) {
		this.singer = singer;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getLink() {
		return this.link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

}