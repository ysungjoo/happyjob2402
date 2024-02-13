<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
  /** OnLoad event */
  $(function() {
    //fSelectMngrWorkStat();
  });

  /* 
  function fSelectMngrWorkStat() {
  	
  	if ("${sessionScope.ofcDvsCod}" != "M") return;
  	
  	var resultCallback = function(data) {
  		fSelectMngrWorkStatResult(data);
  	};
  	
  	callAjax("/dashboard/selectMngrWorkStat.do", "post", "json", true, "", resultCallback);
  }
  
  function fSelectMngrWorkStatResult(data) {
  	
  	if (data.result == "SUCCESS") {
  		
  		var model = data.selectMngrWorkStat;
  		$("#B_CNT").text(model.B_CNT);
  		$("#B_ALM_CNT").text(model.B_ALM_CNT);
  		$("#D_CNT").text(model.D_CNT);
  		$("#D_ALM_CNT").text(model.D_ALM_CNT);
  		$("#M_CNT").text(model.M_CNT);
  		$("#M_ALM_CNT").text(model.M_ALM_CNT);
  	} else {
  		alert(data.resultMsg);
  	}	
  	
  }
   */
</script>
<h3 class="hidden">lnb 영역</h3>
<div id="lnb_area">
	<div class="logo">
		<div id="header">
			<a class="logo" href="/system/notice.do"> <img src="/images/admin/comm/chainLogoV2.png" alt="메인페이지" width="80%" height="55px" /></a>
		</div>
	</div>
	<div class="login">
		<img src="/images/admin/comm/left_myImg.jpg" class="LoginImg" alt="사진" /> <span class="LoginName">${sessionScope.userName}</span>
		<div class="btn_loginArea">
			<a href="#" onclick="fLogOut();" class="logout">LOGOUT</a>
		</div>
	</div>
	<ul class="lnbMenu">
		<!-- 0depth 메뉴 목록 가져와서 forEach로 각 메뉴에 대한 정보를 'list' 변수에 할당 -->
		<c:forEach items="${sessionScope.userMenuList}" var="list">
			<li>
				<dl>
					<dt>
						<!-- 각 list에 들어있는 코드번호는 class에 넣고 메뉴 이름 출력 -->
						<a class="lnbBtn ${list.menu_icon_code}" href="#">${list.menu_name}</a>
					</dt>
					<dd>
						<!-- 0depth 메뉴목록이 가지고 있는 1depth 메뉴 목록을 출력, 각 하위메뉴를 i 라는 변수에 할당 -->
						<c:forEach items="${list.childList}" var="i">
							<c:set var="urls" value="${fn:split(i.menu_url, '/')}" />
							<c:choose>
								<c:when test="${fn:indexOf(urls[fn:length(urls)-1], '=') > -1}">
									<c:set var="url" value="${fn:split(urls[fn:length(urls)-1], '=')}" />
									<a href="${i.menu_url}" id="lnb_${url[fn:length(url)-1]}">- ${i.menu_name}</a>
								</c:when>
								<c:otherwise>
									<c:set var="url" value="${fn:split(urls[fn:length(urls)-1], '.')}" />
									<a href="${i.menu_url}" id="lnb_${url[0]}">- ${i.menu_name}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</dd>
				</dl>
			</li>
		</c:forEach>
	</ul>
	<div style="clear: both;"></div>
</div>
