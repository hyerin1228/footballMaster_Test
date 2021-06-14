package com.newdeal.footballMaster.model;

import lombok.Data;

@Data
public class MatchFilter {
	private int id;					// 매치 프라이머리 키
	private String name;			// 구장 이름
	private String area;			// 구장 지역
	private String match_date;		// 매치 날짜
	private String gender_rule;		// 성별 룰
	private String level;			// 선수 체급
	private int day;				// 검색할 날짜
	private int field_id;			// 필드 프라이머리 키
}
