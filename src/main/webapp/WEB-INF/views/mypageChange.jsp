<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@include file='includes/header.jsp' %>
    
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.8/dist/vue.js"></script>
    <style>
            /* 설정 */
        .content{
            margin: 0 auto;
            background: white;
        }

        .contentWapper_acc{
            padding: 0 20px;
            max-width: 1024px;
            margin: 0 auto;
            overflow: auto;
        }
        @media only screen and (min-width: 1024px){
            .inner{
                max-width: 480px;
                margin: 0 auto;
                margin: 50px;
            }
        }
        .headmMessage{
            margin-bottom: 30px;
            margin-top: 20px;
        }
        .headmMessage h2{
            font-weight: 300;
            font-size: 32px;
        }
        
        input{
            padding: 15px 10px;
            border-radius: 6px;
            border: 1px solid #ddd;
            box-shadow: none;
            outline: none;
            background-color: #fafafa;
            appearance: none;
            font-size: 16px;
            color: #333333;
            -webkit-writing-mode: horizontal-tb !important;
    text-rendering: auto;
    letter-spacing: normal;
    word-spacing: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    text-align: start;
    -webkit-rtl-ordering: logical;
    margin: 0em;
    font: 400 13.3333px Arial;
   
        }
    .inputDWrap {
    overflow: auto;
    margin: 5px 0;
    display: inline-block;
    width: 100 }
 
    .inputWrap50:first-child {
    margin-right: 1%;
    }

    .inputWrap50 {
    width: 49%;
    float: left;
    }
    @media only screen and (min-width: 1024px){
    form label {
    display: inherit;}
    }
    form label {
    font-size: 11px;
    text-align: left;
    display: block;
    margin: 10px 0 3px 5px;
    }
    input.inputFull, select.inputFull {
    width: 100%;
    }
    input[type=text], input[type=password], textarea, select {
    -webkit-transition: all 0.30s ease-in-out; 
    outline: none;
}
select {
    margin: 0;
    padding: 15px 10px;
    border-radius: 6px;
    border: 1px solid #ddd;
    box-shadow: none;
    outline: none;
    color: #333333;
    background-color: #fafafa;
    font-size: 16px;
    appearance: none;
    box-sizing: border-box;
    }

    .option {
    font-weight: normal;
    display: block;
    white-space: nowrap;
    min-height: 1.2em;
    padding: 0px 2px 1px;
    }
    .inputwrap{
        margin: 5px 0;
    width: 100%;
    overflow: auto;
    }
    .btn_submit {
    background-color: #3540A5;
    width: 100%;
    font-size: 18px;
    line-height: 18px;
    margin: 20px auto;
}
.btn {
    color: white;
    border-radius: 6px;
    border: none;
    box-shadow: none;
    padding: 15px 10px;
    margin-top: 0 20px;
}
/* 설정 */

</style>
    
    <div class="content">
    <div class="contentWapper_acc">
        <div class="inner">
            <div class="headmMessage">
                <h2>1000rudxo@naver.com</h2>
            </div>
            <form method="POST" action="file:///C:/mypage/change/profile" onsubmit="return checkSex()">
              <input type="hidden" name="csrfmiddlewaretoken" value="9tokaY1isfHdv">
              <fieldset>
                  <div class="inputDWrap">
<!--                   <div class="inputDWrap50"> -->
                      <label>이름</label>
                        <input type="text" name="name" value="천경태" placeholder="이름" class="inputFULL" required="" id="id_name">
                  <div class="inputDWrap50">
                      <label>성별</label>
                        <select name="sex" class="inputFull" id="sex">
                            <option value="0">성별선택</option>
                            <option value="1" selected="">남성</option>
                            <option value="-1">여성</option>
                        </select>
                    </div>      
                </div>
                  <div class="inputwrap">
                    <label>휴대폰 번호</label>
                        <input type="text" name="phone" value="010-5325-2619" placeholder="휴대폰 번호" required="" id="id_phone">
                  
                  <p>"매치 참여시 본인 확인 및 참여 안내록을 보내드립니다."<br>
                  "이름과 휴대폰 번호를 꼭 바르게 적어주세요!"</p>
                  <div class="inputwrap">
                      <label>환불 계좌 은행</label>
                        <select name="bank_cd" id="id_bank_cd">
                            <option value="기업">은행이름</option>
                        </select>
                    </div>
                  <div class="inputwrap">
                      <label>환불 계좌 번호</label>
                      <input type="text" name="bank_no" maxlength="45" id="id_bank_no" style="
    padding-right: 267px;
