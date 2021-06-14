package com.newdeal.footballMaster.service;

import java.util.List;

import com.newdeal.footballMaster.model.MatchFilter;

public interface MatchFilterService {
	
	// 메인 화면 매치 필터 정보 뿌려주기
	public List<MatchFilter> getMatchFilter(MatchFilter input);

}
