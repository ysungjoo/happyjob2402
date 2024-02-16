package kr.happyjob.study.scm.service;

<<<<<<< HEAD
import java.util.List;
import java.util.Map;

=======
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
>>>>>>> 45ba225372f4b960add5e991dc88b6d49f945ef8
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.scm.dao.WarehouseInfoDao;
import kr.happyjob.study.scm.model.WarehouseInfoModel;

@Service
public class WarehouseInfoServiceImpl implements WarehouseInfoService {
<<<<<<< HEAD
  
  @Autowired // service에서는 controller,DAO와 연결되어 있다.
  WarehouseInfoDao warehouseInfoDao;
  
  // 창고 목록 조회
  @Override
  public List<WarehouseInfoModel> listWarehouse(Map<String, Object> paramMap) throws Exception {
    // 필요한 값
    List<WarehouseInfoModel> listWarehouse = warehouseInfoDao.listWarehouse(paramMap);
    // List는 쇼핑백 <>사이는 봉투 List에 <>내용을 담은 후에 리턴해준다. <> 내용에는 우측항의 Dao의 내용
    // 빈 List<WarehouseInfoVO> listWarehouseInfo 라는 그릇에 warehouseInfoDao.listWarehouseInfo(paramMap) 라는 계란을 담고 리턴
    return listWarehouse;
  }
  
  // 창고 카운트
  @Override
  public int totalCntWarehouse(Map<String, Object> paramMap) throws Exception {
    int totalCntWarehouse = warehouseInfoDao.totalCntWarehouse(paramMap);
    return totalCntWarehouse;
  }
  
  // 제품 목록 조회
  @Override
  public List<WarehouseInfoModel> listWarehouseProduct(Map<String, Object> paramMap) throws Exception {
    List<WarehouseInfoModel> listWarehouseProduct = warehouseInfoDao.listWarehouseProduct(paramMap);
    return listWarehouseProduct;
  }
  
  // 제품 카운트
  @Override
  public int totalCntProduct(Map<String, Object> paramMap) throws Exception {
    int totalCntProduct = warehouseInfoDao.totalCntProduct(paramMap);
    return totalCntProduct;
  }
  
 //창고 등록
  @Override
  public int insertWarehouse(Map<String, Object> paramMap) throws Exception {
    int ret = warehouseInfoDao.insertWarehouse(paramMap);
    return ret;
  }
  //창고 수정
  @Override
  public int updateWarehouse(Map<String, Object> paramMap) throws Exception {
    int ret = warehouseInfoDao.updateWarehouse(paramMap);
    return ret;
  }
  //창고 삭제
  @Override
  public int deleteWarehouse(Map<String, Object> paramMap) throws Exception {
    int ret = warehouseInfoDao.deleteWarehouse(paramMap);
    return ret;
  }
  //창고 단건 조회
  @Override
  public WarehouseInfoModel selectWarehouse(Map<String, Object> paramMap) throws Exception {
    WarehouseInfoModel selectWarehouse = warehouseInfoDao.selectWarehouse(paramMap);
    return selectWarehouse;
  }
=======

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	@Autowired
	WarehouseInfoDao dao;

	// 창고조회
	public List<WarehouseInfoModel> listWarehouse() {

		List<WarehouseInfoModel> listWarehouse = dao.listWarehouse();

		return listWarehouse;
	}

	// 창고상세 조회
	public List<WarehouseInfoModel> detailWarehouse(String warehouse_code) {

		List<WarehouseInfoModel> detailWarehouse = dao.detailWarehouse(warehouse_code);
		return detailWarehouse;
	}

	// 창고검색
	public List<WarehouseInfoModel> searchWarehouse(String searchKey, String sname) {
		
		
		// .xml에 넘길 조건이 많을 때는 paramMap에 정보를 넣어주고 List에 담아서 보내야함
		// mapper가 인식을 못함
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchKey", searchKey);
		paramMap.put("sname", sname);
		
		List<WarehouseInfoModel> searchWarehouse = dao.searchWarehouse(paramMap);
		
		return searchWarehouse;
	}

	// 창고등록
	public boolean insertWarehouse(Map<String, Object> paramMap) throws Exception {
		
		
		int result = dao.insertWarehouse(paramMap);
		
		return result > 0;
		
	}

	// 창고수정
	public boolean updateWarehouse(WarehouseInfoModel warehouseInfo) throws Exception {

		int result = dao.updateWarehouse(warehouseInfo);
		
		return result > 0;
	}

	// 창고삭제
	public boolean deleteWarehouse(WarehouseInfoModel warehouseInfo) throws Exception {

		int result = dao.deleteWarehouse(warehouseInfo);

		return result > 0;
	}

>>>>>>> 45ba225372f4b960add5e991dc88b6d49f945ef8
}
