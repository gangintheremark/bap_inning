package com.app.service;

import java.util.HashMap;

import com.app.dto.MemberDTO;

public interface MypageService {

	//마이페이지 기능 service
	
	public int memberUpdate(MemberDTO memberDTO);
	public int pwChange(HashMap<String, String> hashmap);
	public int memberDelete(String userid);
}