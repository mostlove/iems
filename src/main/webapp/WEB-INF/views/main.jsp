<!-- 解决layer.open 不居中问题   -->
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <!--引入抽取css文件-->
    <%@include file="common/public-css.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
</head>
<body>
<div class="admin-main">
    <blockquote class="layui-elem-quote">
        <p>IEMS管理系统.</p>
        <p>项目地址：
            <a href="<%=request.getContextPath()%>/web/page/index">http://www.baidu.com</a>
        </p>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>更新日志</legend>
        <div class="layui-field-box">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>版本号:# v2.0 2017-05-20</legend>
                <div class="layui-field-box">
                </div>
            </fieldset>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>版本号:# v2.0 2017-05-20</legend>
                <div class="layui-field-box">
                </div>
            </fieldset>
        </div>
    </fieldset>
</div>

<!--引入抽取公共js-->
<%@include file="common/public-js.jsp" %>
</body>
</html>
