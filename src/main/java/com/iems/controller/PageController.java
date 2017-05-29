package com.iems.controller;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面控制器
 * Created by Eric Xie on 2017/5/28.
 */
@RequestMapping("/iems/page")
public class PageController {


    @RequestMapping("/main")
    public String getMainPage(){
        return "/main";
    }
    @RequestMapping("/index")
    public String getIndexPage(){
        return "/index";
    }

}
