package com.newdeal.footballMaster.model;

import lombok.Data;

@Data
public class UserInfo {
	private int id;				// 유저의 개인정보 프라이머리 키
	private String name;		// 유저의 이름
	private String gender;		// 유저의 성별
	private String birthdate;	// 유저의 생일
	private int balance;		// 유저의 남은 잔액
	private int fair_point;		// 유저의 페어포인트 점수
	private int user_id;		// 유저 프라이머리 키
}
