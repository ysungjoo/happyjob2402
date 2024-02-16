<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
>>>>>>> 45ba225372f4b960add5e991dc88b6d49f945ef8
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<<<<<<< HEAD
<title>직원정보관리</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript">
  // 직원정보관리 페이징 설정
  var pageSizeEmployeeInfo = 5;
  var pageBlockSizeEmployeeInfo = 5;

  $(document).ready(function() {
    // 직원정보관리 조회
    fListEmployeeInfo();

    // 버튼 이벤트 등록
    fRegisterButtonClickEvent();
  });

  /** 버튼 이벤트 등록 */
  function fRegisterButtonClickEvent() {
    $('a[name=btn]').click(function(e) {
      e.preventDefault();

      var btnId = $(this).attr('id');

      switch (btnId) {
      case 'btnCloseEmployeeInfo':
        gfCloseModal();
        break;
      case 'btnSearchEmployeeInfo':
        board_search();
        break;
      }
    });
  }

  /** 직원정보관리 모달 실행 */
  function fPopEmployeeInfo(loginID, name, tel, mail, detail_name, zip_code, addr, addr_detail, out_yn, entry_date) {
    // 신규 저장
    if (loginID == null || loginID == "") {
    } else {
      fSelectSubmitBtn(loginID, name, tel, mail, detail_name, zip_code, addr, addr_detail, out_yn, entry_date);
    }
  }

  /** 직원정보관리 검색 */  
  function board_search(currentPage) {
    if($("input:checkbox[name=searchUseYn]:checked").is(":checked") == false){
      var sname = $('#sname').val();
      var searchKey = document.getElementById("searchKey");
      var oname = searchKey.options[searchKey.selectedIndex].value;
      
      console.log("sname : " + sname);
      console.log("oname : " + oname);
      
      currentPage = currentPage || 1;
      console.log("currentPage : " + currentPage);
      
      var param = {
            sname : sname
            , oname : oname
            , currentPage : currentPage
            , pageSize : pageSizeEmployeeInfo
      }

      var resultCallback = function(data) {
	      fListEmployeeInfoResult(data, currentPage);
	    };
	    callAjax("/scm/employeeInfoList.do", "post", "text", true, param, resultCallback);
    } else {
      var sname = $('#sname').val();
      var searchKey = document.getElementById("searchKey");
      var oname = searchKey.options[searchKey.selectedIndex].value;
      
      console.log("sname : " + sname);
      console.log("oname : " + oname);
      
      currentPage = currentPage || 1;
      console.log("currentPage : " + currentPage);
      
      var param = {
            sname : sname
            , oname : oname
            , currentPage : currentPage
            , pageSize : pageSizeEmployeeInfo
            , showY : "Y"
      }
      
      var resultCallback = function(data) {
        fListEmployeeInfoResult(data, currentPage);
      };
      callAjax("/scm/employeeInfoList.do", "post", "text", true, param, resultCallback);
    }
    
  }
  
  /** 직원정보관리 목록 조회 */
  function fListEmployeeInfo(currentPage) {
    currentPage = currentPage || 1;

    console.log("currentPage : " + currentPage);

    var param = {
      currentPage : currentPage,
      pageSize : pageSizeEmployeeInfo
    }
    var resultCallback = function(data) {
      fListEmployeeInfoResult(data, currentPage);
    };
    //Ajax실행 방식
    //callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
    callAjax("/scm/employeeInfoList.do", "post", "text", true, param, resultCallback);
  }

  /** 직원정보관리 콜백 함수 */
  function fListEmployeeInfoResult(data, currentPage) {
    //alert(data);
    console.log("data: " + data);

    // 기존 목록 삭제
    $("#employeeInfoList").empty().append(data);

    // 총 개수 추출
    var totalCount = $("#totalCount").val();
    
    // 페이지 네비게이션 생성
    var paginationHtml = getPaginationHtml(currentPage, totalCount, pageSizeEmployeeInfo, pageBlockSizeEmployeeInfo, 'board_search');
    console.log("paginationHtml : " + paginationHtml);
    //alert(paginationHtml);
    $("#employeeInfoListPagination").empty().append(paginationHtml);

    // 현재 페이지 설정
    $("#currentPage").val(currentPage);
  }

  /** 시간 변환 함수 
    출처 : https://stackoverflow.com/questions/23593052/format-javascript-date-as-yyyy-mm-dd
  */
  function formatDate(date) {
    var d = new Date(date),
    month = '' + (d.getMonth() + 1),
    day = '' + d.getDate(),
    year = d.getFullYear();
    
    if (month.length < 2) 
    month = '0' + month;
    if (day.length < 2) 
    day = '0' + day;
    
    return [year, month, day].join('-');
  }
  
  /** 금액 변환 함수
   출처 : https://stackoverflow.com/questions/2901102/how-to-print-a-number-with-commas-as-thousands-separators-in-javascript
  */
  function numberWithCommas(x) {
	  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
  
  /** 직원정보관리 상세 화면 띄우기 */ 
  function fSelectSubmitBtn(loginID, name, tel, mail, detail_name, zip_code, addr, addr_detail, out_yn, entry_date) {

    var param = {
      loginID : loginID,
      name : name,
      tel : tel,
      mail : mail,
      detail_name : detail_name,
      zip_code : zip_code,
      addr : addr,
      addr_detail : addr_detail,
      out_yn : out_yn,
      entry_date : entry_date
    };
    
    $("#loginID").val(loginID);
    $("#name").val(name);
    $("#tel").val(tel);
    $("#mail").val(mail);
    $("#detail_name").val(detail_name);
    $("#zip_code").val(zip_code);
    $("#addr").val(addr);
    $("#addr_detail").val(addr_detail);
    $("#out_yn").val(out_yn);
    $("#entry_date").val(entry_date);
    
    var resultCallback = function(data) {
      fSelectSubmitBtnResult(data);
    };

    callAjax("/scm/selectSubmitBtn.do", "post", "json", true, param, resultCallback);
  }
  
  /** 직원정보관리 화면 콜백 함수*/
  function fSelectSubmitBtnResult(data) {
    gfModalPop("#layer1");
    console.log("fSelectSubmitBtnResult : " + JSON.stringify(data));
  }
</script>
</head>
<body>
    <form id="myForm" action="" method="">
        <input type="hidden" id="currentPage" value="1">
        <input type="hidden" name="action" id="action" value="">
        <!-- 모달 배경 -->
        <div id="mask"></div>
        <div id="wrap_area">
            <h2 class="hidden">header 영역</h2>
            <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
            <h2 class="hidden">컨텐츠 영역</h2>
            <div id="container">
                <ul>
                    <li class="lnb">
                        <!-- lnb 영역 --> <jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
                    </li>
                    <li class="contents">
                        <!-- contents -->
                        <h3 class="hidden">contents 영역</h3> <!-- content -->
                        <div class="content">
                            <p class="Location">
                                <a href="#" class="btn_set home">메인으로</a>
                                <a href="employeeinfo.do" class="btn_nav">기준정보</a>
                                <span class="btn_nav bold">직원정보 관리</span>
                                <a href="../scm/employeeinfo.do" class="btn_set refresh">새로고침</a>
                            </p>
                            <p class="conTitle">
                                <span>직원정보 관리</span>
                            </p>
                            <form class="search-container">
                                <div class="row">
                                    <!-- searchbar -->
                                    <div class="col-lg-6">
                                        <div class="input-group">
                                            <select id="searchKey" name="searchKey" style="width:90px;height:34px;">
                                               <option value="employee">직원명</option>
                                               <option value="task">담당업무</option>
                                            </select>
                                            <input type="text" id="sname" name="sname" class="form-control">
                                        </div>
                                    </div>
                                    <!-- // searchbar -->
                                    <!-- button -->
                                    <div class="btn-group" role="group" aria-label="...">
                                      <a class="btn btn-default" id="btnSearchEmployeeInfo" name="btn" href="">검색</a>
                                    </div>
                                    <!-- // button -->
                                    <!-- checkbox -->
                                    <div class="input-group" style="display:inline-block;vertical-align:middle;margin-left:10px;">
	                                    <input type="checkbox" id="searchUseYn" name="searchUseYn" onchange="javascript:board_search();">
	                                    <label for="searchUseYn" style="display:inline-block;margin-top:2px;">비활성화된 항목 표시</label>
                                    </div>
                                    <!-- // checkbox --> 
                                </div>
                                <!-- /.row -->
                            </form>
                            <div class="divEmployeeInfoList" style="margin-top:15px;">
                                <table class="col">
                                    <caption>caption</caption>
                                    <colgroup>
                                        <col width="20%">
                                        <col width="*">
                                        <col width="15%">
                                        <col width="20%">
                                        <col width="10%">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope="col">사번</th>
                                            <th scope="col">직원명</th>
                                            <th scope="col">담당업무</th>
                                            <th scope="col">연락처</th>
                                            <th scope="col">퇴직여부</th>
                                        </tr>
                                    </thead>
                                    <tbody id="employeeInfoList"></tbody>
                                </table>
                            </div>
                            <div class="paging_area" id="employeeInfoListPagination"></div>
                        </div> <!--// content -->
                        <h3 class="hidden">풋터 영역</h3> <jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
                    </li>
                </ul>
            </div>
        </div>
        <!-- 모달팝업 -->
        <div id="layer1" class="layerPop layerType2" style="width: 600px;">
            <dl>
                <dt>
                    <strong>상세정보</strong>
                </dt>
                <dd class="content">
                    <!-- s : 여기에 내용입력 -->
                    <table class="row">
                        <caption>caption</caption>
                        <colgroup>
                            <col width="120px">
                            <col width="*">
                            <col width="120px">
                            <col width="*">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th scope="row">아이디</th>
                                <td><input type="text" class="form-control" name="loginID" id="loginID" readonly="readonly"/></td>
                                <th scope="row">직원명</th>
                                <td><input type="text" class="form-control" name="name" id="name" readonly="readonly"/></td>
                            </tr>
                            <tr>
                                <th scope="row">연락처</th>
                                <td><input type="text" class="form-control" name="tel" id="tel" readonly="readonly"/></td>
                                <th scope="row">이메일</th>
                                <td><input type="text" class="form-control" name="mail" id="mail" readonly="readonly"/></td>
                            </tr>
                            <tr>
                                <th scope="row">담당업무</th>
                                <td colspan="3"><input type="text" class="form-control" name="detail_name" id="detail_name" readonly="readonly"/></td>
                            </tr>
                            <tr>
                                <th scope="row">우편번호</th>
                                <td colspan="3"><input type="text" class="form-control" name="zip_code" id="zip_code" readonly="readonly"/></td>
                            </tr>
                            <tr>
                                <th scope="row">주소</th>
                                <td colspan="3"><input type="text" class="form-control" name="addr" id="addr" readonly="readonly"/></td>
                            </tr>
                            <tr>
                                <th scope="row">상세주소</th>
                                <td colspan="3"><input type="text" class="form-control" name="addr_detail" id="addr_detail" readonly="readonly"/></td>
                            </tr>
                            <tr>
                                <th scope="row">퇴직여부</th>
                                <td><input type="text" class="form-control" name="out_yn" id="out_yn" readonly="readonly"/></td>
                                <th scope="row">가입날짜</th>
                                <td><input type="text" class="form-control" name="entry_date" id="entry_date" readonly="readonly"/></td>
                            </tr>
                        </tbody>
                    </table>
                    <!-- e : 여기에 내용입력 -->
                    <div class="btn_areaC mt30">
                        <a href="" class="btnType gray" id="btnCloseEmployeeInfo" name="btn"><span>닫기</span></a>
                    </div>
                </dd>
            </dl>
            <a href="" class="closePop"><span class="hidden">닫기</span></a>
        </div>
        <!--// 모달팝업 -->
    </form>
=======
<title>JobKorea</title>

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
</script>

<!-- 우편번호 조회 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" charset="utf-8"
src="${CTX_PATH}/js/popFindZipCode.js"></script>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<!-- seet swal import -->

<script type="text/javascript">
	var employeePageSize = 5;
	var employeeBlockPageSize = 5;
	var currentPage = 1;

	$(document).ready(function() {

		ButtonClickEvent();
		employeeSearch(currentPage);

	})

	/** 직원정보 불러오기 및 검색 */
	function employeeSearch(currentPage) {

		currentPage = currentPage || 1;

		var searchEmployeeType = $("#option").val();
		var employeeInput = $('#keyword').val();

		console.log("searchEmployeeType : " + searchEmployeeType);
		console.log("employeeInput : " + employeeInput);

		var param = {
			currentPage : currentPage,
			employeePageSize : employeePageSize,
			searchEmployeeType : searchEmployeeType,
			employeeInput : employeeInput
		};

		console.log("currentPage : " + currentPage);
		console.log("paramValue : " + param);

		var resultCallback = function(data) {
			fn_employeelistdisplay(data, currentPage);
		}

		employeeListAjax("/basic/employeeList", "post", "text", true, param,
				resultCallback);
		//callAjax("/sample/gouppcodelist.do", "post", "text", true, $("#myForm").serialize(), resultCallback);
	}

	/** 직원정보 리스트 및 페이지 매칭 */
	function fn_employeelistdisplay(data, currentPage) {
		console.log("콜백함수 실행 성공")
		console.log(data);

		//Employee List 추가
		$("#employeeList").empty().append(data);

		var totalEmployeeCount = $("#totalEmployeeCount").val();

		var paginationHtml = getPaginationHtml(currentPage, totalEmployeeCount,
				employeePageSize, employeeBlockPageSize, 'employeeSearch');
		console.log("paginationHtml : " + paginationHtml);

		$("#employeeListPagination").empty().append(paginationHtml)

		// 		var totalCustomerCount = $("#totalCustomerCount").val();

		//swal(totalCntComnGrpCod);

		// 페이지 네비게이션 생성

		// 		var paginationHtml = getPaginationHtml(curruntPage, totalCntComnGrpCod,
		// 				grouppagesize, groupblockpageSize, 'fn_groupsearch');
		// 		console.log("paginationHtml : " + paginationHtml);
		//swal(paginationHtml);
		// 		$("#comnGrpCodPagination").empty().append(paginationHtml);

	}

	function selectEmployeeDetail(id, name) {
		console.log(id);
		console.log(name);

		var param = {
			employee_id : id,
			employee_name : name
		}

		var resultCallback = function(data) {
			employeeDetailShow(data);
		}

		employeeListAjax("/basic/selectEmployeeDetail", "post", "json", true,
				param, resultCallback);
	}

	function employeeDetailShow(data) {
		console.log(data);
		
		$("#employee_userType").val(data.selectEmployeeDetail.employee_type);
		$("#employee_userId").val(data.selectEmployeeDetail.employee_id);
		$("#employee_name").val(data.selectEmployeeDetail.employee_name);
		$("#employee_phoneNumber").val(data.selectEmployeeDetail.phone_number);
		$("#employee_email").val(data.selectEmployeeDetail.email);
		$("#zip_code").val(data.selectEmployeeDetail.post_code);
		$("#addr").val(data.selectEmployeeDetail.user_address);
		$("#addr_detail").val(data.selectEmployeeDetail.user_address_detail);
		
		gfModalPop("#layer2");
	}
	
	//직원 정보 수정
	function updateEmployeeInfo() {
		console.log('update Button Test');
		
		var employee_type = $("#employee_userType").val();
		var employee_id = $("#employee_userId").val();
		var employee_name = $("#employee_name").val(); 
		var phoneNumber = $("#employee_phoneNumber").val();
		var email = $("#employee_email").val();
		var zip_code = $("#zip_code").val();
		var address = $("#addr").val();
		var address_detail = $("#addr_detail").val();
		
		var param = {
				
				employee_type : employee_type,
				employee_id : employee_id,
				employee_name : employee_name,
				phoneNumber : phoneNumber,
				email : email,
				zipCode : zip_code,
				address : address,
				addressDetail : address_detail
		}
		
		console.log(param);
		
		var resultCallback = function(data) {
			alert(data.resultMessage);
		}
		
		employeeListAjax("/basic/updateEmployeeInfo", "post", "json", true, param, resultCallback);
	}
	
	//직원 정보 삭제
	function deleteEmployeeInfo() {
		console.log('delete Button Test');
		var employeeId = $("#employee_userId").val();
		var employeeName = $("#employee_name").val();
		
		var param = {
				employeeId : employeeId,
				employeeName : employeeName
		}
		
		console.log(param);
		
		var resultCallback = function(data) {
			alert(data.resultMessage);
		}
		
		employeeListAjax("/basic/deleteEmployeeInfo", "post", "json", true, param, resultCallback);
	}

	//버튼 이벤트 등록
	function ButtonClickEvent() {
		$('button[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
			case 'employeeSearch_button':
				console.log('search_btton test');

				employeeSearch(currentPage);
				break;
			}

		})
	}

	/** 직원정보 리스트 Ajax */
	function employeeListAjax(url, method, dataType, async, param, callback) {
		$.ajax({
			url : url,
			type : method,
			dataType : dataType,
			async : async,
			data : param,
			success : function(data) {
				callback(data);
			},
			error : function(xhr, status, err) {
				console.log("xhr : " + xhr);
				console.log("status : " + status);
				console.log("err : " + err);
				alert("에러발생")
			}
		})
	}
	
	// 우편번호 api
	function execDaumPostcode(q) {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zip_code').value = data.zonecode;
				document.getElementById("addr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addr_detail").focus();
			}
		}).open({
			q : q
		});
	}
	
