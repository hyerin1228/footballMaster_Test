<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file='includes/header.jsp' %>
	
	 <script src="https://cdn.jsdelivr.net/npm/vue@2.6.8/dist/vue.js"></script>
        <div id="app">
            <div class="navigation--container">
                <div class="navigation--wrapper">
                    <div class="navigation--item">
                        <a class="selected" href="/">소셜 매치</a>
                        <a href="/rental/">
                            구장 예약
                            <span class="is_new">N</span>
                        </a>
                    </div>
                </div>
            </div>

            <!-- 메인 슬라이드 배너 -->
            <div class="carousel--container">
                <ul class="carousel--wrapper">
                    <li v-for="(mainBanner, index) in mainBanners" class="carousel--hero" :key="mainBanner.id">
                        <a :href="mainBanner.link">
                            <div class="carousel--img">
                                <img :src="mainBanner.image_m" class="carousel--img_m">
                                <img :src="mainBanner.image" class="carousel--img_pc">
                            </div>
                        </a>
                    </li>
                </ul>
            </div>

            <!-- 날짜 슬라이드 -->
            <div class="main--match--container">
                <div id="dateNav" class="sub-header">
                    <div class="tabWrap">
                        <div class="swipe-tabs">
                            <ul class="swipe-tab">
                                <li v-for="(day, index) in matchDays" :key="day.id" class="dateWrap slick-slide"
                                    :class="{ isActive: day.is_current == true, 'slick-active': day.is_current == true, 'slick-slide': day.is_current == true, isSat: day.yoil == '토', isSun: day.yoil == '일' }"
                                    @click="dateMatches(day.year+'-'+day.month+'-'+day.day, index)">
                                    <p class="">[[ day.day ]]</p>
                                    <span class="">[[ day.yoil ]]</span>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="main__filter">
                    <div class="main__match-filter">
                        <ul>
                            <li><a @click="fetchMatches('서울')" class="match-filter-item--active">서울</a></li>
                            <li><a @click="fetchMatches('경기')">경기</a></li>
                            <li><a @click="fetchMatches('인천')">인천</a></li>
                            <li><a @click="fetchMatches('대전')">대전</a></li>
                            <li><a @click="fetchMatches('대구')">대구</a></li>
                            <li><a @click="fetchMatches('부산')">부산</a></li>
                            <li><a @click="fetchMatches('울산')">울산</a></li>
                            <li><a @click="fetchMatches('광주')">광주</a></li>
                            <li><a @click="fetchMatches('충북')">충북</a></li>
                            <li><a @click="fetchMatches('경북')">경북</a></li>
                            <li><a @click="fetchMatches('전북')">전북</a></li>
                            <li><a @click="fetchMatches('충남')">충남</a></li>
                            <li><a @click="fetchMatches('경남')">경남</a></li>
                        </ul>
