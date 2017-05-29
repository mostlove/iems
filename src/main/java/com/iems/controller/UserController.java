package com.iems.controller;

import com.iems.entity.User;
import com.iems.service.impl.UserServiceImpl;
import com.iems.util.CommonUtil;
import com.iems.util.LoginHelper;
import com.iems.util.StatusConstant;
import com.iems.util.ViewData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * Created by Eric Xie on 2017/5/28.
 */

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Resource
    private UserServiceImpl userServiceImpl;

    /**
     * 登录消息
     * @param account
     * @param password
     * @return
     */
    @RequestMapping("/login")
    public @ResponseBody ViewData login(String account, String password, HttpServletRequest request){
        if(CommonUtil.isEmpty(account,password)){
            return buildFailureJson(StatusConstant.FIELD_NOT_NULL,"字段不能为空");
        }
        User user = userServiceImpl.queryUserByAccount(account);
        if(null == user){
            return buildFailureJson(StatusConstant.Fail_CODE,"帐号不存在");
        }
        if(!password.equals(user.getPwd())){
            return buildFailureJson(StatusConstant.Fail_CODE,"密码输入错误");
        }
        if(StatusConstant.NON_VALID.equals(user.getStatus())){
            return buildFailureJson(StatusConstant.Fail_CODE,"已离职，不登录本系统");
        }
        try {
            User temp = new User();
            temp.setId(user.getId());
            temp.setLastLogin(new Date());
            userServiceImpl.updateUser(temp);
            request.getSession().setAttribute(LoginHelper.SESSION_USER,user);
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
            return buildFailureJson(StatusConstant.Fail_CODE,"登录失败");
        }
        return buildSuccessCodeJson(StatusConstant.SUCCESS_CODE,"登录成功");
    }

}
