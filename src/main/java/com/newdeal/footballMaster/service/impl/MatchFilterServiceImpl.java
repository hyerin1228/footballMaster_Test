package com.newdeal.footballMaster.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newdeal.footballMaster.model.MatchFilter;
import com.newdeal.footballMaster.service.MatchFilterService;

@Service
public class MatchFilterServiceImpl implements MatchFilterService{
	
	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	// 필터링한 매치 정보 가져오기
	@Override
	public List<MatchFilter> getMatchFilter(MatchFilter input) {
		
		List<MatchFilter> result = sqlSession.selectList("MatchFilterMapper.matchFilterList", input);
		
		return result;
	}

	// 필터링한 지역 정보 가져오기
	@Override
	public List<String> getRegionFilter() {
		List<String> result = sqlSession.selectList("MatchFilterMapper.regionFilterList");
		return result;
	}
	


}
