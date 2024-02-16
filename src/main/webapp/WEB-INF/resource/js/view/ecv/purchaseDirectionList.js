// 발주지시서 목록 페이징 설정
var pageSizeOrderList = 10;
var pageBlockSizeOrderList = 10;

$(document).ready(function() {
  // 일일 수주 조회
  getPurchaseDirectionList();
  
});

/** 발주지시서 내역 조회 */
function getPurchaseDirectionList(currentPage) {
  
  currentPage = currentPage || 1;

  console.log("currentPage : " + currentPage);

  var param = {
    currentPage: currentPage, 
    pageSize: pageSizeOrderList
  };

  var resultCallback = function(data) {
    getPurchaseDirectionListResult(data, currentPage);
  };
  
  // Ajax 실행 방식
  // callAjax("Url", type, return, async or sync방식, 넘겨준거, Callback함수 이름)
  // html로 받을거라 text
  callAjax("/ecv/purchaseDirectionListInfo.do", "post", "text", true, param, resultCallback);
}

/** 일별 수주 내역 조회 콜백 함수 */
function getPurchaseDirectionListResult(data, currentPage) {

  // alert(data);
  console.log(data);

  // 기존 목록 삭제
  $('#purchDirListHistory').empty().append(data);

  // 총 개수 추출
  let totalCnt = $("#totcnt").val();
  console.log(totalCnt);
  // 페이지 네비게이션 생성
  var paginationHtml = getPaginationHtml(currentPage, totalCnt, pageSizeOrderList, pageBlockSizeOrderList, 'searchPurchaseDirectionList');
  console.log("paginationHtml : " + paginationHtml);

  $("#purchDirListPagination").empty().append(paginationHtml);

  // 현재 페이지 설정
  $("#currentPage").val(currentPage);
  
};


var allowPurchaseModal = new tingle.modal({
  footer: true,
  stickyFooter: false,
  closeMethods: ['button'],
  closeLabel: "Close",
  cssClass: ['custom-class-1', 'custom-class-2'],
  onOpen: function() {
      console.log('modal open');
  },
  onClose: function() {
      console.log('modal closed');
  },
  beforeClose: function() {
      // here's goes some logic
      // e.g. save content before closing the modal
      return true; // close the modal
      return false; // nothing happens
  }
});

allowPurchaseModal.setContent("<h1>승인 하시겠습니까?</h1>")

var orderCd = '';
//add a button
allowPurchaseModal.addFooterBtn('승인', 'tingle-btn tingle-btn--primary', function() {
  var param = {
      STTcd: "10",
      orderCode: orderCd
  }
  
  var totalAmount = $('input[name="purchaseTotalAmount"]').val();
  
  param['totalAmount'] = totalAmount;
  
  var resultCallback = function(data) {
    getUpdateMessage(data);
  }
  
  callAjax("/ecv/ecvApprove.do", "post", "json", true, param, resultCallback);
  allowPurchaseModal.close();
});

function getUpdateMessage(data) {
  if (data.result === "SUCCESS") {
    swal(data.resultMsg).then(function() {
      window.location.reload(); // 새로고침
    });
    console.log("상태 업데이트 완료");
    return 1;
  } else {
    swal(data.resultMsg).then(function() {
      window.location.reload(); // 새로고침
    });
    console.log("상태 업데이트 실패");
    return 0;
  }
}

// add another button
allowPurchaseModal.addFooterBtn('취소', 'tingle-btn tingle-btn--danger', function() {
  allowPurchaseModal.close();
});

function allowPurchase(orderCode) {
  orderCd = orderCode;
  
  allowPurchaseModal.open();
}

// 임원 발주지시서 검색 기능
function searchPurchaseDirectionList(currentPage) {
  var param = $('#purchaseDirectionListForm').serialize();
  console.log(param);
  
  currentPage = currentPage || 1;
  
  param += "&currentPage="+currentPage;
  param += "&pageSize="+pageSizeOrderList;
  
  var startD = $('#startDate').val();
  var endD = $('#endDate').val();
  
  console.log(param);
  
  // 날짜 에러 있을 때, 경고창 띄우고 refresh
  if (startD > endD) {
    swal("시작일자가 종료일자보다 뒤에 있을 수 없습니다.\n날짜를 다시 지정해주세요.").then(function() {
      window.location.reload();
    });
    return 0;
  } 
  
  var resultCallback = function(data) {
    getPurchaseDirectionListResult(data, currentPage);
  };
  
  callAjax("/ecv/purchaseDirectionListInfo.do", "post", "text", true, param, resultCallback);
}

$('input[type="text"]').keydown(function(event) {
  if (event.keyCode === 13) {
    searchPurchaseDirectionList();
  };
});