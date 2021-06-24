<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">


        <!-- Anti-flicker snippet (recommended)  -->
        <style>
            .async-hide {
                opacity: 0 !important
            }
        </style>
        <script>(function (a, s, y, n, c, h, i, d, e) {
                s.className += ' ' + y; h.start = 1 * new Date;
                h.end = i = function () { s.className = s.className.replace(RegExp(' ?' + y), '') };
                (a[n] = a[n] || []).hide = h; setTimeout(function () { i(); h.end = null }, c); h.timeout = c;
            })(window, document.documentElement, 'async-hide', 'dataLayer', 500,
                { 'UA-125313896-1': true });</script>
        <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-125313896-1"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag() { dataLayer.push(arguments); }
            gtag('js', new Date());

            gtag('config', 'UA-125313896-1', { 'optimize_id': 'GTM-MMP575T' });
            gtag('config', 'AW-789531225');
        </script>
        <!-- End Google Analytics -->
        
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
            integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-2.2.4.min.js"
            integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>

        <!-- modal -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
		<!-- crossOrigin js -->
		<script type="text/javascript" src="http://localhost:8080/footballMaster/assets/js/jquery.ajax-cross-origin.min.js"></script>
	

        <!-- 메인배너 슬라이더 -->
        <!-- css -->
        <link rel="stylesheet" type="text/css" href="http://localhost:8080/footballMaster/assets/css/styles1.css">
        <link rel="stylesheet" type="text/css" href="http://localhost:8080/footballMaster/assets/css/styles1623313680.css">
        <script type="text/javascript" src="http://localhost:8080/footballMaster/assets/js/moment.js"></script>
        <script type="text/javascript" src="http://localhost:8080/footballMaster/assets/js/moment-with-locales.js"></script>
        <!-- axios -->
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <!-- slick -->
        <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
        <!-- <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
	
        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date(); a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
            ga('create', 'UA-146052-10', 'getbootstrap.com');
            ga('set', 'anonymizeIp', true);
            ga('send', 'pageview');
        </script>

        <!-- csrf_token -->
        <script type="text/javascript">
            var csrf_token = '9MoTfHHU4O3OUhUXN62nSUtj40tH8sIirOuyJwViBgv7Y94lWDOQBAfUAiIfBJR4'
            var config = {
                headers: {
                    'X-CSRFToken': csrf_token,
                    'Authorization': 'pak 80fee2d601a980c5ac899af2ec47a9719c46bf7cfbfb98ba90d7b667f3e4dd58'
                }
            };
        </script>


    </head>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>

    <body>
        <div class="container" id="plabContainer">
            <div class="navbar" id="navbar-main">
                <div class="navContainer home">
                    <div class="newLogo" style="float:left;">
                        <a href="http://localhost:8080/footballMaster/matches"><img src="https://plab-football.s3.amazonaws.com/static/img/logo.svg"
                                alt="플랩풋볼"></a>
                    </div>
                    <div class="top--menu" id="userMenu" style="float:right;">
                    	<div class="mainTab">
	                        <div class="goIn">
	                            <a id="loginModalBtn">로그인</a>
	                            <span>또는</span>
	                            <a id="loginModalBtn">회원가입</a>
	                        </div>
                    	</div>

                        <div id="sidebar-main-trigger" class="icon">
                            <a href="http://localhost:8080/footballMaster/mypage">
                            	<img src="http://localhost:8080/footballMaster/assets/img/icon/ic_my.svg"></a>
<!--                             <div class="moreIconWrap">
                                 <div class="moreIcon">
                                	</div>
                            </div> -->
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <div id="modalLoginOpen" class="modal">
            <div class="modalContent registModal">
                <div class="modalMsg">
                    <h2>풋살하고 싶을 땐 <strong>플랩풋볼</strong></h2>
                </div>
                <div class="modalBtnWrap">
                            <div id="naverIdLogin"></div>
                </div>
            </div>
        </div>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript">

//login modal 열기
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

  	var naverLogin = new naver.LoginWithNaverId(
  			{
  				clientId: "fVWpyHFN5yLxAUXa4chY",
  				callbackUrl: "http://localhost:8080/footballMaster/naver_callback",
  				isPopup: false, /* 팝업을 통한 연동처리 여부 */
  				loginButton: {color: "green", type: 3, height:85} /* 로그인 버튼의 타입을 지정 */
  			}
  		);
  		
  	/* 설정정보를 초기화하고 연동을 준비 */
  	naverLogin.init();
  	
  	var getCookie = function(name) {
        var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
        return value? value[2] : null;
    };
</script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        
