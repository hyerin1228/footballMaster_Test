package com.newdeal.footballMaster.model;

import lombok.Data;

@Data
public class User {
	private int id;				// 유저 프라이머리 키
	private String email;		// 유저 이메일
	private String type;		// 유저 소셜 계정 타입
}

