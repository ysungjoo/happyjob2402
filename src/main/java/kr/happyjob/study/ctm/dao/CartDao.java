package kr.happyjob.study.ctm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.ctm.model.CartModel;

public interface CartDao {

	/** 장바구니 목록 조회 */
	public List<CartModel> listCart(Map<String, Object> paramMap);
	
	/** 장바구니 목록 카운트 조회 */
	public int countListCart(Map<String, Object> paramMap);
	
	/** 장바구니 삭제 */
	public int deleteCartItem(Map<String, Object> paramMap);
	
	/** 장바구니 수량 변경 */
	public int changeQty(Map<String, Object> paramMap);
	
	/** 장바구니 총 합계 금액 출력 */
	public Integer totalCartPrice(Map<String, Object> paramMap);
	
	/** 장바구니 주문 */
	public int orderCartItem(Map<String, Object> paramMap);
	
	/* 주문완료한 장바구니 제품 삭제 */
	public int deleteOrderedCartItem(Map<String, Object> paramMap);
}
