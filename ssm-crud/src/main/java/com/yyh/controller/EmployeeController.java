package com.yyh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yyh.entity.Employee;
import com.yyh.entity.Message;
import com.yyh.service.EmployeeService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class EmployeeController {

    @Autowired
    EmployeeService service;

    //删除某个员工(批量,单独)
    @RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Message delEmpById(@PathVariable("ids") String ids){
        if(ids.contains("-")){
            List<Integer> list = new ArrayList<>();
            String [] str = ids.split("-");
            for(String s : str){
                list.add(Integer.valueOf(s));
            }
            service.delEmpsById(list);
        }else{
            service.delEmpById(Integer.valueOf(ids));
        }
        return Message.success();
    }

    //更新某个员工信息
    /*  ajax发送put请求
    put请求体中的数据 request.getParameter("")拿不到
    tomcat看是put请求就不会封装请求体中的数据为Map,只有post才封装请求体
    */
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Message updateEmp(Employee employee){
        service.saveEmpInfo(employee);
        return Message.success();
    }

    //查询某个员工信息
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    //@PathVariable 从路径中取出某个值
    public Message getEmp(@PathVariable("id") Integer id){
        Employee employee = service.getEmpInfo(id);
        return Message.success().add("emp",employee);
    }
    
    //检查用户名是否存在
    @RequestMapping(value = "/checkName",method = RequestMethod.POST)
    @ResponseBody
    public Message checkName(String empName){
        String empNameReg = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!empName.matches(empNameReg))
            return Message.fail().add("value","用户名必须是2-5位中文或者6-16英文和数字的组合");
        boolean flag = service.checkUser(empName);
        if(flag)
            return Message.success();
        return Message.fail().add("value","用户名已存在");
    }

    //保存员工信息
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    //@Valid 需要进行后端校验的数据
    public Message saveEmp(@Valid Employee employee, BindingResult result){
        if(result.hasFieldErrors()){
            Map<String,Object> map = new HashMap<>();
            //获取所有错误信息
            List<FieldError> list = result.getFieldErrors();
            for(FieldError error : list){
                //error.getField() 获取错误的字段名
                //error.getDefaultMessage() 获取错误的字段提示信息
                map.put(error.getField(),error.getDefaultMessage());
            }
            return Message.fail().add("errorFields",map);
        } else {
            service.saveEmp(employee);
            return Message.success();
        }
    }

    //ajax
    @RequestMapping("/ems")
    @ResponseBody
    public Message getEmployeesWithJson(@RequestParam(value = "num",defaultValue = "1") Integer num){
        PageHelper.startPage(num,5);
        List<Employee> list = service.getAll();
        //使用PageInfo对查询后的结果进行包装,PageInfo里面封装了结果的详细信息,查询数据
        PageInfo pageInfo = new PageInfo(list,5);
        return  Message.success().add("pageInfo",pageInfo);
    }

    //查询所有员工(分页查询)
    @RequestMapping("/employees")
    //分页查询 如果没有传入第几页,从defaultValue开始
    public String getEmployees(@RequestParam(value = "num",defaultValue = "1") Integer num, Model model){
        /*在查询前进行分页
            pageNum:从第几页开始查
            pageSize:每一页多少条记录
            startPage()后紧跟的查询就是分页查询
        */
        PageHelper.startPage(num,5);
        List<Employee> list = service.getAll();
        //使用PageInfo对查询后的结果进行包装,PageInfo里面封装了结果的详细信息,查询数据
        PageInfo pageInfo = new PageInfo(list,5);//连续显示5页
        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }
}
