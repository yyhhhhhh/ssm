package com.yyh;

import com.yyh.dao.DepartmentMapper;
import com.yyh.dao.EmployeeMapper;
import com.yyh.entity.Department;
import com.yyh.entity.Employee;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.UUID;

/*
* @ContextConfiguration这个注解通常与@RunWith(SpringJUnit4ClassRunner.class)联合使用用来测试
* spring的单元测试
*/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:conf/applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Resource
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession session;

    @Test
    public void testInsert(){
        EmployeeMapper mapper = session.getMapper(EmployeeMapper.class);

        for(int i=0;i<1000;i++){
            String uid = UUID.randomUUID().toString().substring(0,5)+i;
            mapper.insertSelective(new Employee(null,uid,"M",uid+"@qq.com",1,null));
        }
        System.out.println("successful");
    }
}
