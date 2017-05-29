package com.iems.util;

public class StatusConstant {

	
	// 错误代码
	/**获取成功*/
	public static final Integer SUCCESS_CODE = 200;
	// 201 备用
	/**获取失败*/
	public static final Integer Fail_CODE = 202;
	/**参数异常*/
	public static final Integer ARGUMENTS_EXCEPTION = 203;

	
	
	/**没有权限 错误代码*/
	public static final Integer NOT_AGREE = 1001;
	/**对象不存在*/
	public static final Integer OBJECT_NOT_EXIST = 1002;
	/**字段不能为空*/
	public static final Integer FIELD_NOT_NULL= 1003;
	/**正在审核*/
	public static final Integer PENDING = 1004;
	/**未登录*/
	public static final Integer NOTLOGIN= 1005;
	/**没有数据*/
	public static final Integer NO_DATA = 1006;
	/**账户被冻结*/
	public static final Integer ACCOUNT_FROZEN = 1007;
	/**订单无效*/
	public static final Integer ORDER_INVALID = 1008;
	/**状态异常*/
	public static final Integer ORDER_STATUS_ABNORMITY = 1009;
	/**对象已经存在*/
	public static final Integer OBJECT_EXIST = 1010;

	/** 用户不存在 */
	public static final Integer USER_DOES_NOT_EXIST = 1050;
	/** 用户名或者密码错误 */
	public static final Integer PASSWORD_ERROR = 1051;

	/** 电话号码已存在 */
	public static final Integer PHONE_NUMBER_THERE = 1052;
	/** 账号已存在 */
	public static final Integer USER_NAME_ALREADY_EXISTS = 1053;
	/** 邮箱已存在 */
	public static final Integer EMAIL_IS_EXISTENCE = 1054;




	// 设备类型
	/**android*/
	public static final Integer ANDROID=0;
	/**ios*/
	public static final Integer IOS = 1;


	/**帐号在职*/
	public static final Integer VALID = 5001;
	/**帐号离职*/
	public static final Integer NON_VALID = 5002;



	
	
	
	
	
	
	
	
	
	
	
	
}
