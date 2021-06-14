package com.newdeal.footballMaster.controllers;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newdeal.footballMaster.model.MatchFilter;
import com.newdeal.footballMaster.model.User;
import com.newdeal.footballMaster.service.MatchFilterService;
import com.newdeal.footballMaster.service.UserService;

//import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
//@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	MatchFilterService matchFilterService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	// 회원 가입
	@ResponseBody
	@RequestMapping(value = "signInUser.do", method = RequestMethod.POST)
	public String signInUser(HttpSession session,
			@RequestParam(value="email") String email,
			@RequestParam(value="type") String type) {
		
		// TODO 잘못된 정보 들어왔을때 대응 필요함 프론트에서 하던지 둘다 하던지 일단 작성해야함
		// TODO 같은 이메일정보의 구글, 네이버, 카카오톡 로그인시 병합하는 기능 추가 << 아마 impl 매퍼 죄다 수정
		// TODO 구글은 왜 바로불러오는가... 알아야함 ㅠㅠ
		// TODO 세션비교값을 토큰값으로 바꿔야함 email xxxx << 이거는 로그인에서 적용
		
		User input = new User();
		
		input.setEmail(email);
		input.setType(type);
		
		if (userService.checkUser(email)) {
			return "1";
		} else {
			userService.signInUser(input);
			return "2";
		}
		
		
		
		
	}
	
	/*매치필터 ajax*/
	@ResponseBody
	@RequestMapping(value="matchFilter.do", method=RequestMethod.POST)
	public int matchFilter(Model result, HttpServletResponse response, HttpSession session,
			@RequestParam(value="params") String[] params,
			@RequestParam(value="area") String area,
			@RequestParam(value="day") String day) {
		
		MatchFilter input = new MatchFilter();
		
		String genderRule = "";
		String level = "";
		
		// 성별 파라미터값 분별후 쿼리문으로 전송
		// Male, Female, Mix
		for (int i = 0 ; i < params.length ; i++) {
			if (params[i].equals("Male")) {
				genderRule = "('M')";
				input.setGender_rule(genderRule);
			} else if (params[i].equals("Female")) {
				if (genderRule.equals("('M')")) {
					genderRule = "('M','F')";
					input.setGender_rule(genderRule);
				} else {
					genderRule = "('F')";
					input.setGender_rule(genderRule);
				}
			} else if (params[i].equals("Mix")) {
				if (genderRule.equals("('M')")) {
					genderRule = "('M','H')";
					input.setGender_rule(genderRule);
				} else if (genderRule.equals("('F')")){
					genderRule = "('F','H')";
					input.setGender_rule(genderRule);
				} else if (genderRule.equals("('M','F')")) {
					genderRule = "('M','F','H')";
					input.setGender_rule(genderRule);
				}
			} else {
				genderRule = "('M','F','H')";
				input.setGender_rule(genderRule);
			}
		}
		
		// 레벨 파라미터값 분별후 쿼리문으로 전송
		// Low, Middle, High
		for (int i = 0 ; i < params.length ; i++) {
			if (params[i].equals("Low")) {
				level = "('L')";
				input.setLevel(level);
			} else if (params[i].equals("Middle")) {
				if (level.equals("('L')")) {
					level = "('L','M')";
					input.setLevel(level);
				} else {
					level = "('M')";
					input.setLevel(level);
				}
			} else if (params[i].equals("High")) {
				if (level.equals("('L')")) {
					level = "('L','H')";
					input.setLevel(level);
				} else if (level.equals("('M')")){
					level = "('M','H')";
					input.setLevel(level);
				} else if (level.equals("('L','M')")) {
					level = "('L','M','H')";
					input.setLevel(level);
				}
			} else {
				level = "('L','M','H')";
				input.setLevel(level);
			}
		}
		
		input.setArea(area);
		
		// day 값은 20210507 << 이런식으로 가져와야함 int값 째로 가져올거면 상위 리퀘스트 파람의 데이터 타입을 변경해야함
		// 해당 값을 int로 받아오면 파싱하는 과정 필요 x
		int setDay = Integer.parseInt(day);
		input.setDay(setDay);
		
		List<MatchFilter> output = matchFilterService.getMatchFilter(input);
		
		// 해당 서치값이 없을때
		if (output == null) {
			return 0;
		}
		
		int count = output.size();
		
		result.addAttribute("output", output);
		result.addAttribute("count", count); // 서치된 item 개수
		
		// 해당 리스트 값을 뿌려준다. (가져다 쓰세요)
		return 1;
	}
	
}
