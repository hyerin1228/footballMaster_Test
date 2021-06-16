<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file='includes/header.jsp' %>

        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.8/dist/vue.js"></script>

        <div class="content">
            <div class="contentHeroWrap">
                <div id="stadMap" style="z-index: 0;">
                    <div class="sdso_pic_1" style="height: 100%;" id="map">
                    </div>
                </div>


                <div class="contentHero">
                    <div class="stadGal">
                        <img src="http://localhost:8080/footballMaster/assets/img/img1.gif" alt="용산 아이파크몰 (6구장)">
                    </div>
                    <div class="stadGal">
                        <img src="http://localhost:8080/footballMaster/assets/img/img2.gif" alt="용산 아이파크몰 (6구장)">
                    </div>
                    <div class="stadGal">
                        <img src="http://localhost:8080/footballMaster/assets/img/img3.gif" alt="용산 아이파크몰 (6구장)">
                    </div>
                    <div class="stadGal">
                        <img src="http://localhost:8080/footballMaster/assets/img/img1.gif" alt="용산 아이파크몰 (6구장)">
                    </div>
                </div>
            </div>

            <div class="contentWrapper matchDetail">
                <div class="matchWrap">

                    <div class="matchNav" id="mnNav">
                        <ul>
                            <li><a href="#mnRule">진행 방식</a></li>

                            <li><a href="#mnFeature">구장 시설</a></li>
                            <li style=""><a href="#mnCaution">매치 안내</a></li>
                            <li><a href="#mnTerm">환급 규정</a></li>
                        </ul>
                    </div>

                    <div class="sectionWrap">
                        <div class="stadSec">
                            <div class="matchTime">
                                <p>2021년 6월 16일 수요일 12:00</p>
                            </div>
                            <div class="matchPlace">
                                <h1 class="txtH w700h"><a href="/stadium/27/matches/">용산 아이파크몰 (6구장)</a></h1>
                                <div class="wtgTool">
                                    <p class="txt1">서울 용산구 한강대로23길 55</p>
                                    <p class="txt1 w400h" id="toggleMap" onclick="showmap()">지도 보기</span>
                                </div>
                            </div>
                            <div class="match-info__fee" id="matchDetailApp">
                                <div class="matchFee">
                                    <span>참가비</span>
                                    <p>10,000원</p>
                                </div>
                            </div>
                        </div>


                        <div id="matchLevel" class="stadSec" v-cloak>
                            <div class="titleWrap">
                                <h3>특이사항</h3>
                            </div>
                            <!--
                        
                        
                        
                        -->
                            <div class="match-detail__notice corona19-shower">
                                <h3>🚫샤워실 이용 중단</h3>
                                <p>코로나 대응 조치가 격상됨에 따라 샤워장 표기가 사용 불가로 변경됐습니다. 해당 기간 동안 샤워장을 이용하지 않도록 권고 드립니다.</p>
                            </div>


                        </div>





                        <div class="stadSec" id="mnRule">
                            <div class="titleWrap">
                                <h3>진행 방식</h3>
                            </div>
                            <div class="matchFeature">
                                <ul>
                                    <li>
                                        <img src="https://plab-football.s3.amazonaws.com/static/img/ic_6vs6.svg"
                                            alt="6vs6 매치">
                                        <span class="txt2">6vs6 매치</span>
                                    </li>
                                    <li>
                                        <img src="https://plab-football.s3.amazonaws.com/static/img/ic_male.svg"
                                            alt="남성매치">
                                        <span class="txt2">남성매치</span>
                                    </li>
                                    <li>
                                        <img src="https://plab-football.s3.amazonaws.com/static/img/ic_every.svg"
                                            alt="일반">
                                        <span class="txt2">일반</span>
                                    </li>
                                    <li>
                                        <img src="https://plab-football.s3.amazonaws.com/static/img/ic_turf.svg"
                                            alt="풋살화">
                                        <span class="txt2">풋살화</span>
                                    </li>
                                    <li>
                                        <img src="https://plab-football.s3.amazonaws.com/static/img/ic_minmax.svg"
                                            alt="10~16명">
                                        <span class="txt2">10~16명</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="stadInner">
                                <ul class="matchRule">
                                    <!-- <h4>특이사항</h4> -->

                                    <li>일반 매치는 실력에 상관없이 누구나 참여하실 수 있습니다.</li>

                                </ul>
                            </div>
                        </div>

                        <div class="stadSec" id="mnFeature">
                            <div class="titleWrap">
                                <h3>구장 시설</h3>
                            </div>
                            <div class="matchFeature">
                                <ul>
                                    <li>
                                        <img src="https://plab-football.s3.amazonaws.com/static/img/ic_size.svg"
                                            alt="경기장 크기">
                                        <span class="txt2">19x40m</span>
                                    </li>
                                    <li class="noFeature">
                                        <img src="https://plab-football.s3.amazonaws.com/static/img/ic_shower.svg"
                                            alt="샤워장">
                                        <span class="txt2">샤워장</span>

                                    </li>
                                    <li class="">


                                        <img src="https://plab-football.s3.amazonaws.com/static/img/ic_parking_pay.svg"
                                            alt="유료주차">
                                        <span class="txt2">유료주차</span>
                                        <p style="font-size: 11px;">해 주차장 이용, 사전 등록자 3시간 무료</p>


                                    </li>
                                    <li class="noFeature">
                                        <img src="https://plab-football.s3.amazonaws.com/static/img/ic_rentalshoes.svg"
                                            alt="풋살화 대여">
                                        <span class="txt2">풋살화 대여</span>
                                    </li>
                                    <li class="noFeature">
                                        <img src="https://plab-football.s3.amazonaws.com/static/img/ic_rentalwear.svg"
                                            alt="운동복 대여">
                                        <span class="txt2">운동복 대여</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="stadInner" style="">
                                <div class="matchRule">
                                    <h4>구장 특이사항</h4>
                                    <pre class="txt2">매치 전 9층 실내구장 앞으로 &#x27;개별&#x27;로 방문해 전자출입명부(QR코드)를 작성해야 합니다.
            
            ◈플랩 모든 매치는 현재 매치 중, 이동 시 마스크 필수 착용입니다◈
            
            ■풋살장 가는 길
            - 대중교통 이용 시: 용산역 2번 출구 나와서 오른쪽 아디다스더베이스 엘리베이터 이용
            - 자차 이용 시: 해 주차장 이용
            
            ■주차
            - 주차 등록은 당일 변경 및 신청 불가
            (주차 신청 후 출차 시 요금이 발생한 경우에는 주차비 영수증 챙기셔야 환불이 가능합니다.)
            
            - 연타임 이용 시에도 3시간까지만 무료
            - 선착순 2대만 무료 가능
            
            ■흡연: 흡연구역 외 절대 금연
            (흡연구역 외에서 흡연 적발 시 이후 서비스 이용에 제재가 있을 수 있습니다.) 
            
            ■풋살화 대여: 현재 코로나로 인해 중단 되었습니다
            
            ■기타
            - 코로나로 인하여 풋살장 외 장소 이동 시 마스크를 필히 착용하셔야 하며 미이행 시 CCTV 확인 후 추후 이용에 불이익이 발생할 수 있습니다.
            - 별도 안내 시까지 탈의실, 샤워실 이용불가</pre>
                                </div>
                                <span class="contentAnchor">더 자세한 정보는 <a href="/stadium/27/info/">용산 아이파크몰 (6구장)의 시설
                                        정보</a>에서 확인하세요</span>
                            </div>
                        </div>
                        <div class="stadSec">
                            <div class="mngProf">
                                <div class="profPhoto">

                                    <img
                                        src="https://plab-football.s3.amazonaws.com/media/8F420B5E-73BC-494E-82B4-75B98A2EDEC6.jpeg">

                                </div>
                                <div class="profID">
                                    <span class="txt2">매니저</span>
                                    <p class="txt5">김부활</p>
                                </div>
                            </div>
                            <div class="mngDesc">
                                <p class="txt2">
                                    안녕하세요~ 김부활 매니저입니다??
                                    2시간동안 다툼 및 부상 없이, 즐겁게 플레이 해요?
                                </p>
                                <div class="applyMng">
                                    <a href="/manager/apply/">플랩풋볼 매니저에 대해 알아보기</a>
                                </div>
                            </div>
                        </div>

                        <div class="stadSec" id="mnCaution">
                            <div class="titleWrap">
                                <h3>매치 안내</h3>
                            </div>
                            <div class="stadInner">
                                <ul class="matchRule">
                                    <h4>일반</h4>
                                    <li>매치 시작 1시간 30분 전까지 최소 인원(10명) 미달 시 매치가 취소 됩니다. 취소 시 카카오톡을 통해 안내드리며 캐시는 전액 환급됩니다.
                                    </li>
                                </ul>
                                <ul class="matchRule">
                                    <h4>특수 (우천)</h4>
                                    <li>전날 기준 기상청 날씨누리 기준 해당 지역 1mm 이상의 예보가 있는 경우 매치 당일 00시 부터 환급 기준이 변경 됩니다.</li>
                                    <li>인원이 모집되는 경우 우천 시에도 진행됩니다.</li>
                                    <li>진행이 확정되었지만 매치 진행에 변동이 있을 경우 매치 시작 1시간 전까지 안내드립니다.</li>
                                    <li>매치 시작 1시간 30분 전까지 취소하지 않고 불참하면 페어플레이 포인트가 차감되어 향후 이용에 제한이 있습니다. </li>
                                    <li>매치 중 플레이가 어려울 정도로 비가 오는 경우에는 현장에서 매니저 판단하에 종료 될 수 있으며, 진행되지 않은 시간만큼 부분 환급 처리됩니다.
                                    </li>
                                    <li><strong>기상청 예보 없는 게릴라성 호우로 인한 취소 희망시 카카오톡 채널 '플랩풋볼'을 통해 문의 바랍니다.</strong></li>
                                </ul>
                            </div>
                        </div>

                        <div class="banner__wrapper">
                            <a href="/bethemanners/">
                                <img src="https://plab-football.s3.amazonaws.com/static/img/banner_btm_m.jpg">
                            </a>
                        </div>

                        <div class="stadSec" id="mnTerm">
                            <div class="titleWrap">
                                <h3>환급 규정</h3>
                            </div>
                            <div class="stadInner">
                                <ul class="matchRule">
                                    <h4>일반</h4>
                                    <li>매치 시간 기준 (ex.20:00)</li>
                                    <li>2일 전 취소 시: 전액 환급</li>
                                    <li>1일 전 취소 시: 80% 환급</li>
                                    <li>당일 1시간 30분 전까지 취소 시: 20% 환급 (ex. ~18:30)</li>
                                    <li>당일 1시간 30분 미만 취소 시: 0% (ex.18:30~20:00)</li>
                                    <p><strong>취소하지 않고 불참시 페어플레이 포인트가 차감되어 향후 이용에 제한이 있습니다.</strong></p>
                                </ul>
                                <ul class="matchRule">
                                    <h4>특수 (우천)</h4>
                                    <li>매치 시간 기준 (ex.20:00)</li>
                                    <li>당일 00시부터 1시간 30분 전까지 취소 시 : 100% 환급 (ex. ~18:30)</li>
                                    <li>당일 1시간 30분 미만 취소 시 : 0% (ex.18:30~20:00)</li>
                                    <p><strong>취소하지 않고 불참시 페어플레이 포인트가 차감되어 향후 이용에 제한이 있습니다.</strong></p>
                                </ul>
                            </div>
                        </div>
                        <div class="stadSec">
                            <a href="/?stadium=27" class="txt5 w700h ib">용산 아이파크몰</a>
                            <p class="txt5 ib">에서는</p>
                            <p class="txt5">더 많은 경기가 열리고 있습니다</p>
                            <a href="/stadium/27/matches/" class="jumpIn">용산 아이파크몰 스케쥴 보기</a>
                        </div>

                    </div>

                    <div id="matchApply" v-cloak>
                        <div class="letsPlab">
                            <div class="lpWrapper">
                                <div class="btnWrap">
                                    <a href="/" class="btn disable">마감되었습니다</a>
                                </div>
                            </div>
                        </div>



                    </div>
                </div>
            </div>

