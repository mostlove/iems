var YZ = function () {};
YZ.prototype = {
	ip: 'http://'+window.location.host+'/iems',
	ipUrl: location.href.split('#')[0],
	//手机号码正则表达式
	isMobile : /^(((13[0-9]{1})|(18[0-9]{1})|(17[6-9]{1})|(15[0-9]{1}))+\d{8})$/,
	//电话号码正则表达式
	isPhone : /[0-9-()（）]{7,18}/,
	//身份证正则表达式
	isIHCIard :   /^\d{15}(\d{2}[\d|X])?$/,
	//6-12的密码
	isPwd : /[A-Za-z0-9]{6,20}/,
	//输入的是否为数字
	isNumber : /^[0-9]*$/,
	//检查小数
	isDouble : /^\d+(\.\d+)?$/,
	//输入的只能为数字和字母
	isNumberChar: /^[0-9a-zA-Z]*$/,
	//用户名
	isUserName : /[\w\u4e00-\u9fa5]/,
	//emoji 表情正则
	isEmoji : /\uD83C[\uDF00-\uDFFF]|\uD83D[\uDC00-\uDE4F]/g,
	//验证邮箱
	isEmail : /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,
	//只能输入汉字
	isChinese : /[\u4e00-\u9fa5]/gm,
	//获取url中的参数
	getUrlParam : function(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var r = window.location.search.substr(1).match(reg); //匹配目标参数
		if(r != null){
			return unescape(r[2]);
		}else{
			return null; //返回参数值
		}
	},
	//时间戳转日期
	timeStampConversion : function (timestamp){
		var d = new Date(timestamp);    //根据时间戳生成的时间对象
		var date = (d.getFullYear()) + "-" +
			(d.getMonth() + 1) + "-" +
			(d.getDate())+ " " +
			(d.getHours()) + ":" +
			(d.getMinutes()) + ":" +
			(d.getSeconds());
		return date;
	},
	//日期转换为时间戳
	getTimeStamp : function (time){
		time=time.replace(/-/g, '/');
		var date=new Date(time);
		return date.getTime();
	},
	//判断是否是json对象
	isJson : function (obj){
		var isjson = typeof(obj) == "object" && Object.prototype.toString.call(obj).toLowerCase() == "[object object]" && !obj.length;
		return isjson;
	},
	//获取登录人信息
	getUserInfo : function () {
		var userInfo = JSON.parse(localStorage.getItem("userInfo"));
		return userInfo;
	},
	formPopup : function (html, title, widthOrHeight, confirmCallback, closeCallback) {
		layer.confirm(html, {
			btn: ['提交','取消'],
			title: title,
			area: widthOrHeight, //宽高
		}, confirmCallback, closeCallback);
	},
	//ajax请求数据  get/post方式
	ajaxRequestData : function(method,async,requestUrl,arr,token,callback){
		$.ajax({
			type: method,
			async: async,
			url: requestUrl,
			data: arr,
			//dataType:"jsonp",    //跨域json请求一定是jsonp
			headers: {
				"token":token,
			},
			success:function(json){
				console.log(json);
				if (!YZ.isJson(json)) {
					json = JSON.parse(json);
				}
				if(json.flag==0 && json.code ==200){
					if (callback) {
						callback(json);
					}
				}
				else if(json.code == 1005){
					localStorage.removeItem("userInfo");
					layer.alert(json.msg, {
						skin: 'layui-layer-lan'
						,closeBtn: 0
						,anim: 4 //动画类型
					},function () {
						location.href = YZ.ip + "/page/login";
					});
				}
				else {
					layer.alert(json.msg);
				}
				/*else if (json.code == 1007) {
					layer.alert(json.msg);
				}
				else if (json.code == 202) {
					layer.alert(json.msg);
				}
				else if (json.code == 1051) {
					layer.alert(json.msg);
				}
				else if (json.code == 105) {
					layer.alert(json.msg);
				}
				else if (json.code == 1010) {
					layer.alert(json.msg);
				}*/
			},
			error: function(json) {
				layer.alert(json.responseText);
				console.log("请求出错了.");
			}
		})
	},
};

var YZ = new YZ();

//转时间戳
Date.prototype.format = function (fmt) { //author: meizz
	var o = {
		"M+": this.getMonth() + 1, //月份
		"d+": this.getDate(), //日
		"h+": this.getHours(), //小时
		"m+": this.getMinutes(), //分
		"s+": this.getSeconds(), //秒
		"q+": Math.floor((this.getMonth() + 3) / 3), //季度
		"S": this.getMilliseconds() //毫秒
	};
	if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
	for (var k in o)
		if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
	return fmt;
}
