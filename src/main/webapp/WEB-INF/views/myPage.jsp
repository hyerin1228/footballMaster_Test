<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
        <script src="https://cdn.jsdelivr.net/npm/vue@2.6.8/dist/vue.js"></script>
    <style>
            /* 설정 */
/* my page start*/

        /* body hero */
        #myPage{
            width: 100%;
            margin: 0 auto;
            background: wheat;
        }
        .my--hero{
            clear: both;
            margin: 0 auto;
            max-width: 1024px;
            padding: 0 0px;
            background: white;
        }
        .my--hero--hi{
            display: block;
            font-size: 1.5em;
            margin-block-start: 0.83em;
            margin-block-end: 0.83em;
            margin-inline-start: 0px;
            margin-inline-start: 0px;
        }
       .my--hero--cash{
            padding-bottom: 20px;
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
            padding
            align-items: center;
        }
        .button{
            width: 100%;
            background-color: blue;
            border-radius: 6px;
            border: none;
            box-shadow: none;
            transition: background-color 0.3 ease-out;
            display: block;
            text-align: center;
            cursor: pointer;
        }
        
        .my--hero--status{
            
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .my--hero--status .my--fair-point > div {
			display: flex;
			align-items: center;
			cursor: pointer;
		}
		.my--hero--status .my--fair-point > div img {
			margin-right: 5px;
		}
		.my--hero--status .my--fair-point span {
			font-size: 10px;
			color: #999;
			word-break: keep-all;
			display: block;
			margin-top: 10px;
		}
		.my--hero--status .my--fair-point h3 {
			border-bottom: 1px dashed #999;
		
		}
		.my--hero--status .my--fair-point > div {
		    display: flex;
		    align-items: center;
		    cursor: pointer;
		}
       /* my-hero end */

       /* my page */
    
       @media (min-width: 1024px) {
        .wapper{
               max-width: 1024px;
               margin: 0 auto;
           }
           }
        .card-container{
           padding: 30px;
           background: white;
           margin-bottom: 20px; 
           
        }
        .header{
            padding: 30px 20px 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .title{
            display: flex;
            align-items: center;
        }
        .card-more{
            font-size: 12px;
        }
        /**
        .card-body{
            padding: 20px;
        }
        **/
        .my-menu-title{
            padding: 10px 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        /* my page */
</style>
    <!--body start-->

 <!-- MY hero -->
    <div id="myPage">
    <%@include file='includes/header.jsp' %>
        <div class="my--hero">
            <div class="my--hero--hi">
            <h2>안녕하세요<br><strong id="userName">${output.name}</strong></h2>
            </div>
                <div class="my--hero--cash">
                    <div class="my--cash">
                        <p>나의 캐시 잔액</p><h3 id="userBalance">금액</h3>
                    </div>
                    <div class="btn-right">
                    	<img src="http://localhost:8080/footballMaster/assets/img/icon/ic_charge.svg">
                        <a href="http://localhost:8080/footballMaster/mypage/cash/charge">
                            <button class="button"> 캐시충전</button></a>
                   </div>
                </div>
              <div class="my--hero--status" style="padding-bottom: 20px;" >
                <div class="my--fair--point">
                    <p>페어포인트</p>
                    <div style="float:left;">
                		<img src="http://localhost:8080/footballMaster/assets/img/icon/ic_fair_nice.svg">
                    </div>
                    <div style="float:left;">
                		<h3 id="UserFairPonint">100</h3>
                    </div>
                </div>
              </div>    
        </div>
        
    
<!-- MY hero end-->

   <!-- my page -->
        <div class="wapper">
            <div class="card-container">
                <div class="header">
                    <div class="title">
                        <p>나의경기</p>
                    </div>
                    <div class="card-more">
                        <a href="전체보기">전체보기
                        </a>
                    </div>
                </div>
                    <div class="card-body">
                        <div class="card-content">
                            <div class="my-history">
                                <ul></ul>
                            </div>
                        </div>
                    </div>
            
        </div>
        <div class="card-container">
            <div class="card-body">
                <div class="card-menu">
                    <ul>
                    <li class="my-menu-title"><a href="충전내역">충전내역-x피그마 레이아웃-위로옮겨야됨</a></li>
                    <li><a href="http://localhost:8080/footballMaster/mypage/change"><div class="my-menu-title"><p>회원정보수정-o피그마 레이아웃-위로옮겨야됨</p></div></a></li>
                    <li id="logout"><a href="logout"><div class="my-menu-title"><p>로그아웃-(ox)피그마 레이아웃-위로옮겨야됨</p></div></a></li>
                    </ul>
                </div>
            </div>
        
    </div>
    </div>
     <!-- footer -->
            <%@include file='includes/footer.jsp' %>
    </div>
    <!-- my page -->
    
<script type="text/javascript">
		
	var result = "";
	// 유저 이름 태그 정보 가져오기
	var userNameTag = document.getElementById("userName");	// 이름
	var userBalanceTag = document.getElementById("userBalance");  // 캐시 보유액
	var userFairPonintTag = document.getElementById("UserFairPonint");  // 페어포인트
	
    $.ajax({
      beforeSend: function (request)
        {
            request.setRequestHeader("accessToken", getCookie("accessToken"));
        },
	  dataType: "json",
      url: "http://localhost:8081/footballMaster/my",
      method : 'GET',
      contentType : 'application/json; charset=UTF-8',
      dataType : 'json',
      success: function(result) {
    	// data = email에 해당하는 유저정보

        console.log(result);
        console.log("유저이름:" + result.name +", 캐시:" + result.balance + ", 페어포인트:" + result.fair_point);
        // 유저에 해당하는 내용 적용시키기(이름,캐시보유액)
        userNameTag.innerText = result.name;
        userBalanceTag.innerText = result.balance;
        userFairPonintTag.innerText = result.fair_point;
      },
      error:function(request, status, error){ console.log("실패");
      }
    });
      
      
      
    
</script>


    
           