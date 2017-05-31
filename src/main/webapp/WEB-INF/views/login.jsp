<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String base = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>IEMS登录</title>
    <!--引入抽取css文件-->
    <%@include file="common/public-css.jsp" %>
    <link rel="stylesheet" type="text/css" href="<%=base%>/resources/css/login.css" media="all">
</head>
<body>
<div class="layui-canvs"></div>
<div class="layui-layout layui-layout-login">
    <h1>
        <strong>IEMS管理系统</strong>
        <em>IEMS SYSTEM</em>
    </h1>
    <div class="layui-user-icon larry-login">
        <input type="text" placeholder="账号" class="login_txtbx" id="account"/>
    </div>
    <div class="layui-pwd-icon larry-login">
        <input type="password" placeholder="密码" class="login_txtbx" id="password"/>
    </div>
    <div class="layui-submit larry-login">
        <input type="button" value="立即登录" class="submit_btn"/>
    </div>
    <div class="layui-login-text">
        <p>© 2017-2018 广通信息 版权所有</p>
        <p>广通信息技术服务有限公司 <a href="http://www.0838live.com/" title="">http://www.0838live.com/</a></p>
    </div>
</div>

<!--引入抽取公共js-->
<%@include file="common/public-js.jsp" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/jparticle.jquery.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/common/jQuery.md5.js"></script>
<script type="text/javascript">
    if(window.top != window.self){
        window.top.location = window.location;
    }
    layui.use(['jquery'],function(){
        window.jQuery = window.$ = layui.jquery;
        $(".layui-canvs").width($(window).width());
        $(".layui-canvs").height($(window).height());
    });

    document.onkeydown = function(event) {
        var code;
        if (!event) {
            event = window.event; //针对ie浏览器
            code = event.keyCode;
            if (code == 13) {
                login();
            }
        }
        else {
            code = event.keyCode;
            if (code == 13) {
                login();
            }
        }
    };

    $(function(){
        $(".layui-canvs").jParticle({
            background: "#393D49",
            color: "#E6E6E6"
        });

        $(".submit_btn").click(function(){
            login ();
        });
    });

    function login () {
        if ($("#account").val() == "") {
            layer.msg("账号不能为空.", {icon: 2});
            return false;
        }
        if ($("#password").val() == "") {
            layer.msg("密码不能为空.", {icon: 2});
            return false;
        }
        $(".error-hint").hide();
        $.ajax({
            type : "post",
            url : YZ.ip + "/user/login",
            data : {
                account : $("#account").val(),
                password : $.md5($("#password").val()),
            },
            success : function (data) {
                if (data.code == 200) {
                    localStorage.setItem("userInfo", JSON.stringify(data.data));
                    location.href = "<%=request.getContextPath()%>/page/index";
                }
                else {
                    layer.msg(data.msg, {icon: 2});
                }
            },
            error : function (data) {
                layer.msg(data.msg, {icon: 2});
            }
        });
    }
</script>
</body>
</html>
