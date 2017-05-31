<!-- 解决layer.open 不居中问题   -->
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>IEMS管理系统</title>
    <!--引入抽取css文件-->
    <%@include file="common/public-css.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/global.css" media="all">

</head>
<body>
<div class="layui-layout layui-layout-admin" style="border-bottom: solid 5px #1aa094;">
    <div class="layui-header header header-demo">
        <div class="layui-main">
            <div class="admin-login-box">
                <a class="logo" style="left: 0;" href="<%=request.getContextPath()%>/page/index">
                    <span style="font-size: 22px;">IEMS</span>
                </a>
                <div class="admin-side-toggle">
                    <i class="fa fa-bars" aria-hidden="true"></i>
                </div>
                <div class="admin-side-full">
                    <i class="fa fa-life-bouy" aria-hidden="true"></i>
                </div>
            </div>
            <ul class="layui-nav admin-header-item">
                <li class="layui-nav-item">
                    <a href="<%=request.getContextPath()%>/page/index">
                        刷新
                    </a>
                </li>

                <li class="layui-nav-item">
                    <a href="javascript:;" class="admin-header-user">
                        <img src="<%=request.getContextPath()%>/resources/img/0.jpg" />
                        <span id="userName">${user.realName}</span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;"><i class="fa fa-user-circle" aria-hidden="true"></i> 个人信息</a>
                        </dd>
                        <dd>
                            <a href="javascript:;"><i class="fa fa-gear" aria-hidden="true"></i> 设置</a>
                        </dd>
                        <dd id="lock">
                            <a href="javascript:;">
                                <i class="fa fa-lock" aria-hidden="true" style="padding-right: 3px;padding-left: 1px;"></i> 锁屏 (Alt+L)
                            </a>
                        </dd>
                        <dd>
                            <a href="javascript:loginOut()"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
                        </dd>
                    </dl>
                </li>
            </ul>
            <ul class="layui-nav admin-header-item-mobile">
                <li class="layui-nav-item">
                    <a href="javascript:loginOut()"><i class="fa fa-sign-out" aria-hidden="true"></i> 注销</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-side layui-bg-black" id="admin-side">
        <div class="layui-side-scroll" id="admin-navbar-side" lay-filter="side"></div>
    </div>
    <div class="layui-body" style="bottom: 0;border-left: solid 2px #1AA094;" id="admin-body">
        <div class="layui-tab admin-nav-card layui-tab-brief" lay-filter="admin-tab">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    <i class="fa fa-home" aria-hidden="true"></i>
                    <cite>主页面板</cite>
                </li>
            </ul>
            <div class="layui-tab-content" style="min-height: 150px; padding: 5px 0 0 0;">
                <div class="layui-tab-item layui-show">
                    <iframe src="<%=request.getContextPath()%>/page/main"></iframe>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-footer footer footer-demo" id="admin-footer">
        <div class="layui-main">
            <p>2017 &copy;
                <a href="http://www.magic-beans.cn/">http://www.0838live.com/</a>
            </p>
        </div>
    </div>
    <div class="site-tree-mobile layui-hide">
        <i class="layui-icon">&#xe602;</i>
    </div>
    <div class="site-mobile-shade"></div>

    <!--锁屏模板 start-->
    <script type="text/template" id="lock-temp">
        <div class="admin-header-lock" id="lock-box">
            <div class="admin-header-lock-img">
                <img src="<%=request.getContextPath()%>/resources/img/0.jpg" />
            </div>
            <div class="admin-header-lock-name" id="lockUserName">beginner</div>
            <input type="text" class="admin-header-lock-input" value="输入密码解锁.." name="lockPwd" id="lockPwd" />
            <button class="layui-btn layui-btn-small" id="unlock">解锁</button>
        </div>
    </script>
    <!--锁屏模板 end -->

    <%@include file="common/public-js.jsp" %>
    <script src="<%=request.getContextPath()%>/resources/js/pageJS/index.js"></script>
    <script>

        //填充用户信息
        $("#userName").html(YZ.getUserInfo().account);

        //清除缓存
        function cleanOut() {
            $.ajax({
                url:'www.haorooms.com',
                dataType:'json',
                data:{},
                cache:false,
                ifModified :true ,
                success:function(response){
                    console.log(data);
                    layer.alert('清除成功', {
                        skin: 'layui-layer-molv' //样式类名
                        ,closeBtn: 0
                        ,anim: 4 //动画类型
                    }, function(){
                        //location.reload();
                    });
                },
                async:false
            });
        }

        //注销
        function loginOut () {
            layer.confirm('是否确认注销登录？', {
                btn: ['确认','取消'] //按钮
            }, function(){
                YZ.ajaxRequestData("post", false, YZ.ip + "/user/logout", {}, null, function (result) {
                    if(result.flag == 0 && result.code == 200){
                        //注销成功，跳转到登录页面
                        location.href = YZ.ip + "/login";
                    }
                });
            }, function(){

            });
        }

    </script>
</div>
</body>
</html>
