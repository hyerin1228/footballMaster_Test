<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file='includes/header.jsp' %>
	
	 <script src="https://cdn.jsdelivr.net/npm/vue@2.6.8/dist/vue.js"></script>
		
<div class="content">
            <div class="contentWrapper">
                <div class="userInfo">
                    <form id="form" class="orderForm" method="POST">
                        <input type="hidden" name="csrfmiddlewaretoken"
                            value="Iw9DlSdh0nMxhVSTgkRpQkSnR37Up9ckPWR9DDBplNRA8AbXsffIFA5PRDj68znz">
                        <div class="orderTitle">
                            <h2>2021년 6월 18일 금요일 10:00</h2>
                            <h2>서초 스타 풋살장 A면</h2>
<!--                         </div> -->
                        <div class="orderInfo">
                            <fieldset>
                                <h3>신청 정보</h3>
                                <div id="myPlayType">
                                    <div class="inputWrap">
                                        <label>신청인</label>
                                        <div class="inputWrapper">
                                            <select name="apply_cnt" id="apply_cnt" class="inputFull"
                                                onChange="changeApplyCount(this)">
                                                <option value="1">1명</option>

                                            </select>
                                            <p class="inputNotice" style="color:#333;font-weight: 400;">코로나19 확산에 따른 모든
                                                참가자의 구장 방문 파악을 위해 <strong>8월 24일부터 1인 신청만 가능</strong>합니다.</p>
                                            <p class="inputNotice" id="teamNotice" style="display: none; color:#FF5454">
                                                최대 3명까지 신청 가능하며, 전체 참가자의 실력, 도착 시간에 따라 다른 팀으로 배정될 수 있습니다.<a
                                                    href="/cs/6/topic/141/">자세히 보기</a></p>
                                        </div>
                                    </div>
                                    <div class="inputWrap" style="display:none">
                                        <label>원데이매니저</label>
                                        <div class="inputWrapper">
                                            <select name="leader_apply" id="leader_apply" class="inputFull">
                                                <option value="0">미신청</option>

                                                <option value="1">신청</option>

                                            </select>
                                            <p class="inputNotice" style="color:#333;font-weight: 400;">매치를 정상적으로 마치면
                                                캐시를 <strong>전액 환급</strong> 해드립니다.</p>
                                        </div>
                                    </div>
                                    <!-- fullloader 있으면 창 다 가려져서 안나옴.. 이유는 왜인지??... -->
<!--                                     <div id="fullLoader" class="fullLoader" v-if="isFullLoading">
                                        <div class="loaderIMG">
                                            <img src="">
                                        </div>
                                    </div> -->
                                    
                                    <div class="modal--container" v-if="editPlayStyle" v-cloak>
                                        <div class="modal--mask white--mask"></div>
                                        <div class="modal--wrapper isFullScroll">
                                            <div class="modal--header">
                                                <p class="my--style--title">즐거운 매치를 위해 실제 실력에 맞게 선택해주세요.</p>
                                            </div>
                                            <div class="modal--body">
                                                <div class="set--my--type type--radio">
                                                    <transition name="slide-fade">
                                                        <div class="level--title" v-if="show">
                                                            <h1>[[ levelTitle ]]</h1>
                                                            <p>[[ levelGuide ]]</p>
                                                        </div>
                                                    </transition>
                                                    <ul class="style--input--wrapper">
                                                        <li v-for="(myLevel, index) in myLevels" style="width: 20%;">
                                                            <input type="radio" class="styleRadio grey"
                                                                :id="myLevel.level" :value="myLevel.level"
                                                                v-model="pickLevel">
                                                            <label :for="myLevel.level" class="checkLabel"
                                                                style="width: 100%;display: block;"
                                                                @click="showLevelGuide(index)">[[ myLevel.txt ]]</label>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="set--my--type type--radio">
                                                    <h4>공수 성향</h4>
                                                    <ul class="style--input--wrapper">
                                                        <li v-for="(myStyle, index) in myStyles"
                                                            style="flex-grow: 3; flex-basis: 33%;">
                                                            <input type="radio" class="styleRadio grey"
                                                                :id="myStyle.style" :value="myStyle.style"
                                                                v-model="pickStyle">
                                                            <label :for="myStyle.style" class="checkLabel">[[
                                                                myStyle.txt ]]</label>
                                                        </li>
                                                    </ul>
                                                </div>
                                                <div class="set--my--type type--radio">
                                                    <h4>자신있는 능력</h4>
                                                    <ul class="style--input--wrapper">
                                                        <li v-for="(myStrength, index) in myStrengths"
                                                            style="flex-grow:6;">
                                                            <input type="radio" class="styleRadio grey"
                                                                :id="myStrength.strength" :value="myStrength.strength"
                                                                v-model="pickStrength">
                                                            <label :for="myStrength.strength" class="checkLabel">[[
                                                                myStrength.txt ]]</label>
                                                        </li>
                                                    </ul class="style--input--wrapper">
                                                </div>
                                                <div class="btn--wrap" :class="{'btn--double': haveStyle}">
                                                    <span class="btn lg" style="background-color: #eee; color: #666"
                                                        @click="editPlayStyle = false" v-if="haveStyle">취소</span>
                                                    <span class="btn lg" @click="postPlayStyle">저장</span>
                                                </div>
                                                <p v-if="isError">모든 항목을 선택해주세요</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                            </fieldset>
                        </div>
                        <div class="orderPay">
                            <fieldset class="payment">
                                <h3>결제</h3>
                                <div class="payRowWrap">
                                    <div class="payRow">
                                        <span>이용 금액</span>
                                        <p id="match_cash"></p>
                                    </div>
                                    <div class="payRow">
                                        <span id="remain_cash">캐시 차감 (잔여: 원)</span>
                                        <p id="sum_cash" class="addFee">0원</p>
                                    </div>
                                </div>
                                <div class="confirm">
                                    <input type="checkbox" name="#" class="checkbox" id="confirmTP">
                                    <label for="confirmTP" class="checkLabel">아래 환불규정 및 주의사항에 동의합니다</label>
                                </div>
                                <!-- <div class="termBox">
                <pre>- 경기 2일전: 전액 환급
