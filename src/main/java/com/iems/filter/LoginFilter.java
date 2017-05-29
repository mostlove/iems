package com.iems.filter;

import com.iems.util.LoginHelper;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 登录过滤器
 * Created by Eric Xie on 2017/5/28.
 */
@WebFilter("/iems/*")
public class LoginFilter implements Filter {

    private static final String LOGIN_PAGE = "/login";

    public void init(FilterConfig filterConfig) throws ServletException {}

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        if(!request.getRequestURI().contains("login")){
            Object currentUser = LoginHelper.getCurrentUser();
            if(null == currentUser){
                response.sendRedirect(request.getContextPath()+LOGIN_PAGE);
                return;
            }
        }
        filterChain.doFilter(request,response);
    }

    public void destroy() {

    }
}