<!--                         <ul v-if="runBounce">
                    
                    <li v-for="region in currentRegions">
                        <a @click="fetchMatches(region.id)" :class="{'match-filter-item--active': region.id == selectRegion}">[[ region.name ]]</a>
                    </li>
                </ul> -->
                    </div>
                    <div class="main--match--filter">
                        <div class="filter--results">
                            <p v-show="currentMatchesNum != 0"><strong>[[ currentMatchesNum ]]</strong>개의 매치</p>
                        </div>
                        <div class="filter--wrapper" id="modalBtn">
                            <!--<button type="button" id="modalBtn" class="btn btn-primary">매치</button>-->
                            <!-- <span @click="showFilterMatch = !showFilterMatch" v-if="noFilters"> -->
                            <span>모든 매치</span>
                            <!---->
                        </div>
                    </div>
                </div>
                <div class="list--match-schedule--container">
                    <ul>
                        <!---->
                        <li class="list--match-schedule--item" v-for="(match, index) in currentMatches" v-show="!isLoading" v-if="match.match_date < now" :class="{'hide': match.id == 53057}"><a>
                                <!-- <a @click="goToMatch(match.id)"> -->
                                <div class="list--match-schedule__time">
                                    <p>[[ match.match_date ]] : 00</p>
                                </div>
                                
                                <div class="list--match-schedule__info">
                                    <!---->
                                    <!---->
                                    <div class="match-list__title" onclick="location.href='http://localhost:8080/footballMaster/matches/detail'">
                                        <h3>[[ match.name ]]</h3>
                                        <!---->
                                    </div>
                                    <div class="label--match-option">
                                    	<span v-if="match.gender_rule == '남성'" class="match--option isMen">남성</span>
                                    	<span v-else-if="match.gender_rule == '혼성' " class="match--option isMix">남녀모두</span>
                                    	<span v-else-if="match.gender_rule == '여성'" class="match--option isWomen">여성</span>
                                        
                                        <span v-if="match.level == '일반 (Lv 1~5)'" class="match--option is_beginner">일반 (Lv 1~5)</span>
	                                    <span v-else-if="match.level == '초급 (Lv 1~2)'" class="match--option is_beginner">초급 (Lv 1~2)</span>
	                                    <span v-else-if="match.level == '중급 (Lv 3~5)'" class="match--option is_mid">중급 (Lv 3~5)</span>
                                        <!---->
                                        <!---->
                                        <!---->
                                    </div>
                                </div>
                                <div class="list--match-schedule__status">
                                    <div class="match-status isFull" v-if="now">
		                                <p>마감</p>
		                            </div>