">
                  <div class="inputwrap">
                      <label>환불 계좌 예금주</label>
                      <input type="text" name="bank_owner" maxlength="35" id="id_bank_owner">
                  </div>
              </div></div></div></fieldset>
                  <div class="btnwrap">
                      <button type="submit" id="btn_submit" class="btn_submit" style="padding-top: 8px;padding-bottom: 8px;">
                      	저장하기</button>
                  </div>
            </form>
        </div>
    </div> 
</div>

<script>	
$(document).ready(function () {
	
	// 회원정보수정 저장하기 버튼 클릭이벤트
    modalSubmitBtn = document.getElementById("btn_submit");

 	// 회원정보수정 저장하기 버튼 클릭이벤트
    modalSubmitBtn.onclick = () => {
    	
    	// 입력값없을시 예외처리
/*     	if ($("#confirmTP").is(':checked') == false) {
            alert("환불규정 및 주의사항에 동의해주세요")
            return
}
*/

    	console.log("btn_submit!!!");
    	// 신청
    	
    	var frm = new FormData();
    	
    	// 이름 / 성별 / 휴대폰번호 / 환불계좌은행 / 환불계좌번호 / 환불계좌예금주
    	var frmName = document.getElementsByName("name")[0].value;
		// 성별 - 1:남자 / 2:여자    	
    	var frmSex = document.getElementsByName("sex")[0].selectedIndex;
    	var frmPhone = document.getElementsByName("phone")[0].value;
    	var frmBank_cd = document.getElementsByName("bank_cd")[0].value;
    	var frmBank_no = document.getElementsByName("bank_no")[0].value;
    	var frmBank_owner = document.getElementsByName("bank_owner")[0].value;
		
    	// 폼데이터에 추가
    	frm.append("name", frmName);
    	frm.append("sex", frmSex);
    	frm.append("phone", frmPhone);
    	frm.append("bank_cd", frmBank_cd);
    	frm.append("bank_no", frmBank_no);
    	frm.append("bank_owner", frmBank_owner);
    	
    	
    	let data = {
    			"name" : frmName,
    			"sex" : frmSex,
    			"phone" : frmPhone,
    			"bank_cd" : frmBank_cd,
    			"bank_no" : frmBank_no,
    			"bank_owner" : frmBank_owner
    		}
    	axios.post("http://localhost:8080/footballMaster/mypageChangeTest", JSON.stringify(data), {
    		headers: {
    			"Content-Type": 'application/json',
    		},
    	})
    	.then(function(res){
    		console.log(res);
    	});
    	
/*     	console.log(frmName)
    	console.log(frmSex)
    	console.log(frmPhone)
    	console.log(frmBank_cd)
    	console.log(frmBank_no)
    	console.log(frmBank_owner) */
    	
    	
/*     	axios.post('', frm, {
    		headers: {
    			'Content-Type': 'multipart/form-data'
    		}
    	})
    	.then((response)=>{
    		// 응답처리
    	})
    	.catch((error)=>{
    		// 예외처리
    	}) 
    	
    	이미지, 영상

=> data: 파일자체, header: Content-Type": `multipart/form-data

 

json텍스트

=> data:  JSON.stringify(data), header: Content-Type": `application/json
    	
    	*
    	/
    	
    	
    };

	
	// 신청버튼 클릭 이벤트
/* 			function pressedApplyButton() {
		console.log("pressedApplyButton!!!");
		
	}; */
	};
});

</script>  
            <!-- footer -->
            <%@include file='includes/footer.jsp' %>