<script type="text/javascript">
    var _0x61fd=['stickyMnNav','block','navbar-main','parent','href','style','scrollTop','addClass','offsetTop','add','getElementById','noFixed','animate','click','length','end','scroll','40px','stickyTop','remove','display','[href=\x27#','classList','none','.contentHero','filter','attr','map','find','mnActive','stop','preventDefault','outerHeight','plabContainer','top'];(function(_0x281a83,_0x61fd40){var _0x24b10e=function(_0x3eb528){while(--_0x3eb528){_0x281a83['push'](_0x281a83['shift']());}};_0x24b10e(++_0x61fd40);}(_0x61fd,0x10c));var _0x24b1=function(_0x281a83,_0x61fd40){_0x281a83=_0x281a83-0x0;var _0x24b10e=_0x61fd[_0x281a83];return _0x24b10e;};var matchNav=document[_0x24b1('0x16')](_0x24b1('0xe')),matchContainer=document[_0x24b1('0x16')](_0x24b1('0xa'));matchNav[_0x24b1('0x22')][_0x24b1('0x15')](_0x24b1('0x17')),matchContainer[_0x24b1('0x22')][_0x24b1('0x15')](_0x24b1('0x1e')),window['onscroll']=function(){showMnNav();};var mnHeader=document[_0x24b1('0x16')]('mnNav'),sticky=mnHeader[_0x24b1('0x14')];function showMnNav(){document['body'][_0x24b1('0x12')]>0x12c||document['documentElement'][_0x24b1('0x12')]>0x12c?(mnHeader[_0x24b1('0x22')][_0x24b1('0x15')](_0x24b1('0xc')),mnHeader[_0x24b1('0x11')][_0x24b1('0x20')]=_0x24b1('0xd')):(mnHeader[_0x24b1('0x22')][_0x24b1('0x1f')]('stickyMnNav'),mnHeader[_0x24b1('0x11')][_0x24b1('0x20')]=_0x24b1('0x0'));}var lastId,topMenu=$('#mnNav'),topMenuHeight=topMenu[_0x24b1('0x9')]()+0xf,menuItems=topMenu[_0x24b1('0x5')]('a'),scrollItems=menuItems[_0x24b1('0x4')](function(){var _0x541f12=$($(this)[_0x24b1('0x3')](_0x24b1('0x10')));if(_0x541f12['length'])return _0x541f12;});menuItems[_0x24b1('0x19')](function(_0x185169){var _0x23841d=$(this)[_0x24b1('0x3')](_0x24b1('0x10')),_0x4a9f17=_0x23841d==='#'?0x0:$(_0x23841d)['offset']()[_0x24b1('0xb')]-topMenuHeight+0x1;$('html,\x20body')[_0x24b1('0x7')]()[_0x24b1('0x18')]({'scrollTop':_0x4a9f17},0x12c),_0x185169[_0x24b1('0x8')]();}),$(window)[_0x24b1('0x1c')](function(){var _0x7cc61c=$(this)[_0x24b1('0x12')]()+topMenuHeight,_0x3015ec=scrollItems[_0x24b1('0x4')](function(){if($(this)['offset']()[_0x24b1('0xb')]<_0x7cc61c)return this;});_0x3015ec=_0x3015ec[_0x3015ec[_0x24b1('0x1a')]-0x1];var _0x449522=_0x3015ec&&_0x3015ec['length']?_0x3015ec[0x0]['id']:'';lastId!==_0x449522&&(lastId=_0x449522,menuItems[_0x24b1('0xf')]()['removeClass'](_0x24b1('0x6'))[_0x24b1('0x1b')]()[_0x24b1('0x2')](_0x24b1('0x21')+_0x449522+'\x27]')[_0x24b1('0xf')]()[_0x24b1('0x13')](_0x24b1('0x6')));}),$(_0x24b1('0x1'))['slick']({'dots':!![],'slidesToShow':0x1,'arrows':![],'autoplay':!![],'responsive':[{'breakpoint':0x300,'settings':{'arrows':![],'centerPadding':_0x24b1('0x1d'),'slidesToShow':0x1}},{'breakpoint':0x1e0,'settings':{'arrows':![],'centerPadding':_0x24b1('0x1d'),'slidesToShow':0x1}}]});

</script>

<script src="https://plab-football.s3.amazonaws.com/static/slick/slick.min.js"></script>
<script>

	// 구장 사진 슬라이드 설정
	$('.contentHero').slick({
	    dots: true,
	    slidesToShow: 1,
	    arrows: false,
	    fade: true,
	    infinite: true,
	    autoplay: true
	  });
	
</script>

            <!-- footer -->
            <%@include file='includes/footer.jsp' %>