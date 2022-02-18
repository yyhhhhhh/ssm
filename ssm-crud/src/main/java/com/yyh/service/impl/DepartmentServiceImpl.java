package com.yyh.service.impl;

import com.yyh.dao.DepartmentMapper;
import com.yyh.entity.Department;
import com.yyh.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    DepartmentMapper mapper;

    @Override
    public List<Department> getAll() {
        return mapper.selectByExample(null);
    }
}
