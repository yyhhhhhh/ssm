package com.yyh.entity;

import java.util.*;

public class Message {
    //状态码 自定义
    private int code;

    //错误信息
    private String message;

    //用户返回浏览器的信息
    private Map<String,Object> extend = new HashMap<>();

    public static Message success(){
        Message result = new Message();
        result.setCode(100);
        result.setMessage("处理成功");
        return  result;
    }

    public static Message fail(){
        Message result = new Message();
        result.setCode(200);
        result.setMessage("处理失败");
        return  result;
    }

    public Message add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