</script>

	<style>
	.btn-group {
		margin-bottom: 15px;
	}
	</style>
	
</head>

<body>
	<form id="myForm" action="" method="">
		<input type="hidden" id="currentPageCod" value="1"> <input
			type="hidden" id="currentPageComnDtlCod" value="1"> <input
			type="hidden" id="tmpGrpCod" value=""> <input type="hidden"
			id="tmpGrpCodNm" value=""> <input type="hidden" name="action"
			id="action" value="">
		<!-- 모달 배경 -->
		<div id="mask"></div>
		<div id="wrap_area">
			<h2 class="hidden">header 영역</h2>
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
			<h2 class="hidden">컨텐츠 영역</h2>
			<div id="container">
				<ul>
					<li class="lnb">
						<!-- lnb 영역 --> <jsp:include
							page="/WEB-INF/view/common/lnbMenu2.jsp"></jsp:include> <!--// lnb 영역 -->
					</li>
					<li class="contents">
						<!-- contents -->
						<h3 class="hidden">contents 영역</h3> <!-- content -->
						<div class="content">
							<p class="Location">
								<a href="#" class="btn_set home">메인으로</a><span
									class="btn_nav bold">직원정보 관리</span> <a
									href="javascript:window.location.reload();"
									class="btn_set refresh">새로고침</a>
							</p>
							<p class="conTitle">
								<span>직원정보 관리</span>
							</p>
							<form class="search-container">
								<div class="row">
									<!-- searchbar -->
									<div class="col-lg-6">
										<div class="input-group">
											<select style="width: 90px; height: 34px;" id="option"
												name="search_value">
												<option selected>전체</option>
												<option value="employee_id" id="title">아이디</option>
												<option value="employee_name" id="content">직원명</option>
											</select>
											<!-- // searchbar -->
											<input type="text" class="form-control" aria-label="..."
												id="keyword" autocomplete="off">
										</div>
									</div>

									<!-- button -->
									<div class="btn-group" role="group" aria-label="...">
										<button type="button" class="btn btn-default"
											id="employeeSearch_button" name="btn">검색</button>
									</div>
									<!-- // button -->

									<div class="divEmployeeList">
										<!-- divComGrpCodList -->
										<table class="col">
											<caption>caption</caption>
											<colgroup>
												<col width="10%">
												<col width="30%">
												<col width="30%">
												<col width="30%">

											</colgroup>
											<thead>
												<tr>
													<th scope="col">구분</th>
													<th scope="col">아이디</th>
													<th scope="col">직원명</th>
													<th scope="col">연락처</th>
												</tr>
											</thead>
											<tbody id="employeeList">
											</tbody>
											<!-- listComnGrpCode -->
										</table>
									</div>
									<div class="paging_area" id="employeeListPagination"></div>
									<!-- <div class="paging_area" id="customerPagination"></div> -->
									<!-- comnGrpCodPagination -->
								</div>
								<!-- /.row -->
							</form>
						</div>
						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>
		<div id="layer2" class="layerPop layerType2" style="width: 600px;">
			<div id="vueedittable">
				<dl>
					<dt>
						<strong>직원 정보 관리</strong>
					</dt>
					<dd class="content">

						<!-- s : 여기에 내용입력 -->

						<table class="row">
							<caption>caption</caption>
							<colgroup>
								<col width="120px">
								<col width="*">
								<col width="120px">
								<col width="*">
							</colgroup>

							<tbody>
								<tr>
									<th scope="row">구분 <span class="font_red">*</span></th>
									<td><input type="text" class="inputTxt p100"
										id="employee_userType" name="employee_userType"/></td>
										
									<th scope="row">직원 아이디 <span class="font_red">*</span></th>
									<td><input type="text" class="inputTxt p100"
										id="employee_userId" name="employee_userId" readonly/></td>
								</tr>
								<tr>
									<th scope="row">직원명 <span class="font_red">*</span></th>
									<td><input type="text" class="inputTxt p100" id="employee_name"
										name="employee_name"/></td>
									<th scope="row">연락처 <span class="font_red">*</span></th>
									<td><input type="text" class="inputTxt p100"
										id="employee_phoneNumber" name="employee_phoneNumber"/></td>
								</tr>
								
								<tr>
									<th scope="row">이메일 </th>
									<td><input type="text" class="inputTxt p100"
										id="employee_email" name="employee_email"/></td>
								</tr>
								
								<tr>
									<th scope="row">우편번호</th>
									<td colspan="2"><input type="text" class="inputTxt p100"
									name="zip_code" id="zip_code" /></td>
									<td><input type="button" value="우편번호 찾기"
									onclick="execDaumPostcode()" style="width: 130px; height: 20px" />
									</td>
								</tr>
								
								<tr>
									<th scope="row">주소</th>
									<td colspan="3"><input type="text" class="inputTxt p100"
									name="addr" id="addr" /></td>
								</tr>
								
								<tr>
									<th scope="row">상세주소</th>
									<td colspan="3"><input type="text" class="inputTxt p100"
									name="addr_detail" id="addr_detail" /></td>
								</tr>
								
								<!-- 
								<tr>
									<th scope="row">사용 유무 <span class="font_red">*</span></th>
									<td colspan="3"><input type="radio" id="dtl_use_poa"
										name="dtl_use_poa" value="Y" v-model="dtl_use_poa" /> <label
										for="radio1-1">사용</label> &nbsp;&nbsp;&nbsp;&nbsp; <input
										type="radio" id="dtl_use_poa" name="dtl_use_poa" value="N"
										v-model="dtl_use_poa" /> <label for="radio1-2">미사용</label></td>
								</tr>
								 -->
							</tbody>
						</table>

						<!-- e : 여기에 내용입력 -->

						<div class="btn_areaC mt30">
							<input type="hidden" name="Actiondetail" id="Actiondetail" value="#"> 
								<a href="" class="btnType blue"
								id="btnSaveDtlCod" onClick="updateEmployeeInfo()" name="btn"><span>수정</span></a>
							<a href="" class="btnType blue" id="btnDeleteDtlCod"
								onClick="deleteEmployeeInfo()" name="btn"><span>삭제</span></a> 
								<a href="" class="btnType gray" id="btnCloseDtlCod" name="btn"><span>취소</span></a>
						</div>
					</dd>
				</dl>
				<a href="" class="closePop"><span class="hidden">닫기</span></a>
			</div>
		</div>
	</form>
>>>>>>> 45ba225372f4b960add5e991dc88b6d49f945ef8
</body>
</html>