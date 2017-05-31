package com.iems.interceptor;

import com.iems.util.LoginHelper;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录拦截器
 * Created by Eric Xie on 2017/5/31.
 */
@Component
public class LoginInterceptor implements HandlerInterceptor {



    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        String requestURI = httpServletRequest.getRequestURI();
        Object attribute = httpServletRequest.getSession().getAttribute(LoginHelper.SESSION_USER);
        httpServletResponse.setCharacterEncoding("UTF-8");
        httpServletRequest.setCharacterEncoding("UTF-8");
        if(!requestURI.contains("login")){
            if(null == attribute){
                httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+LoginHelper.LOGIN_PAGE);
                return false;
            }
        }
        return true;
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
