package kr.happyjob.study.scm.controller;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
=======
import java.util.*;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

>>>>>>> 45ba225372f4b960add5e991dc88b6d49f945ef8
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.scm.model.WarehouseInfoModel;
import kr.happyjob.study.scm.service.WarehouseInfoService;

<<<<<<< HEAD
@Controller
@RequestMapping("/scm")
public class WarehouseInfoController {
  @Autowired // 묶어준다
  WarehouseInfoService warehouseInfoService;
  
  private static final Logger logger = LoggerFactory.getLogger(WarehouseInfoController.class);
  private final String className = this.getClass().toString();
  
  @RequestMapping("warehouseInfo.do")
  public String initWarehouseInfo(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession Session) throws Exception {
    
    logger.info("+ Start " + className + ".initWarehouseInfo");
    logger.info("   - paramMap : " + paramMap);
    
    logger.info("+ End " + className + ".initWarehouseInfo");
    
    return "scm/warehouseInfo";
    
  }
  
  // 창고 조회
  @RequestMapping("listWarehouse.do")
  public String listWarehouse(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
    
    logger.info("+ Start " + className + ".listWarehouse");
    logger.info("   - paramMap : " + paramMap);
    
    int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); // 현재 페이지 번호
    int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 페이지 사이즈
    int pageIndex = (currentPage - 1) * pageSize; // 페이지 시작 row 번호
    
    paramMap.put("pageIndex", pageIndex);
    paramMap.put("pageSize", pageSize);
    
    // 창고 목록 조회
    List<WarehouseInfoModel> listWarehouseModel = warehouseInfoService.listWarehouse(paramMap);
    model.addAttribute("listWarehouseModel", listWarehouseModel);
    
    // 창고 목록 카운트 조회
    int totalCount = warehouseInfoService.totalCntWarehouse(paramMap);
    model.addAttribute("totalWarehouse", totalCount);
    
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("currentPageWarehouse", currentPage);
    
    logger.info("+ End " + className + ".listWarehouse");
    
    return "scm/listWarehouse";
  }
  
  // 제품 조회
  @RequestMapping("listWarehouseProduct.do")
  public String listWarehouseProduct(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
    
    logger.info("+ Start " + className + ".listWarehouseProduct");
    logger.info("   - paramMap : " + paramMap);
    
    int currentPage = Integer.parseInt((String) paramMap.get("currentPage")); // 현재 페이지 번호
    int pageSize = Integer.parseInt((String) paramMap.get("pageSize")); // 페이지 사이즈
    int pageIndex = (currentPage - 1) * pageSize; // 페이지 시작 row 번호
    
    paramMap.put("pageIndex", pageIndex);
    paramMap.put("pageSize", pageSize);
    
    // 제품 목록 조회
    List<WarehouseInfoModel> listWarehouseProductModel = warehouseInfoService.listWarehouseProduct(paramMap);
    model.addAttribute("listWarehouseProductModel", listWarehouseProductModel);
    
    // 제품 목록 카운트 조회
    int totalCount = warehouseInfoService.totalCntProduct(paramMap);
    model.addAttribute("totalProduct", totalCount);
    
    model.addAttribute("pageSize", pageSize);
    model.addAttribute("currentPageProduct", currentPage);
    
    logger.info("+ End " + className + ".listWarehouseProduct");
    
    return "scm/listWarehouseProduct";
  }
  
  // 창고 저장
  @RequestMapping("saveWarehouse.do")
  @ResponseBody
  public Map<String, Object> saveWarehouse(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
    logger.info("+ Start " + className + ".saveWarehouse");
    logger.info("   - paramMap : " + paramMap);
    
    String action = (String) paramMap.get("action");
    
    String result = "SUCCESS";
    String resultMsg = "";
    
    if ("I".equals(action)) {
      // 창고 등록
     int saveResult = warehouseInfoService.insertWarehouse(paramMap);
     if (saveResult == 0) {
       result = "FAIL";
       resultMsg = "중복된 코드입니다.";
     } else{
     resultMsg = "등록 완료"; }
    } else if ("U".equals(action)) {
      // 창고 수정
      warehouseInfoService.updateWarehouse(paramMap);
      resultMsg = "수정 완료";
    } else if ("D".equals(action)) {
      // 창고 삭제
      int deleteResult = warehouseInfoService.deleteWarehouse(paramMap);
      if (deleteResult == 0) {
        result = "FAIL";
        resultMsg = "삭제가 실패하였습니다.\n해당 창고를 참조하는 제품과 공급처 정보를 확인해주세요.";
      } else {
        resultMsg = "삭제 완료";
      }     
    } 
    else {
      result = "FALSE";
      resultMsg = "저장 실패";
    }
    
    Map<String, Object> resultMap = new HashMap<String, Object>();
    resultMap.put("result", result);
    resultMap.put("resultMsg", resultMsg);
    
    logger.info("+ End " + className + ".saveWarehouse");
    
    return resultMap;
  }
  
  // 창고 단건 조회
  @RequestMapping("selectWarehouse.do")
  @ResponseBody
  public Map<String, Object> selectWarehouse(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
    logger.info("+ Start " + className + ".selectWarehouse");
    logger.info("   - paramMap : " + paramMap);
    
    String result = "SUCCESS";
    String resultMsg = "조회 되었습니다.";
    
    WarehouseInfoModel warehouseInfoModel = warehouseInfoService.selectWarehouse(paramMap);
    
    Map<String, Object> resultMap = new HashMap<String, Object>();
    resultMap.put("result", result);
    resultMap.put("resultMsg", resultMsg);
    resultMap.put("warehouseInfoModel", warehouseInfoModel);
    
    logger.info("+ End " + className + ".selectWarehouse");
    
    System.out.println(resultMap);
    return resultMap;
  }
  
}
=======

