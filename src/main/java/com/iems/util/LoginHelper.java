package com.iems.util;

import com.iems.cache.MemcachedUtil;
import com.iems.entity.User;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;


public class LoginHelper {
	
	public static final String TOKEN = "token";

	public static boolean isLogin=false;

	/**SESSION USER*/
	public static final String SESSION_USER = "admin_user";
	

	public static void delObject(String token){
		MemcachedUtil.getInstance().delObj(token);
	}

	public static Object getCurrentUser(){
		HttpServletRequest req = ((ServletRequestAttributes)(RequestContextHolder.getRequestAttributes())).getRequest();
		return req.getSession().getAttribute(SESSION_USER);
	}
	
	public static Object getCurrentUser(String token){
		return MemcachedUtil.getInstance().get(token);
	}
	
	public static boolean clearToken(){
		HttpServletRequest req = ((ServletRequestAttributes)(RequestContextHolder.getRequestAttributes())).getRequest();
		Object obj = req.getSession().getAttribute(SESSION_USER);
		if(null != obj ){
			req.getSession().invalidate();
			return true;
		}else{
			String token = req.getHeader(TOKEN);
			return MemcachedUtil.getInstance().delObj(token);
		}
		
	}
	
	public static String addToken(User user){
		String token = null;
		// 用户
		if(user.getToken() != null){
			Object tempObj = MemcachedUtil.getInstance().get(user.getToken());
			if(null != tempObj){
				MemcachedUtil.getInstance().delObj(user.getToken());
			}
		}
		token = UUID.randomUUID().toString().replaceAll("-", "");
		user.setToken(token);
		MemcachedUtil.getInstance().add(token, user);
		return token;
	}
	
	public static boolean  replaceToken(String token,Object obj){
		return MemcachedUtil.getInstance().set(token, obj);
	}


	
}
