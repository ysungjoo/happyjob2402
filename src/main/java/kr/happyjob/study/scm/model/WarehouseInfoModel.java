package kr.happyjob.study.scm.model;

public class WarehouseInfoModel {
<<<<<<< HEAD
  // 창고 코드
  private String warehouse_cd;
  // 창고명
  private String warehouse_nm;
  // 창고 담당자명
  private String wh_mng_nm;
  // 창고 담당자 로그인 아이디
  private String wh_mng_id;
  // 창고 담당자 연락처
  private String tel;
  // 창고 담당자 이메일
  private String email;
  // 우편주소
  private String zip_cd;
  // 주소
  private String addr;
  // 상세주소
  private String addr_detail;
  // 로그인 아이디
  private String loginID;
  // 활성화 여부
  private String use_yn;
  
  // 제품 코드
  private String product_cd;
  // 제품명
  private String prod_nm;
  // 품목명
  private String l_ct_nm;
  // 재고현황(개)
  private int stock;
  // 중분류 코드(for JOIN)
  private String m_ct_cd;
  // 대분류 코드(for JOIN)
  private String l_ct_cd;
  // 공급처 코드
  private String supply_cd;
  // 공급처명
  private String supply_nm;
  
  public String getLoginID() {
    return loginID;
  }
  
  public void setLoginID(String loginID) {
    this.loginID = loginID;
  }
  
  public String getWarehouse_cd() {
    return warehouse_cd;
  }
  
  public void setWarehouse_cd(String warehouse_cd) {
    this.warehouse_cd = warehouse_cd;
  }
  
  public String getWarehouse_nm() {
    return warehouse_nm;
  }
  
  public void setWarehouse_nm(String warehouse_nm) {
    this.warehouse_nm = warehouse_nm;
  }
  
  public String getWh_mng_nm() {
    return wh_mng_nm;
  }
  
  public void setWh_mng_nm(String wh_mng_nm) {
    this.wh_mng_nm = wh_mng_nm;
  }
  
  public String getWh_mng_id() {
    return wh_mng_id;
  }
  
  public void setWh_mng_id(String wh_mng_id) {
    this.wh_mng_id = wh_mng_id;
  }
  
  public String getTel() {
    return tel;
  }
  
  public void setTel(String tel) {
    this.tel = tel;
  }
  
  public String getEmail() {
    return email;
  }
  
  public void setEmail(String email) {
    this.email = email;
  }
  
  public String getZip_cd() {
    return zip_cd;
  }
  
  public void setZip_cd(String zip_cd) {
    this.zip_cd = zip_cd;
  }
  
  public String getAddr() {
    return addr;
  }
  
  public void setAddr(String addr) {
    this.addr = addr;
  }
  
  public String getAddr_detail() {
    return addr_detail;
  }
  
  public void setAddr_detail(String addr_detail) {
    this.addr_detail = addr_detail;
  }
  
  public String getUse_yn() {
    return use_yn;
  }
  
  public void setUse_yn(String use_yn) {
    this.use_yn = use_yn;
  }
  
  public String getProduct_cd() {
    return product_cd;
  }
  
  public void setProduct_cd(String product_cd) {
    this.product_cd = product_cd;
  }
  
  public String getProd_nm() {
    return prod_nm;
  }
  
  public void setProd_nm(String prod_nm) {
    this.prod_nm = prod_nm;
  }
  
  public String getL_ct_nm() {
    return l_ct_nm;
  }
  
  public void setL_ct_nm(String l_ct_nm) {
    this.l_ct_nm = l_ct_nm;
  }
  
  public int getStock() {
    return stock;
  }
  
  public void setStock(int stock) {
    this.stock = stock;
  }
  
  public String getM_ct_cd() {
    return m_ct_cd;
  }
  
  public void setM_ct_cd(String m_ct_cd) {
    this.m_ct_cd = m_ct_cd;
  }
  
  public String getL_ct_cd() {
    return l_ct_cd;
  }
  
  public void setL_ct_cd(String l_ct_cd) {
    this.l_ct_cd = l_ct_cd;
  }
  
  public String getSupply_cd() {
    return supply_cd;
  }
  
  public void setSupply_cd(String supply_cd) {
    this.supply_cd = supply_cd;
  }
  
  public String getSupply_nm() {
    return supply_nm;
  }
  
  public void setSupply_nm(String supply_nm) {
    this.supply_nm = supply_nm;
  }
}
=======
	
// 창고코드
	private String warehouse_code;
	
// 창고입출고
	private int warehouse_inout;
	
// 상품코드
	private int product_code;
	
// 창고명
	private String warehouse_name;
	
// 창고우편코드
	private String warehouse_post_code;
	
// 창고주소
	private String warehouse_address;
	
// 창고상세주소
	private String warehouse_address_detail;
	
// 담당자
	private String manager_name;
	
// 담당자핸드폰번호
	private String manager_phone;
	
// 담당자이메일
	private String manager_email;
	
// 입력날짜
	private String input_date;
	
// 입력사용자
	private String input_user;
	
// 입력프로그램
	private String input_program;
	
// 변경날짜
	private String update_date;
	
// 변경사용자
	private String update_user;
	
// 변경프로그램
	private String update_program;


// getter, setter
	public String getWarehouse_code() {
		return warehouse_code;
	}

	public void setWarehouse_code(String warehouse_code) {
		this.warehouse_code = warehouse_code;
	}

	public int getWarehouse_inout() {
		return warehouse_inout;
	}

	public void setWarehouse_inout(int warehouse_inout) {
		this.warehouse_inout = warehouse_inout;
	}

	public int getProduct_code() {
		return product_code;
	}

	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}

	public String getWarehouse_name() {
		return warehouse_name;
	}

	public void setWarehouse_name(String warehouse_name) {
		this.warehouse_name = warehouse_name;
	}

	public String getWarehouse_post_code() {
		return warehouse_post_code;
	}

	public void setWarehouse_post_code(String warehouse_post_code) {
		this.warehouse_post_code = warehouse_post_code;
	}

	public String getWarehouse_address() {
		return warehouse_address;
	}

	public void setWarehouse_address(String warehouse_address) {
		this.warehouse_address = warehouse_address;
	}

	public String getWarehouse_address_detail() {
		return warehouse_address_detail;
	}

	public void setWarehouse_address_detail(String warehouse_address_detail) {
		this.warehouse_address_detail = warehouse_address_detail;
	}

	public String getManager_name() {
		return manager_name;
	}

	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}

	public String getManager_phone() {
		return manager_phone;
	}

	public void setManager_phone(String manager_phone) {
		this.manager_phone = manager_phone;
	}

	public String getManager_email() {
		return manager_email;
	}

	public void setManager_email(String manager_email) {
		this.manager_email = manager_email;
	}

	public String getInput_date() {
		return input_date;
	}

	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}

	public String getInput_user() {
		return input_user;
	}

	public void setInput_user(String input_user) {
		this.input_user = input_user;
	}

	public String getInput_program() {
		return input_program;
	}

	public void setInput_program(String input_program) {
		this.input_program = input_program;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	public String getUpdate_user() {
		return update_user;
	}

	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}

	public String getUpdate_program() {
		return update_program;
	}

	public void setUpdate_program(String update_program) {
		this.update_program = update_program;
	}
	

	

}


















>>>>>>> 45ba225372f4b960add5e991dc88b6d49f945ef8