/**
* 창고정보관리(등록, 조회, 수정, 삭제)
* @author 강기림
* <pre>
*     수정일    	  수정자 		      수정내용
* -------------- ---------- ---------------------------------------------
*  2024.01.28 	  강기림 		     최초 작성
* </pre>
*/

@Controller
@RequestMapping("/scm/")
public class WarehouseInfoController {
  
  @Autowired
  WarehouseInfoService svc;
  
  // Set logger
  private final Logger logger = LogManager.getLogger(this.getClass());
  
  // Get class name for logger
  private final String className = this.getClass().toString();
  
  
    // 창고초기화면
  	@RequestMapping("/warehouseInfo")
      public String showWarehouseInfo() {
  		
          return "/scm/warehouseInfo"; 
      } 
  	
  	
  	// 창고등록
  	@PostMapping("/insertWarehouse")
  	@ResponseBody
  	public Map<String, Object> insertWarehouse(@RequestParam Map<String, Object> paramMap) {
  	    
  		Map<String, Object> resultMap = new HashMap<>();

  	    try {
  	    	
  	        boolean inserted = svc.insertWarehouse(paramMap);
  	        resultMap.put("inserted", inserted);
  	        
  	    } catch (Exception e) {
  	        resultMap.put("error", "창고 등록 중 오류가 발생했습니다.");
  	    }

  	    return resultMap;
  	}
  	
  	
  	 // 창고조회	
  	 @GetMapping("/warehouseInfo")
  	 public String listWarehouse(Model model) {

  	     List<WarehouseInfoModel> listWarehouse = svc.listWarehouse();
  	     model.addAttribute("listWarehouse", listWarehouse);
  	     
  	     return "/scm/warehouseInfo"; 
  	 
  	 }
  	 
  
    // 창고상세조회	 
  	@GetMapping("/detailWarehouse")
  	public String detailWarehouse(@RequestParam("warehouse_code") String warehouse_code, 
  			                       Model model)
  		{
  		    List<WarehouseInfoModel> detailWarehouse = svc.detailWarehouse(warehouse_code);
  			model.addAttribute("detailWarehouse", detailWarehouse);
  			return "/scm/warehouseInfoDlt";
  		}
  	
  	
  	// 창고검색
  	@GetMapping("/searchWarehouse")
  	public String searchWarehouse(@RequestParam("searchKey") String searchKey, 
  			                      @RequestParam("sname") String sname, 
  			                      Model model) {
  		
  		logger.info("=====> Start searchWarehouse"  );
  	    logger.info("   - searchKey : " + searchKey);
  	    logger.info("   - sname : " + sname);
  		
  	    List<WarehouseInfoModel> searchWarehouse = svc.searchWarehouse(searchKey, sname);
  	    /*for(WarehouseInfoModel list :searchWarehouse) {
  	    	logger.info("=====> " + list.getWarehouse_name());
  	    }*/
  	    model.addAttribute("listWarehouse", searchWarehouse);
  	    
  	  logger.info("=====> End searchWarehouse"  );
  	    return "/scm/warehouseInfo"; 
  	}
  	
  
 	// 창고수정
    @PostMapping("/updateWarehouse")
  	@ResponseBody
  	public Map<String, Object> updateWarehouse(WarehouseInfoModel warehouseInfo) {
  			
  		Map<String, Object> resultMap = new HashMap<>();
  			
  		try {
  	  	    	
  	  	       boolean updated = svc.updateWarehouse(warehouseInfo);
  	  	       resultMap.put("updated", updated);
  	  	        
  	  	   } catch (Exception e) {
  	  		   
  	  	       resultMap.put("error", "창고 수정 중 오류가 발생했습니다.");
  	  	   }

  	  	   return resultMap;
  	}
  
  		
     // 창고삭제
  	 @PostMapping("/deleteWarehouse")
  	 @ResponseBody
  	 public Map<String, Object> deleteWarehouse(WarehouseInfoModel warehouseInfo) {
  		 
  		    Map<String, Object> resultMap = new HashMap<>();
  			
			try {
				
				 boolean deleted = svc.deleteWarehouse(warehouseInfo);
				 resultMap.put("deleted", deleted);
				 
			} catch (Exception e) {
				
				resultMap.put("error", "창고 삭제 중 오류가 발생했습니다.");
			}
				return resultMap;
  		}
  	
  
  }
 

 
>>>>>>> 45ba225372f4b960add5e991dc88b6d49f945ef8
