package kr.happyjob.study.scm.dao;

<<<<<<< HEAD
import java.util.List;
import java.util.Map;
=======
import java.util.*;
>>>>>>> 45ba225372f4b960add5e991dc88b6d49f945ef8

import kr.happyjob.study.scm.model.WarehouseInfoModel;

public interface WarehouseInfoDao {
<<<<<<< HEAD
  //창고 목록 조회
  public List<WarehouseInfoModel> listWarehouse(Map<String, Object> paramMap) throws Exception;
  //창고 카운트
  public int totalCntWarehouse(Map<String, Object> paramMap) throws Exception;
  
  //제품 목록 조회
  public List<WarehouseInfoModel> listWarehouseProduct(Map<String, Object> paramMap) throws Exception;
  //제품 카운트
  public int totalCntProduct(Map<String, Object> paramMap) throws Exception;
  
  //창고 추가
  public int insertWarehouse(Map<String, Object> paramMap) throws Exception;
  //창고 수정
  public int updateWarehouse(Map<String, Object> paramMap) throws Exception;
  //창고 삭제
  public int deleteWarehouse(Map<String, Object> paramMap) throws Exception;
  //창고 단건 조회
  public WarehouseInfoModel selectWarehouse(Map<String, Object> paramMap) throws Exception;
=======
	// llllll
	
	// 창고목록 조회
	public List<WarehouseInfoModel> listWarehouse();
	
	// 창고상세 조회
	public List<WarehouseInfoModel> detailWarehouse(String warehouse_code);
	
	// 창고검색
	public List<WarehouseInfoModel> searchWarehouse(Map<String, Object> paramMap);
	
	// 창고등록
	public int insertWarehouse(Map<String, Object> paramMap);
	  
	// 창고수정
	public int updateWarehouse(WarehouseInfoModel warehouseInfo);
	  
	// 창고삭제
	public int deleteWarehouse(WarehouseInfoModel warehouseInfo);


>>>>>>> 45ba225372f4b960add5e991dc88b6d49f945ef8
}
