package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.dao.FindDAO;
import com.app.dto.LodgingDTO;
import com.app.dto.RestaurantDTO;

@Service
public class FindServiceImpl implements FindService {

	@Autowired
	FindDAO dao;
	
	@Override
	public RestaurantDTO find_res(String res_name) {
		return dao.find_res(res_name);
	}

	@Override
	public LodgingDTO find_lod(String lodging_name) {
		return dao.find_lod(lodging_name);
	}

}