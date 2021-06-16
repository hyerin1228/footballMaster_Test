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
            <!-- <div class="carousel--container">
                <ul class="carousel--wrapper slick-initialized slick-slider slick-dotted">
                    <div class="slick-list draggable">
                        <div class="slick-track"
                            style="opacity: 1; width: 10384px; transform: translate3d(-1888px, 0px, 0px);">
                            <li class="carousel--hero slick-slide slick-cloned" data-slick-index="-1" aria-hidden="true"
                                tabindex="-1" style="width: 944px;"><a href="#" tabindex="-1">
                                    <div class="carousel--img">
                                        <img src="images/img1.gif" class="carousel--img_m">
                                        <img src="images/img1.gif" class="carousel--img_pc">
                                    </div>
                                </a></li>
                            <li class="carousel--hero slick-slide" data-slick-index="0" aria-hidden="true" tabindex="-1"
                                role="tabpanel" id="slick-slide10" aria-describedby="slick-slide-control10"
                                style="width: 944px;">
                                <a href="#" tabindex="-1">
                                    <div class="carousel--img">
                                        <img src="images/img2.gif" class="carousel--img_m">
                                        <img src="images/img2.gif" class="carousel--img_pc">
                                    </div>
                                </a>
                            </li>
                            <li class="carousel--hero slick-slide slick-current slick-active" data-slick-index="1"
                                aria-hidden="false" tabindex="0" role="tabpanel" id="slick-slide11"
                                aria-describedby="slick-slide-control11" style="width: 944px;"><a href="#" tabindex="0">
                                    <div class="carousel--img">
                                        <img src="images/img3.gif" class="carousel--img_m">
                                        <img src="images/img3.gif" class="carousel--img_pc">
                                    </div>
                                </a></li>

                            <li class="carousel--hero slick-slide slick-cloned" data-slick-index="5" aria-hidden="true"
                                tabindex="-1" style="width: 944px;"><a href="#" tabindex="-1">
                                    <div class="carousel--img"><img src="images/img1.gif" class="carousel--img_m">
                                        <img src="images/img1.gif" class="carousel--img_pc">
                                    </div>
                                </a></li>
                            <li class="carousel--hero slick-slide slick-cloned" data-slick-index="6" aria-hidden="true"
                                tabindex="-1" style="width: 944px;"><a href="#" tabindex="-1">
                                    <div class="carousel--img"><img src="images/img2.gif" class="carousel--img_m">
                                        <img src="images/img2.gif" class="carousel--img_pc">
                                    </div>
                                </a></li>
                            <li class="carousel--hero slick-slide slick-cloned" data-slick-index="7" aria-hidden="true"
                                tabindex="-1" style="width: 944px;"><a href="#" tabindex="-1">
                                    <div class="carousel--img"><img src="images/img3.gif" class="carousel--img_m">
                                        <img src="#" class="carousel--img_pc">
                                    </div>
                                </a></li>

                        </div>
                    </div>
                    <ul class="slick-dots" style="" role="tablist">
                        <li class="" role="presentation">
                            <button type="button" role="tab" id="slick-slide-control10" aria-controls="slick-slide10"
                                aria-label="1 of 3" tabindex="-1">1</button>
                        </li>
                        <li role="presentation" class="slick-active"><button type="button" role="tab"
                                id="slick-slide-control11" aria-controls="slick-slide11" aria-label="2 of 3"
                                tabindex="0" aria-selected="true">2</button>
                        </li>
                        <li role="presentation" class=""><button type="button" role="tab" id="slick-slide-control12"
                                aria-controls="slick-slide12" aria-label="3 of 3" tabindex="-1">3</button>
                        </li>
                    </ul>
                </ul>
            </div> -->
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
                            <p style=""><strong>111</strong>개의 매치</p>
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
                        <li class="list--match-schedule--item"><a>
                                <div class="list--match-schedule__time">
                                    <p>10:00</p>
                                </div>
                                <div class="list--match-schedule__info">
                                    <!---->
                                    <!---->
                                    <div class="match-list__title">
                                        <h3>서초 스타 풋살장 A면</h3>
                                        <!---->
                                    </div>
                                    <div class="label--match-option"><span class="match--option isMix">남녀모두</span>
                                        <span>6vs6</span>
                                        <span>3파전</span> <span>일반 (Lv 1~5)</span>
                                        <!---->
                                        <!---->
                                        <!---->
                                    </div>
                                </div>
                                <div class="list--match-schedule__status">
                                    <div class="match-status isFull">
                                        <p>마감</p>
                                    </div>
                                </div>
                            </a>
                            <!---->
                            <!---->
                            <!---->
                            <!---->
                            <!---->
                        </li>
                        <li class="list--match-schedule--item"><a>
                                <div class="list--match-schedule__time">
                                    <p>10:00</p>
                                </div>
                                <div class="list--match-schedule__info">
                                    <!---->
                                    <!---->
                                    <div class="match-list__title">
                                        <h3>용산 아이파크몰 (6구장) *주차1자리*</h3>
                                        <!---->
                                    </div>
                                    <div class="label--match-option"><span class="match--option isMen">남성</span>
                                        <span>6vs6</span>
                                        <span>매치</span> <span>일반 (Lv 1~5)</span>
                                        <!---->
                                        <!---->
                                        <!---->
                                    </div>
                                </div>
                                <div class="list--match-schedule__status">
                                    <div class="match-status isFull">
                                        <p>마감</p>
                                    </div>
                                </div>
                            </a>
                            <!---->
                            <!---->
                            <!---->
                            <!---->
                            <!---->
                        </li>
                        <li class="list--match-schedule--item"><a>
                                <div class="list--match-schedule__time">
                                    <p>10:00</p>
                                </div>
                                <div class="list--match-schedule__info">
                                    <!---->
                                    <!---->
                                    <div class="match-list__title">
                                        <h3>시흥 루프탑필드 (시흥 프리미엄 아울렛) </h3>
                                        <!---->
                                    </div>
                                    <div class="label--match-option"><span class="match--option isMen">남성</span>
                                        <span>6vs6</span>
                                        <span>매치</span> <span>일반 (Lv 1~5)</span>
                                        <!---->
                                        <!---->
                                        <!---->
                                    </div>
                                </div>
                                <div class="list--match-schedule__status">
                                    <div class="match-status isHurry">
                                        <p>마감임박!</p>
                                    </div>
                                </div>
                            </a>
                            <!---->
                            <!---->
                            <!---->
                            <!---->
                            <!---->
                        </li>
                        <li class="list--match-schedule--item"><a>
                                <div class="list--match-schedule__time">
                                    <p>22:00</p>
                                </div>
                                <div class="list--match-schedule__info">
                                    <!---->
                                    <!---->
                                    <div class="match-list__title">
                                        <h3>고양 화전 드림 풋살장 B면</h3>
                                        <!---->
                                    </div>
                                    <div class="label--match-option"><span class="match--option isMen">남성</span>
                                        <span>6vs6</span>
                                        <span>매치</span> <span>일반 (Lv 1~5)</span>
                                        <!---->
                                        <!---->
                                        <!---->
                                    </div>
                                </div>
                                <div class="list--match-schedule__status">
                                    <div class="match-status isHurry">
                                        <p>마감임박!</p>
                                    </div>
                                </div>
                            </a>
                            <!---->
                            <!---->
                            <!---->
                            <!---->
                            <!---->
                        </li>

                    </ul>
                </div>
            </div>
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

        <script src="https://unpkg.com/vue/dist/vue.js"></script>
        <script src="https://unpkg.com/vue-cookies@1.7.0/vue-cookies.js"></script>

        <script type="text/javascript">
            
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
                        
                        
                		axios.post('/footballMaster/matchFilter.do', params)
                		.then(function(res) {
                            v.isLoading = false
                            v.isFullLoading = false
                            // v.fetchMainBanner()
                            v.currentMatches = res.data
							
                            console.log("call fetchMatches!!")
                            console.log(res.data);
                            
                            var a = 0
//                            for(i = 0; i < v.currentMatches.results.length; i++) {
//                                if(v.currentMatches.results[i].schedule > v.now) {
//                                    a++
//                                }
//                            }
                            v.currentMatchesNum = a
                            setTimeout(() => v.newStadiumToast = false, 2000);
                            v.runBounce = true
                		})
                		.catch(function() {
                		})
                	},
                	
                 // 날짜 슬라이드
