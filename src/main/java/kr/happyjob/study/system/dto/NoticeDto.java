package kr.happyjob.study.system.dto;

import java.util.Date;

public class NoticeDto {
	private int notice_code;
	
	private int user_code;
	
	private int notice_category_code;
	
	private int file_code;
	
	private String notice_title;
	
	private String notice_contents;
	
	private Date write_date;

	public int getNotice_code() {
		return notice_code;
	}

	public void setNotice_code(int notice_code) {
		this.notice_code = notice_code;
	}

	public int getUser_code() {
		return user_code;
	}

	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}

	public int getNotice_category_code() {
		return notice_category_code;
	}

	public void setNotice_category_code(int notice_category_code) {
		this.notice_category_code = notice_category_code;
	}

	public int getFile_code() {
		return file_code;
	}

	public void setFile_code(int file_code) {
		this.file_code = file_code;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_contents() {
		return notice_contents;
	}

	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	
	
	
}
