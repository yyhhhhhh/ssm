package com.yyh.service.impl;

import com.yyh.dao.EmployeeMapper;
import com.yyh.entity.Employee;
import com.yyh.entity.EmployeeExample;
import com.yyh.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    EmployeeMapper mapper;

    //查询所有员工
    @Override
    public List<Employee> getAll() {
        return mapper.selectByExampleWithDept(null);
    }

    @Override
    public int saveEmp(Employee employee) {
        return mapper.insertSelective(employee);
    }

    @Override
    public boolean checkUser(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = mapper.countByExample(example);
        return count  == 0;
    }

    @Override
    public Employee getEmpInfo(Integer id ) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int saveEmpInfo(Employee employee) {
        return mapper.updateByPrimaryKeySelective(employee );
    }

    @Override
    public int delEmpById(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int delEmpsById(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);
        return mapper.deleteByExample(example);
    }
}