<!-- 		                            <div class="match-status isHurry" v-else-if="match.apply_status == 'hurry'">
		                                <p>마감임박!</p>
		                                
		                            </div>
		                            <div class="match-status isOpen" v-else-if="match.apply_status == 'available'">
		                                <p>신청가능</p>
		                                
		                            </div> -->
                                </div>
                            </a>
                            <!---->
                            <!---->
                            <!---->
                            <!---->
                            <!---->
                        </li>
                        <div class="list--match-schedule__noItem" v-if="currentMatchesNum == 0">
		                    <h3>등록된 매치가 없습니다</h3>
		                    <p>다른 날짜 혹은 다른 검색 조건을 적용해보세요 :)</p>
		                </div>
		                </ul>
		                </div>
		               </div>
		               
		                   <div class="list--bottom--banner--container">
						    </div>
		                
        <!-- 모달 팝업 -->
        <div class="modal" id="myModal" tabindex="-1" role="dialog" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal--wrapper isFull">
                        <div class="modal--header">
                            <p class="modal--title">카테고리</p>
                            <p class="modal--close" id="modalClose">취소</p>
                        </div>
                        <div class="modal-body">
                            <div class="filter--region">
                                <div class="filter--region--item">
                                    <ul class="filter--list">
                                        <h4>성별</h4>
                                        <li>
                                            <input type="checkbox" class="filterCheck grey" id="sex_m" value="1">
                                            <label for="sex_m" class="checkLabel">남성</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="filterCheck grey" id="sex_w" value="-1">
                                            <label for="sex_w" class="checkLabel">여성</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="filterCheck grey" id="sex_u" value="0">
                                            <label for="sex_u" class="checkLabel">남녀 모두</label>
                                        </li>
                                    </ul>

                                    <ul class="filter--list">
                                        <h4>레벨</h4>
                                        <li>
                                            <input type="checkbox" class="filterCheck grey" id="level_beginner"
                                                value="1">
                                            <label for="level_beginner" class="checkLabel">초급 (Lv 1~2)</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="filterCheck grey" id="level_mid" value="2">
                                            <label for="level_mid" class="checkLabel">중급 (Lv 3~5)</label>
                                        </li>
                                        <li>
                                            <input type="checkbox" class="filterCheck grey" id="level_every" value="0">
                                            <label for="level_every" class="checkLabel">일반 (Lv 1~5)</label>
                                        </li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                        <div class="modal--bottom">
                            <div class="modal--button">
                                <span class="btn full yellow lg" id="saveBtn" data-dismiss="modal">적용하기</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>

        <script src="https://unpkg.com/vue/dist/vue.js"></script>
        <script src="https://unpkg.com/vue-cookies@1.7.0/vue-cookies.js"></script>

        <script type="text/javascript">
        	$.noConflict();
        	
        	var currentDate = '';
            var is_first = false;
            currentDate = moment().format('YYYY-MM-D');
            if (!currentDate) {
                if (getCookie('currentDate') != null) {
                    currentDate = getCookie('currentDate')
                    delete_cookie('currentDate')
                } else {
                    currentDate = moment().format('YYYY-MM-D')
                }
                is_first = true;
         //        var filters = "?schedule="+currentDate+"&sex=1,0,-1&level=0,1,2&type=match,cup"
        	// 	location.href = "/f/"+filters
            }

            // vue 시작?
            var home = new Vue({
                delimiters: ['[[', ']]'],
                el: '#app',
                data: {
                	currentDate: '',  //현재 날짜
                    checkedSex: [],
                    checkedLevel: [],
                    checkedType: [],
                    checkedRegion: [],
                    checkedParam: [],

                    matchDays: [],
                    currentMatches: [],
                    currentMatchesNum: [],
                    
                    isLoading: false,
                    isFullLoading: false,
                    now: false,
                    mainBanners: [],    // 메인 슬라이드 배너
                    allRegions: [],
                    selectRegion: null,
                    noFilters: false, // 메인 슬라이드 배너 관련 필요..
                    runBounce: true,
                    allCheck: false
                    //mainListBanners: [],
                },
                created: function () {
                    this.currentDate = currentDate
                    for (var i = 0; i < 14; i++) {
                        var addDate = moment().add(i, 'days');
                        var year = addDate.format('YYYY')
                        var month = addDate.format('MM')
                        var day = addDate.format('D')
                        var weeks = ['일', '월', '화', '수', '목', '금', '토']
                        var yoil = weeks[addDate.weekday()]
                        var is_current = false
                        if (this.currentDate == addDate.format('YYYY-MM-D')) { is_current = true }
                        this.matchDays.push({
                            year: year,
                            month: month,
                            day: day,
                            yoil: yoil,
                            is_current: is_current
                        })
                    }
                    
                    if(''.length != 0) {
                        this.checkedSex = ''.split(',')
                    }
                    if(''.length != 0) {
                        this.checkedLevel = ''.split(',')
                    }
                    if(''.length != 0) {
                        this.checkedType = ''.split(',')
                    }
                    if(''.length != 0) {
                        this.selectRegion = ''.split(',')
                    }

                    this.fetchMatches()
                    //this.fetchRegion() // 지역 리스트 가져오기 (지금 사용하지 않을 거임)
                    this.fetchDateSwipe()
                    this.fetchMainBanner()
                    
                    this.isFullLoading = true;
            
		            if(this.checkedSex.length == 0 && this.checkedLevel.length == 0 && this.checkedType.length == 0 ) {
		                this.noFilters = true
		            }
            
                },
                methods: {
                    // 날짜 슬라이드 초기값 설정
                    fetchDateSwipe() {
                        var currentDateSlide = this.matchDays.findIndex(i => i.is_current == true)
                        $(document).ready(function () {
                            $('.swipe-tab').slick({
                                dots: false,
                                infinite: false,
                                arrows: true,
                                speed: 300,
                                slidesToShow: 7,
                                slidesToScroll: 7,
                                swipeToSlide: true,
                                // focusOnSelect: true,
                                initialSlide: currentDateSlide,
                                responsive: [
                                    {
                                        breakpoint: 1024,
                                        settings: {
                                            arrows: false
                                        }
                                    }
                                ]
                            });
                        });
                    },
                    
                    // 메인 슬라이드 배너 가져오기
                    fetchMainBanner() {
                        var v = this
                        axios.get('http://localhost:8080/footballMaster/banner', config)
                            .then(function (res) {
                                console.log(res.data)
                                v.mainBanners = res.data
                                v.swipeMainBanner()
                                console.log(v.mainBanners.length)
                                console.log(v.mainBanners)
                            })
                            .catch(function (err) { })
                    },
                    swipeMainBanner() {
                        $(document).ready(function () {
                            $('.carousel--wrapper').slick({
                                dots: true,
                                infinite: true,
                                autoplay: true,
                                autoplaySpeed: 2000,
                                arrows: false,
                                customPaging: function (slider, i) {
                                    var thumb = $(slider.$slides[i]).data();
                                    return '<div class="dots-inner"><a onclick="showBanners()"><strong>' + (i + 1) + ' </strong> |' + slider.$slides.length + '</a></div>';
                                },
                                responsive: [
                                    {
                                        breakpoint: 768,
                                        settings: {
                                            arrows: false,
                                            centerMode: true,
                                            centerPadding: '20px',
                                            slidesToShow: 1
                                        }
                                    },
                                    {
                                        breakpoint: 480,
                                        settings: {
                                            arrows: false,
                                            centerMode: true,
                                            centerPadding: '10px',
                                            slidesToShow: 1
                                        }
                                    }
                                ]
                            });
                        });
                    },
                    
/*                     fetchRegion() {
                        var v = this
                        axios.post('http://localhost:8080/footballMaster/regionFilter.do', config)
                        .then(function(res) {

                        	console.log("fetchRegion 호출!");
                        	console.log(res.data);
                        	
                        	// 내가 선택한 지역 v.currentRegions
                        	// 모든 리스트 allRegions
                        	
                        	v
                            v.currentRegions = res.data

                            
                            for(i=0; i < v.currentRegions.length; i++) {
                                var regionVal = v.currentRegions[i]
                                v.allRegions.push(regionVal)
                            }
                            
                            console.log(v.currentRegions)
                            console.log("---------")
                            console.log(v.allRegions)
                            
                             v.currentRegions.move(2,1)
                            v.currentRegions.move(5,2)
                            v.currentRegions.move(5,3)
                            v.currentRegions.move(5,7)
                            v.allRegions.move(2,1)
                            v.allRegions.move(5,2)
                            v.allRegions.move(5,3)
                            v.allRegions.move(5,7)

                            
                        })
                        .catch(function(err) {})
                    },
  */
  
                    // 1번째로 실행됨
                    fetchMatches(regionId) {
                        var v = this;
                        v.isLoading = true
                        v.now = 25
                        if(regionId !== undefined) {
                            v.selectRegion = regionId
                        }
                        
                        // parameter 보내려면 post방식을 get방식으로 달아서 보낼 수 없음
                        // 필요한거 1.성별-레벨 /2.지역 /3.날짜
						var paramCate = ["Male","Female","Mix","Low","Middle","High"]
                        var paramArea = "A"
                        
                        var params = new URLSearchParams();
                        params.append('params', paramCate);
                        params.append('area', paramArea);
                        params.append('day', this.currentDate);
                        
        				var paramArr1 = "&param=";
        				var paramArea1 = "&area=";
        				var paramDay1 = "&day=";
        				// test - json 쿼리스트링 에러가 있는듯
        				var paramArr2 = ['Male','Female','Mix','Low','Middle','High'];
        				var paramArea2 = "A";
        				var paramDay2 = "20210618";
      					var match= [];
        				
        				var queryStr = paramArr1+paramArr2+paramArea1+paramArea2+paramDay1+paramDay2;
                        
        				axios.get('http://localhost:8081/footballMaster/matches?'+queryStr)
        				.then(function(res) {
        					console.log("---1---")
        					console.log(res.data);
                            v.isLoading = false
                            v.fetchMainBanner()
                            v.currentMatches = res.data
                            
                            console.log("---2---")
                            console.log(v.currentMatches)
                            
                            var a = 0
                            for(i=0; i < v.currentMatches.length; i++){
                            	console.log("["+i+"]");
                            	console.log(v.currentMatches[i]);
                            	console.log("[2 : " + v.currentMatches[i].match_date+"]");
                            	if(v.currentMatches[i].match_date < v.now){
                            		a++
                            		console.log("a++:"+a)
                            	}
                            }
                            v.currentMatchesNum = a
                            v.runBounce = true
						})
						.catch(function() {
							
						})
 
                    },
                    getFilters() {
                        // this.typeSearch = document.getElementById("searchId").value
                        var paramCategory = "&params="
                        var paramArea = "&area="
                        var paramDay = "&day="
	                    
                            $.ajax({
                                url: "http://localhost:8081/footballMaster/matches?"+queryStr,
                                type:"GET",
                          	  	dataType: "json",
                          	  	jsonp : "callback",
                                success: function(data) {
                              	// data = email에 해당하는 유저정보
                                  console.log(data);
                                
                                },
                                error:function(request, status, error){ console.log("실패");console.log(request)
                                }
                              });

                        return "?day=" + this.currentDate.toString() + paramCategory + paramCateOn + paramArea
                    },

                },
                watch: {

                },
                computed: {

                }

            });

        </script>

        <script type="text/javascript">
     		$.noConflict();
             $(document).ready(function () {
				var paramArr1 = "&param=";
				var paramArea1 = "&area=";
				var paramDay1 = "&day=";
				// test - json 쿼리스트링 에러가 있는듯
				var paramArr2 = ['Male','Female','Mix','Low','Middle','High'];
				var paramArea2 = "A";
				var paramDay2 = "20210618";
				
				var queryStr = paramArr1+paramArr2+paramArea1+paramArea2+paramDay1+paramDay2;
				
				console.log(queryStr);
				
				//---test
				
                //모달창
                modal = document.getElementById("myModal");
                // 1. 모달 열기 버튼
                modalOpenBtn = document.getElementById("modalBtn");
                // 2. 모달 닫기 버튼
                modalCloseBtn = document.getElementById("modalClose");
                // 3. 모달안 적용하기 버튼
                modalSubmitBtn = document.getElementById("saveBtn");

                // 1. 모달 열기
                modalOpenBtn.onclick = () => {
                    modal.style.display = "flex";
                    $(".modal").css("max-width", "none");
                };

                // 2. 모달 닫기
                modalCloseBtn.onclick = () => {
                    modal.style.display = "none";
                };

                // 3. 모달안 적용하기 버튼
                modalSubmitBtn.onclick = (e) => {
                    // 1.모달바디 가져오기
                    // 2.가져온 것들 중 input[checkbox] 체크된 내용 가져오기
                    // 3. 보내서 확인하기

                    var checkList = [];
                    // var modal = $(".modal-body");
                    // 1. 클래스 이름이 filterCheck grey이고, input checkbox 인 애들 찾기
                    $('input:checkbox[class="filterCheck grey"]').each(function () {
                        // 체크된 true 의 id를 가져옴
                        if (this.checked == true) {
                            //console.log(this.id);
                            //console.log(this.value);
                            checkList.push(this.id);
                        }
                    });
                    // 체크된 저장리스트 출력
                    console.log(checkList);
					
                    
                     $.ajax({
                        url: "http://localhost:8081/footballMaster/matches?"+queryStr,
                        type:"GET",
                  	  	dataType: "json",
                  	  	jsonp : "callback",
                        success: function(data) {
                      	// data = email에 해당하는 유저정보
                          console.log(data);
                        
                        },
                        error:function(request, status, error){ console.log("실패");console.log(request)
                        }
                      });
                    
                };

                // login modal 열기
                loginModalOpen = document.getElementById("modalLoginOpen");
                // 1. 모달 열기 버튼
                loginModalOpenBtn = document.getElementById("loginModalBtn");

                // 1. 모달 열기
                loginModalOpenBtn.onclick = () => {
                    console.log("loginmodal clicked");
                    //loginModalOpen.style.display = "none";
                    $("#modalLoginOpen").css("display", "flex");
                    $("#modalLoginOpen").css("max-width", "none");
                    // $(".modal").css("max-width", "none");
                };

});

        </script>

        <!-- footer -->
        <%@include file='includes/footer.jsp' %>