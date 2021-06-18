<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file='includes/header.jsp' %>
    
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.8/dist/vue.js"></script>
    <style>
            /* 설정 */
            /* start */
.content{
    margin: 0 auto;
    background: white;
}

@media only screen and(min-width: 1024px){}
.contentwrapper-w480{
    max-width: 480px;
    margin: 0 auto;
    padding-bottom: 0;
}
}
.hwrap-charge{
    padding: 20px;
}
.headmessage{
    margin-bottom: 20px;
    margin-top: 20px;
}
.mycash{
    overflow: auto;
}
.cardlabel{
    font-size: 12px;
    color: #96bffc;
    margin-bottom: 5px;
}
.cardvalue{
    font-size: 16px;
    font-weight: 300;
    vertical-align: middle;
}
.match-detail_notice-corona19-shower{
    background: #eee;
    font-size: 13px;
    padding: 20px;
    border-radius: 20px;
}
.match-detail_notice p{
    font-size: 12px;
    word-break: break-all;
}
.chargeSelectwrap{
    background: #3540a5;
    padding: 30px 20px;
    text-align: center;
}
.cashSelect{
    margin-bottom: 20px;
}
.cashSelect label{
    color: white;
    padding-left: 6px;
    display: block;
    opacity: 0.5;
    font-size: 12px;
    margin-bottom: 6px;
    text-align: left;
}
.chargeBtn {
    width: 100%;
    text-align: center;
}
input{
    padding: 15px 10px;
    border: 1px solid #ddd;
    box-shadow: none;
    background-color: #fafafa;
    appearance: none;
    font-size: 16px;
    color: #333333;
    
}
.charging{
            padding: 0 20px;
            height: 56px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: white;
        }


.selected_item_price span::after , .selected_item_price span::before {
    position: absolute;
    font-size: 12px;
    color: #3540A5;
    font-weight: 400;
    top: 23px;
}

.selected_item_price span::before{
    content: 충전금액;
    left: 10px auto;
}

.selected_item_price span::after{
    content: 변경;
    right: 10px auto;
}
.cardlabel{
    font-size: 12px;
    color: #96bffc;
    margin-bottom: 5px;
}

.chargeBtn.wback span {
    border: 1px solid #3540A5;
    background-color: #fafafa;
}
.chargeBtn span {
    background-color: white;
    color: #3540A5;
    font-weight: 700;
    display: block;
    padding: 20px;
    border-radius: 10px;
    margin: 0 auto;
    font-size: 18px;
    position: relative;
}

.cashSelect p{
    text-align: center;
    margin-top: 10px;
    font-size: 14px;
    color: rgba(255, 255, 255, 0.5);
}
.cashSelect p strong{
    color: #ffc645;
    font-weight: 400;
    display: block;
}
.btnwrap{
    margin-top: 20px;
}
.btn-halfsubmit{
    background-color: #ffc645;
    color: #3450A5;
    width: 50%;
    font-size: 18px;
    line-height: 18px;
    margin: 0px auto;
    border-radius: 100px;
}
.btn {
    border: none;
    box-shadow: none;
    padding: 15px 10px;
    transition: background-color 0.3s ease-out;
    -webkkit-appearance:none;
    display: block;
    text-align: center;
    cursor: pointer;
}

/* end */

</style>
        <!-- start -->
<div class="content">
    <div class="contentwrapper-w480">
        <div class="hmwrap-charge">
            <div class="headmessage">
                <h2 style="font-weight: 300; font-size: 32px;">"미리충전하고"<br>"더욱편리하게!"</h2>
            </div>
            <div class="mycash">
                <div class="cvwrap">
                    <span class="cardlabel">나의 캐시 잔액</span>
                    <p class="cardvalue">0원</p>
                </div>
                <div class>
                    <strong style="front-size: 12px"></strong>
                </div>
                <div class="match-detail_notice-corona19-shower" style="margin: 10px 0;">
                <h3 style="margin-bottom: 10px; font-size: 14px;">1인 신청안내</h3>
                <p style="ing: 0;">"코로나19 확산에 따른 모든 참가자의 구장 방문 파악을 위해 8월 24일부터 "</p>
                <strong style="background-color: #ffc645;">1인 신청 안내</strong>"합니다. 충전 시 참고해 주세요."
                </div>
            </div>
        </div>
            <div class="chargeSelectwrap">
                <div class="cashSelect">
                    <label>충전할 금액을 선택하세요</label>
                    <div class="chargeBtn wback" id="chargeselect" style="cursor:pointer">
                        <input id="selected_item_id" type="hidden" value="37">
                        <div class="charging">
                        <div class="charging_coin">충전금액</div>
                        <div class="coin">30000원</div>
                        <div class="charging_coin_change">변경</div>
                        </div>
                    </div>
                </div>
                    <div class="cashSelect">
                        <label>입금자명</label>
                        <input id="depositor" type="text" name="name"placeholder="입금자 이름" value>
                            <p>
                                <strong>위에 입력한 입금자명으로 정확한 금액을 입금해주세요</strong>
                                <br>"현재는 무통장 입금만 가능합니다."
                            </p>
                    </div>
                        <div class="btnwrap" onclick="pressedsubmit()" style="cursor: pointer;">
                        <div class="btn-halfsubmit">충전 신청</div>
                        </div>
            </div>
          <div class="modal--container" style="display: none;" id="modalwrap">
            <div class="modal--mask" id="modamask"></div>
            <div class="modal--wrapper">
                <div class="modal--header">
                    <p class="modal--title">충전할 금액을 선택하세요</p>
                </div>
                <div class="modal--body">
                    <ul class="chargeList">
                        <li class="cashItem" onclick="pressedCashItem(2, '2,000원')">2000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(3, '5,000원')">5,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(4, '8,000원')">8,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(21, '9,000원')">9,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(5, '10,000원')">10,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(14, '20,000원')">20,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(8, '30,000원')">30,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(9, '50,000원')">50,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(36, '80,000원')">80,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(37, '90,000원')">90,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(10, '100,000원')">100,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(38, '120,000원')">120,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(39, '130,000원')">130,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(40, '140,000원')">140,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(35, '200,000원')">200,000원
                        </li>
                        <li class="cashItem" onclick="pressedCashItem(16, '500,000원')">500.000원
                        </li>
                        
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- end -->

    
            <!-- footer -->
            <%@include file='includes/footer.jsp' %>