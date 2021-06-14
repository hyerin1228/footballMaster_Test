package com.newdeal.footballMaster.model;

import lombok.Data;

@Data
public class UserMatch {
	private int id;				// 유저의 매치 프라이머리 키
	private int match_id;		// 매치 프라이머리 키
	private int user_id;		// 유저 프라이머리 키
}
