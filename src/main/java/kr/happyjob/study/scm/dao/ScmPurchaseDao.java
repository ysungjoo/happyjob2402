package kr.happyjob.study.scm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.scm.model.ScmPurchaseModel;

public interface ScmPurchaseDao {
  /** 발주지시서 목록 조회 */
  public List<ScmPurchaseModel> scmPcsOrderingOrder(Map<String, Object> paramMap);
  
  /** 발주지시서 목록 카운트 조회 */
  public int countScmPcsOrderingOrder(Map<String, Object> paramMap);
  
  /** 발주지시서 발주버튼 클릭시 조회 */
  public ScmPurchaseModel selectPurchBtn(Map<String, Object> paramMap);
}