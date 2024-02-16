<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${totalCount eq 0 }">
  <tr>
    <td colspan="11">데이터가 존재하지 않습니다.</td>
  </tr>
</c:if>
<c:if test="${totalCount > 0 }">
  <c:forEach items="${listPcsOrderingOrderModel}" var="list">
    <tr>
      <td>${list.purch_list_no}</td>
      <td>${list.supply_nm}</td>
      <td><a href="javascript:fPopModalPcsOrderingOrderSecond('${list.purch_list_no}','${list.supply_nm}','${list.prod_nm}','${list.m_ct_nm}','${list.purch_qty}','${list.purchase_price}','${list.purch_date}','${list.desired_delivery_date}','${list.warehouse_nm}','${list.purch_mng_id}');">${list.prod_nm}</a></td>
      <td>${list.m_ct_nm}</td>
      <td>${list.purch_qty}</td>
      <td><fmt:formatNumber value="${list.purchase_price}" pattern="#,###"/></td>
      <td><fmt:formatDate value="${list.desired_delivery_date}" pattern="yyyy-MM-dd" /></td>
      <td>${list.warehouse_nm}</td>
      <td>${list.purch_mng_id}</td>
      <td>${list.detail_name}</td>
      <c:if test="${empty list.desired_delivery_date}">
      <td><a class="btnType3 color2" href="javascript:fPopModalPcsOrderingOrder('${list.purch_list_no}','${list.supply_nm}','${list.prod_nm}','${list.m_ct_nm}','${list.purch_qty}','${list.purchase_price}','${list.desired_delivery_date}','${list.warehouse_nm}','${list.purch_mng_id}','${list.order_cd}','${list.supply_cd}','${list.scm_id}','${list.loginID}');"><span>발주</span></a></td>
      </c:if>
      <c:if test="${!empty list.desired_delivery_date}">
      <td>발주</td>
      </c:if>
    </tr>
  </c:forEach>
</c:if>
<input type="hidden" id="totalCount" name="totalCount" value="${totalCount}" />