package com.newdeal.footballMaster.model;

import lombok.Data;

@Data
public class Match {
	private int id;					// 매치 프라이머리 키
	private String match_date;		// 매치 날짜
	private String gender_rule;		// 성별 룰
	private String level;			// 선수 체급
	private int field_id;			// 필드 프라이머리 키
	private int manager_id;			// 매니저 프라이머리 키
}
