package com.iems.controller;

import com.iems.util.LoginHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * 页面控制器
 * Created by Eric Xie on 2017/5/28.
 */
@Controller
@RequestMapping("/page")
public class PageController {


    @RequestMapping("/main")
    public String getMainPage(){
        return "/main";
    }



    @RequestMapping("/index")
    public String getIndexPage(HttpServletRequest request, Model model){
        model.addAttribute("user",request.getSession().getAttribute(LoginHelper.SESSION_USER));
        return "/index";
    }

}
