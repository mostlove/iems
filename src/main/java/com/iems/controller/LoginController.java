package com.iems.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Eric Xie on 2017/5/28.
 */
@Controller
public class LoginController {

    @RequestMapping("/login")
    public String login(){
        return "/login";
    }

}
