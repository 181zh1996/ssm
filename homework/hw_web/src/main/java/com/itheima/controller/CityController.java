package com.itheima.controller;

import com.itheima.domain.City;
import com.itheima.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/city")
public class CityController {
    @Autowired
    private CityService service;

    @RequestMapping("/findAll")
    public @ResponseBody  List<City> findAll(){
      return  service.findAll();
    }
}