/*                     dataMatches: function (getDate, index) {
                        this.currentDate = getDate
                        this.fetchMatches()
                        var beforeCurrent = this.matchDays.findIndex(i => i.is_current == true)

                        this.matchDays[beforeCurrent].is_current = false
                        this.matchDays[index].is_current = true
                    }, */
                    
                    getFilters() {
                        // this.typeSearch = document.getElementById("searchId").value
                        var paramCategory = "&params="
                        var paramArea = "&area="
                        var paramDay = "&day="
	                    
						//var paramDayOn = this.currentDate + ""
                        
                        // var regionValue = this.selectRegion
                        
                        // 카테고리 필터 적용하기 버튼을 누르면 실행될 필터.
/*                         if (this.checkedParam.length === 0) {
                        	paramCategory = ''
                        }
                        if (this.checkedRegion.length === 0) {
                        	paramArea = ''
                        } */

                        // var regionValue = this.selectRegion
                        // if(this.checkedSex.length === 0) {
                        //     paramSex = ''
                        // }
                        // if(this.checkedLevel.length === 0) {
                        //     paramLevel = ''
                        // }
                        // if(this.checkedType.length === 0) {
                        //     paramType = ''
                        // }
                        // if(this.selectRegion == null) {
                        //     regionValue = 'me'
                        // }
                        // if(this.typeSearch == null || this.checkedLevel.length === 0) {
                        //     paramSearch = ''
                        // }

                        return "?day=" + this.currentDate.toString() + paramCategory + paramCateOn + paramArea + paramAreaOn
                    },

                },
                watch: {

                },
                computed: {

                }

            });

        </script>

        <script>
    	$.noConflict();
            $(document).ready(function () {

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
        
        <script>
        
        </script>

        <!-- footer -->
        <%@include file='includes/footer.jsp' %>