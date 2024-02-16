package kr.happyjob.study.scm.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.scm.model.WarehouseInfoModel;

public interface WarehouseInfoService {
<<<<<<< HEAD
  /* 창고 목록 조회 */
  public List<WarehouseInfoModel> listWarehouse(Map<String, Object> paramMap) throws Exception;
  
  /* 창고 목록 카운트 조회 */
  public int totalCntWarehouse(Map<String, Object> paramMap) throws Exception;
  
  /* 제품 목록 조회 */
  public List<WarehouseInfoModel> listWarehouseProduct(Map<String, Object> paramMap) throws Exception;
  
  /* 제품 목록 카운트 조회 */
  public int totalCntProduct(Map<String, Object> paramMap) throws Exception;
  
  /* 창고 등록*/
  public int insertWarehouse(Map<String, Object> paramMap) throws Exception;
  
  /* 창고 수정*/
  public int updateWarehouse(Map<String, Object> paramMap) throws Exception;
  
  /* 창고 삭제*/
  public int deleteWarehouse(Map<String, Object> paramMap) throws Exception;
  
  /* 창고 단건 조회*/
  public WarehouseInfoModel selectWarehouse(Map<String, Object> paramMap) throws Exception;
=======
	
	// 창고조회 
	public List<WarehouseInfoModel> listWarehouse();
	
	// 창고상세조회
    public List<WarehouseInfoModel> detailWarehouse(String warehouse_code);
    
    // 창고검색
    public List<WarehouseInfoModel> searchWarehouse(String searchKey, String sname);
    
    // 창고등록 
    public boolean insertWarehouse(Map<String, Object> paramMap) throws Exception;
	
	// 창고수정
	public boolean updateWarehouse(WarehouseInfoModel warehouseInfo) throws Exception;
	
	// 창고삭제
	public boolean deleteWarehouse(WarehouseInfoModel warehouseInfo) throws Exception;

>>>>>>> 45ba225372f4b960add5e991dc88b6d49f945ef8
}
