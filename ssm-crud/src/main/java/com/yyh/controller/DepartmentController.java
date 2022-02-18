package com.yyh.controller;

import com.yyh.entity.Message;
import com.yyh.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DepartmentController {

    @Autowired
    DepartmentService service;

    //返回所有部门信息
    @RequestMapping("deps")
    @ResponseBody
    public Message getDeps(){
        return Message.success().add("deps",service.getAll());
    }
}
