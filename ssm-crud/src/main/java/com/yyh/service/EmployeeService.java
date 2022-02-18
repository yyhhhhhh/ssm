package com.yyh.service;

import com.yyh.entity.Employee;

import java.util.List;

public interface EmployeeService {

    List<Employee> getAll();

    int saveEmp(Employee employee);

    boolean checkUser(String empName);

    Employee getEmpInfo(Integer id);

    int saveEmpInfo(Employee employee);

    int delEmpById(Integer id);

    int delEmpsById(List<Integer> ids);
}
