package com.newdeal.footballMaster.controllers;

import java.io.BufferedReader;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.newdeal.footballMaster.model.MainBanner;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
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
	
	// ---------------------
	// 캐시 
	
	// 캐시 충전 페이지 조회
	@RequestMapping(value = "mypage/cash/charge", method = RequestMethod.GET)
	public String cashCharge() {
		logger.info("Welcome cashCharge 조회!");
		return "cash_charge";
	}
	
	// ---------------------
	// 마이페이지
	
	// *. 마이페이지조회(GET)-(/mypage)
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPage() {
		logger.info("Welcome myPage 조회!");
		return "myPage";
	}
	
	
	// *. 마이페이지 -> 회원수정페이지조회(GET)-(/mypage/change) 
	@RequestMapping(value = "/mypage/change", method = RequestMethod.GET)
	public String mypageChange() {
		logger.info("Welcome mypageChange 조회!");
		return "mypage_change";
	}

	
	// ----------------------------------
	// match 페이지
	
	
	// json으로 받는지 test - 혜린
	// 필요한 util이라고...
	private String readJSONStringFromRequestBody(HttpServletRequest request){
	    StringBuffer json = new StringBuffer();
	    String line = null;
	 
	    try {
	        BufferedReader reader = request.getReader();
	        while((line = reader.readLine()) != null) {
	            json.append(line);
	        }
	 
	    }catch(Exception e) {
	        System.out.println("Error reading JSON string: " + e.toString());
	    }
	    return json.toString();
	}
	
	// test 매치상세페이지 이동 -혜린
	@RequestMapping(value = "/mypageChangeTest", method = RequestMethod.POST)
	public String mypageChangeTest(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("Welcome mypageChangeTest!");
		
		Gson gson = new Gson();
	    //DataSet set = new DataSet();
	    String json = readJSONStringFromRequestBody(request); 
	    JSONObject jObj = new JSONObject(json);
	    return gson.toJson(jObj);
	    
	}
	
	

	
	
	// test 매치상세페이지 이동 -혜린
	@RequestMapping(value = "/matches/detail", method = RequestMethod.GET)
	public String matchDetail() {
		logger.info("Welcome matchDetail!");

		return "matchDetail2";
	}
	
	// test 매치신청페이지로 이동 -혜린
	@RequestMapping(value = "/matches//matchApply", method = RequestMethod.GET)
	public String matchApply() {
		logger.info("Welcome matchApply!");
	
		return "matchApply";
	}
	
	
	// test -혜린
	@RequestMapping(value = "/matches", method = RequestMethod.GET)
	public String matches() {
		logger.info("Welcome matches!");

		return "matches";
	}
	
	//@CrossOrigin(origins = "http://127.0.0.1:5500")
	@ResponseBody
	@GetMapping("/banner")
	public List<Map<String,Object>> fetchMainBannerJsonArray()
    {	
		System.out.println("GET fetchMainBanner");
		logger.error("Test fetchMainBanner");
		
		MainBanner mb1 = MainBanner
				.builder()
				.id("id1")
				.link("#")
				.image_m("http://localhost:8080/footballMaster/assets/img/img1.gif")
				.image("http://localhost:8080/footballMaster/assets/img/img1.gif").build();
				
		MainBanner mb2 = MainBanner
				.builder()
				.id("id2")
				.link("#")
				.image_m("http://localhost:8080/footballMaster/assets/img/img2.gif")
				.image("http://localhost:8080/footballMaster/assets/img/img2.gif").build();
		
		MainBanner mb3 = MainBanner
				.builder()
				.id("id3")
				.link("#")
				.image_m("http://localhost:8080/footballMaster/assets/img/img3.gif")
				.image("http://localhost:8080/footballMaster/assets/img/img3.gif").build();
		
		// MainBanner 객체 -> Map 으로 변환
		ObjectMapper objectMapper = new ObjectMapper();
		
		Map<String, Object> map1 = objectMapper.convertValue(mb1, Map.class);
		Map<String, Object> map2 = objectMapper.convertValue(mb2, Map.class);
		Map<String, Object> map3 = objectMapper.convertValue(mb3, Map.class);
		
		
		System.out.println(mb1);
		System.out.println(mb2);
		System.out.println(mb3);
		
		System.out.println("----------변환");
		
		System.out.println(map1);
		System.out.println(map2);
		System.out.println(map3);
		
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		list.add(map1);
		list.add(map2);
		list.add(map3);
		
        return list;
    }
	
	/* 지역 필터 ajax Test - 혜린 */ 
	@ResponseBody
	@RequestMapping(value="regionFilter.do", method=RequestMethod.POST)
	public List<String> regionFilter(Model result, HttpServletResponse response, HttpSession session) {
	//public List<String> regionFilter(Model result, HttpServletResponse response, HttpSession session) {
		System.out.println("POST regionFilter");
		
		List<String> beforeOutput = matchFilterService.getRegionFilter();
		List<String> afterOutput = new ArrayList<String>();
		
		
		System.out.println("before----"+beforeOutput);
		
		for(String i : beforeOutput) {
			System.out.println("before----"+i);
			if (i.equals("A")) {
				i = "서울";
			} else if (i.equals("B")) {
				i = "경기";
			} else if (i.equals("C")) {
				i = "인천";
			} else if (i.equals("D")) {
				i = "대전";
			} else if (i.equals("E")) {
				i = "대구";
			} else if (i.equals("F")) {
				i = "부산";
			} else if (i.equals("G")) {
				i = "울산";
			} else if (i.equals("H")) {
				i = "광주";
			} else if (i.equals("I")) {
				i = "충북";
			} else if (i.equals("J")) {
				i = "경북";
			} else if (i.equals("K")) {
				i = "전북";
			} else if (i.equals("L")) {
				i = "충남";
			} else if (i.equals("M")) {
				i = "경남";
			}
			afterOutput.add(i);
			System.out.println("after----"+i);
		}
		
//		if (area.equals("서울")) {
//			setArea = "A";
//		} else if (area.equals("경기")) {
//			setArea = "B";
//		} else if (area.equals("인천")) {
//			setArea = "C";
//		} else if (area.equals("대전")) {
//			setArea = "D";
//		} else if (area.equals("대구")) {
//			setArea = "E";
//		} else if (area.equals("부산")) {
//			setArea = "F";
//		} else if (area.equals("울산")) {
//			setArea = "G";
//		} else if (area.equals("광주")) {
//			setArea = "H";
//		} else if (area.equals("충북")) {
//			setArea = "I";
//		} else if (area.equals("경북")) {
//			setArea = "J";
//		} else if (area.equals("전북")) {
//			setArea = "K";
//		} else if (area.equals("충남")) {
//			setArea = "L";
//		} else if (area.equals("경남")) {
//			setArea = "M";
//		}
		
		System.out.println("after----"+afterOutput);
		
		return afterOutput;
	}
	
	
	
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
	public int matchFilter(
	//public int matchFilter(Model result, HttpServletResponse response, HttpSession session,
			@RequestParam(value="params") String[] params,
			@RequestParam(value="area") String area,
			@RequestParam(value="day") String day) {
//		@RequestParam(value="day") @DateTimeFormat(pattern="yyyy-MM-dd") Date day) {
		
		System.out.println("matchFilter.do");
//		for(String i : params) {
//			System.out.println("params = " + i);
//		}
//		System.out.println("area = " + area);
//		System.out.println("day = " + day);
//		

		MatchFilter input = new MatchFilter();
		
		String genderRule = "";
		String level = "";
		
//		for (int i = 0 ; i < params.length ; i++) {
//			if (params[i].equals("Male")) {
//				genderRule = "'M'";
//				input.setGender_rule(genderRule);
//			} else if (params[i].equals("Female")) {
//				if (genderRule.equals("'M'")) {
//					genderRule = "'M','F'";
//					input.setGender_rule(genderRule);
//				} else {
//					genderRule = "'F'";
//					input.setGender_rule(genderRule);
//				}
//			} else if (params[i].equals("Mix")) {
//				if (genderRule.equals("'M'")) {
//					genderRule = "('M','H')";
//					input.setGender_rule(genderRule);
//				} else if (genderRule.equals("'F'")){
//					genderRule = "('F','H')";
//					input.setGender_rule(genderRule);
//				} else if (genderRule.equals("'M','F'")) {
//					genderRule = "('M','F','H')";
//					input.setGender_rule(genderRule);
//				}
//			} else {
//				genderRule = "('M','F','H')";
//				input.setGender_rule(genderRule);
//			}
//		}
//		
//		// 레벨 파라미터값 분별후 쿼리문으로 전송
//		// Low, Middle, High
//		for (int i = 0 ; i < params.length ; i++) {
//			if (params[i].equals("Low")) {
//				level = "L";
//				input.setLevel(level);
//			} else if (params[i].equals("Middle")) {
//				if (level.equals("'L'")) {
//					level = "'L','M'";
//					input.setLevel(level);
//				} else {
//					level = "'M'";
//					input.setLevel(level);
//				}
//			} else if (params[i].equals("High")) {
//				if (level.equals("'L'")) {
//					level = "'L','H'";
//					input.setLevel(level);
//				} else if (level.equals("'M'")){
//					level = "'M','H'";
//					input.setLevel(level);
//				} else if (level.equals("'L','M'")) {
//					level = "'L','M','H'";
//					input.setLevel(level);
//				}
//			} else {
//				level = "L,M,H";
//				input.setLevel(level);
//			}
//		}
		
		
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
		
		// 성별 파라미터값 분별후 쿼리문으로 전송
		// Male, Female, Mix
		/*
		for (int i = 0 ; i < params.length ; i++) {
			if (params[i].equals("Male")) {
				genderRule = "(M)";
				input.setGender_rule(genderRule);
			} else if (params[i].equals("Female")) {
				if (genderRule.equals("M")) {
					genderRule = "(M,F)";
					input.setGender_rule(genderRule);
				} else {
					genderRule = "(F)";
					input.setGender_rule(genderRule);
				}
			} else if (params[i].equals("Mix")) {
				if (genderRule.equals("M")) {
					genderRule = "(M,H)";
					input.setGender_rule(genderRule);
				} else if (genderRule.equals("F")){
					genderRule = "(F,H)";
					input.setGender_rule(genderRule);
				} else if (genderRule.equals("M,F")) {
					genderRule = "(M,F,H)";
					input.setGender_rule(genderRule);
				}
			} else {
				genderRule = "(M,F,H)";
				input.setGender_rule(genderRule);
			}
		}
		
		// 레벨 파라미터값 분별후 쿼리문으로 전송
		// Low, Middle, High
		for (int i = 0 ; i < params.length ; i++) {
			if (params[i].equals("Low")) {
				level = "(L)";
				input.setLevel(level);
			} else if (params[i].equals("Middle")) {
				if (level.equals("L")) {
					level = "(L,M)";
					input.setLevel(level);
				} else {
					level = "(M)";
					input.setLevel(level);
				}
			} else if (params[i].equals("High")) {
				if (level.equals("L")) {
					level = "(L,H)";
					input.setLevel(level);
				} else if (level.equals("M")){
					level = "(M,H)";
					input.setLevel(level);
				} else if (level.equals("L,M")) {
					level = "(L,M,H)";
					input.setLevel(level);
				}
			} else {
				level = "(L,M,H)";
				input.setLevel(level);
			}
		}
		
		//---
		/*
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
		*/
		
//		String setArea = "";
//		if (area.equals("서울")) {
//			setArea = "A";
//		} else if (area.equals("경기")) {
//			setArea = "B";
//		} else if (area.equals("인천")) {
//			setArea = "C";
//		} else if (area.equals("대전")) {
//			setArea = "D";
//		} else if (area.equals("대구")) {
//			setArea = "E";
//		} else if (area.equals("부산")) {
//			setArea = "F";
//		} else if (area.equals("울산")) {
//			setArea = "G";
//		} else if (area.equals("광주")) {
//			setArea = "H";
//		} else if (area.equals("충북")) {
//			setArea = "I";
//		} else if (area.equals("경북")) {
//			setArea = "J";
//		} else if (area.equals("전북")) {
//			setArea = "K";
//		} else if (area.equals("충남")) {
//			setArea = "L";
//		} else if (area.equals("경남")) {
//			setArea = "M";
//		}
		
		input.setArea(area);

		
		// day 값은 20210507 << 이런식으로 가져와야함 int값 째로 가져올거면 상위 리퀘스트 파람의 데이터 타입을 변경해야함
		// 해당 값을 int로 받아오면 파싱하는 과정 필요 x
		//int setDay = Integer.parseInt(day);
		//input.setDay(setDay);
		
		System.out.println("-----------");
		System.out.println(input);

		List<MatchFilter> output = matchFilterService.getMatchFilter(input);
		
		// 해당 서치값이 없을때
		if (output == null) {
			return 0;
		}
		
		int count = output.size();
		
		
		for(MatchFilter i : output) {
			System.out.println("-----");
			System.out.println(i);
		}
		
		//result.addAttribute("output", output);
		//result.addAttribute("count", count); // 서치된 item 개수
			
		
		// 해당 리스트 값을 뿌려준다. (가져다 쓰세요)
		
		
		return 1;
	}
	
	
	
}