- 경기 1일전: 참가비의 80% 환급
- 경기 당일 90분 전: 참가비의 20% 환급
- 경기 당일 90분 미만: 0%
- 인원 부족으로 경기가 취소될 경우에는 최소 1시간 30분 전에 개별적으로 매치 취소 안내를 드리며 해당 캐시는 당일내로 전액 환급 처리됩니다.
- 매치시작 1시간 30분 전까지 취소하지 않고 불참하면 향후 이용의 제한이 있습니다.
- 비가 와도 인원이 모이면 진행하고 있습니다. 신청 시에 미리 일기 예보 확인 부탁드리며 당일 무단 불참 시 추후 서비스 이용이 제한됩니다. 참석이 어려울 경우 꼭 취소 신청 바랍니다.
- 재밌고 원활한 경기 진행을 위해 팀은 '참가자 레벨 데이터'와 '실제 구장에 도착한 참가자' 기준으로 배정됩니다. '개별로 신청했지만 지인과 함께 참가한 경우', '대표 참가자가 단체로 신청한 경우'라고 하더라도 같은 팀으로 배정 되지 않을 수 있습니다.
- 경기 중 부상에 대한 책임은 해당 개인에게 귀속됩니다.
- 보험 등록 관련 안내 <a href="/cs/4/topic/11/" target="_blank">자세히 보기</a></pre>
            </div> -->
                                <div class="noticeBox">
                                    <div>
                                        <h3>환불규정</h3>
                                        <ul>
                                            <h4>일반</h4>
                                            <li>매치 시간 기준 / (ex. 20:00)</li>
                                            <li>2일 전 취소 시: 전액 환급</li>
                                            <li>1일 전 취소 시: 80% 환급</li>
                                            <li>당일 1시간 30분 전까지 취소 시: 20% 환급 (ex. ~18:30)</li>
                                            <li>당일 1시간 30분 미만 취소시: 0% (ex.18:30~20:00)</li>
                                        </ul>
                                        <ul>
                                            <h4>특수(우천)</h4>
                                            <li>매치 시간 기준 / (ex. 20:00)</li>
                                            <li>당일 00시부터 1시간 30분 전까지 취소 시 : 100% 환급 (ex. ~18:30)</li>
                                            <li>당일 1시간 30분 미만 취소시 : 0% (ex.18:30~20:00)</li>
                                        </ul>
                                        <p>*취소하지 않고 불참시 페어플레이 포인트가 차감되어 향후 이용에 제한이 있습니다.</p>
                                        <p>*개인 사정 및 실수로 매치 신청을 잘못한 경우에도 환급 규정은 동일합니다.</p>
                                    </div>
                                </div>
                                <div class="noticeBox" style="margin-top:20px;">
                                    <div>
                                        <h3>주의 사항</h3>
                                        <ul>
                                            <li>매치 시작 1시간 30분 전까지 최소 인원(10명) 미달 시 매치가 취소 됩니다. 취소 시 카카오톡을 통해 안내드리며 캐시는 전액
                                                환급됩니다.</li>
                                            <li>매치 시작 1시간 30분 전까지 취소하지 않고 불참하면 페어플레이 포인트가 차감되어 향후 이용에 제한이 있습니다.</li>
                                            <li><strong>인원이 모집되는 경우 우천 시에도 진행되며 기상청 기준으로 우천 예보가 있는 날의 경우 매치 당일 00시부터 환급
                                                    기준이 변경 됩니다.</strong></li>
                                            <li>부상에 대한 책임은 해당 개인에게 귀속됩니다. 보험 등록 관련 안내 <a href="/cs/4/topic/11/"
                                                    target="_blank">자세히 보기</a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="confirm">
                                    <input type="checkbox" name="#" class="checkbox" id="confirmCorona">
                                    <label for="confirmCorona" class="checkLabel">코로나19 주의사항에 동의합니다</label>
                                </div>
                                <div class="noticeBox">
                                    <ul>
                                        <li><strong>매치 진행중 마스크를 필수로 착용해야 합니다. 마스크를 착용하지 않을 경우 매치 참여가 제한됩니다.
                                            </strong></li>
                                        <li>최근 2주 이내 확진자 접촉 또는 동선에 방문한 경우 참가를 제한하고 있습니다.</li>
                                        <li>확진자 발생 시 개인 정보는 역학조사 용도로 활용되며, 비협조 및 허위 작성 시 「감염병예방 및 관리에 관한 법률」 제 18조에 따라
                                            불이익 처분 (2년 이하의 징역 또는 2천만원 이하의 벌금)을 받을 수 있음을 알려드립니다.</li>
                                    </ul>
                                </div>
                            </fieldset>
                            <div class="btnWrap">
                                <button id="btnApply" class="btn order" type="button" onclick="pressedApplyButton()">결제
                                    및 신청</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="modal--container" id="modalWrap" style="display: none;">
                <div class="modal--mask" id="modalMask">
                </div>
                <div class="modal--wrapper">
                    <div class="modal--header">
                        <p class="modal--title">쿠폰을 선택하세요</p>
                        <p class="modal--close" id="modalClose">취소</p>
                    </div>
                    <div class="modal--body">
                        <ul class="couponList">

                        </ul>
                    </div>
                    <div class="modal--bottom">
                        <div class="modal--button">
                            <span class="btn full lg" id="closeModal" style="cursor:pointer">적용하기</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	
		<script>	
		$(document).ready(function () {
			
			// 값 설정
			cal_cash()
            function cal_cash() {

                //기본
                var match_cash = parseInt('10000')
                var sum_cash = 1 * match_cash
                $("#match_cash").text(sum_cash.toLocaleString() + "원")

                $("#sum_cash").text(sum_cash.toLocaleString() + "원")
                var user_cash = 10000
                var remain_cash = user_cash - sum_cash
                var remain_cash_text = "캐시 차감 (잔여: " + remain_cash.toLocaleString() + "원)"
                if (remain_cash < 0) {
                    remain_cash_text = "캐시 차감 (캐시 부족)"
                }
                $("#remain_cash").text(remain_cash_text)
            }
			
			
            modalSubmitBtn = document.getElementById("btnApply");

         // 신청버튼 클릭 이벤트
            modalSubmitBtn.onclick = () => {
            	
            	// 체크박스 미선택시 예외처리
            	if ($("#confirmTP").is(':checked') == false) {
                    alert("환불규정 및 주의사항에 동의해주세요")
                    return
                }
                if ($("#confirmCorona").is(':checked') == false) {
                    alert("코로나19 확진자 동선 방문 및 접촉 사실 여부에 동의해주세요")
                    return
                }
                
            	console.log("pressedApplyButton!!!");
            	// 신청
            	
                $("#btnApply").prop("disabled", true);
                var match_id = 57876

                var match_time = '2021년 6월 18일 금요일 10:00'
                var match_stadium = '서초 스타 풋살장 A면'
                var match_cash =  '10,000원'
                
                console.log(match_cash);

                var infoConfirm = confirm('아래 신청 내용이 맞나요?\n\n시간: ' + match_time + '\n장소: ' + match_stadium + '\n참가비: ' + match_cash); 

                
            };

			
			// 신청버튼 클릭 이벤트
/* 			function pressedApplyButton() {
				console.log("pressedApplyButton!!!");
				
			}; */
			
		});
		
		
		</script>
		
		
		<script>
		
		const teamApp = new Vue({
			delimiters: ["[[", "]]"],
            el: "#myPlayType",
            data:{
            	isFullLoading: true
            },
			created(){
				his.fetchPlayStyle()
			},
			methods:{
				fetchPlayStyle() {
				const v = this
				v.isFullLoading = false
				}
			},
			computed:{
				
			},
			watch:{
				
			}
			
		});
		
		</script>
		
        <!-- footer -->
        <%@include file='includes/footer.jsp' %>