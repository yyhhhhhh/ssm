package com.yyh;

import com.github.pagehelper.PageInfo;
import com.yyh.entity.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;


//  spring测试请求功能
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration//可以获取到WebApplicationContext本身 @Autowired
//@WebAppConfiguration必须与 @ContextConfiguration单个测试类或测试类层次结构一起使用
@ContextConfiguration(locations =
        {"classpath:conf/applicationContext.xml","classpath:conf/dispatcherServlet.xml"})
public class RequestTest {
    @Autowired
    WebApplicationContext context;

    //虚拟的MVC,获取到处理结果
    MockMvc mvc;

    @Before //在测试方法执行前执行
    public void initMockMvc(){
        mvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testPage() throws Exception {
        MvcResult result = mvc.perform(MockMvcRequestBuilders.
                get("/employees").param("num","5")).andReturn();
        MockHttpServletRequest request = result.getRequest();
        PageInfo page = (PageInfo) request.getAttribute("pageInfo");
        System.out.println(page.getPageNum());
        System.out.println(page.getPages());
        System.out.println(page.getTotal());
        int[] nums = page.getNavigatepageNums();
        for(int i : nums)
            System.out.print(" "+i);
        System.out.println();
        List<Employee> list = page.getList();
        list.forEach(emp -> System.out.println(emp));
    }
}
