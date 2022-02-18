package com.yyh;

import org.junit.Test;


public class TestApp {

    @Test
    public void testMethod(){
        new Thread(new Runnable(){
            public void run(){
                for(int i=0;i<10;i++)
                    System.out.println("th="+i);
            }
        }).start();

        new Thread(new Runnable(){
            public void run(){
                for(int i=0;i<10;i++)
                    System.out.println("thread="+i);
            }
        }).start();
    }
}
