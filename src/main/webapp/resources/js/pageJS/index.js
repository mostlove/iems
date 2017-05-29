var navs = [{
    "title": "角色管理",
    "icon": "fa-user-circle-o",
    "spread": false,
    "children": [{
        "title": "添加角色",
        "icon": "fa-user-circle",
        "href": YZ.ip + "/page/role/add"
    }, {
        "title": "角色列表",
        "icon": "fa-address-card-o",
        "href": YZ.ip + "/page/role/list"
    }]
}, {
    "title": "公司管理",
    "icon": "fa-bank",
    "spread": false,
    "children": [{
        "title": "添加公司",
        "icon": "&#xe61f;",
        "href": YZ.ip + "/page/company/add"
    }, {
        "title": "公司列表",
        "icon": "&#xe63c;",
        "href": YZ.ip + "/page/company/list"
    }]
}, {
    "title": "部门管理",
    "icon": "fa-bars",
    "spread": false,
    "children": [{
        "title": "添加部门",
        "icon": "&#xe61f;",
        "href": YZ.ip + "/page/department/add"
    }, {
        "title": "部门列表",
        "icon": "&#xe63c;",
        "href": YZ.ip + "/page/department/list"
    }]
}, {
    "title": "用户管理",
    "icon": "&#xe613;",
    "spread": false,
    "children": [{
        "title": "添加用户",
        "icon": "fa-user-o",
        "href": YZ.ip + "/page/user/add"
    }, {
        "title": "用户列表",
        "icon": "fa-address-card-o",
        "href": YZ.ip + "/page/user/list"
    }]
}, {
    "title": "工作类型管理",
    "icon": "&#xe621;",
    "spread": false,
    "children": [{
        "title": "添加工作类型",
        "icon": "&#xe61f;",
        "href": YZ.ip + "/page/jobType/add"
    }, {
        "title": "工作类型列表",
        "icon": "&#xe63c;",
        "href": YZ.ip + "/page/jobType/list"
    }]
}, {
    "title": "事务类型管理",
    "icon": "&#xe64d;",
    "spread": false,
    "children": [{
        "title": "添加事务类型",
        "icon": "&#xe61f;",
        "href": YZ.ip + "/page/transactionType/add"
    }, {
        "title": "事务类型列表",
        "icon": "&#xe63c;",
        "href": YZ.ip + "/page/transactionType/list"
    }]
},  {
    "title": "传递卡管理",
    "icon": "fa-credit-card",
    "spread": false,
    "children": [{
        "title": "添加传递卡",
        "icon": "&#xe61f;",
        "href": YZ.ip + "/page/workDiary/add"
    }, {
        "title": "传递卡列表",
        "icon": "&#xe63c;",
        "href": YZ.ip + "/page/workDiary/list"
    }]
},  {
    "title": "项目管理",
    "icon": "&#xe61d;",
    "spread": false,
    "children": [{
        "title": "添加内部项目专业",
        "icon": "&#xe61f;",
        "href": YZ.ip + "/page/project/projectMajor/add"
    }, {
        "title": "内部项目专业列表",
        "icon": "&#xe63c;",
        "href": YZ.ip + "/page/project/projectMajor/list"
    }, {
        "title": "添加项目组",
        "icon": "&#xe61f;",
        "href": YZ.ip + "/page/project/projectGroup/add"
    }, {
        "title": "项目组列表",
        "icon": "&#xe63c;",
        "href": YZ.ip + "/page/project/projectGroup/list"
    }, {
        "title": "添加内部项目",
        "icon": "&#xe61f;",
        "href": YZ.ip + "/page/project/projectInterior/add"
    }, {
        "title": "内部项目列表",
        "icon": "&#xe63c;",
        "href": YZ.ip + "/page/project/projectInterior/list"
    }, {
        "title": "添加项目类型",
        "icon": "&#xe61f;",
        "href": YZ.ip + "/page/project/projectType/add"
    }, {
        "title": "项目类型列表",
        "icon": "&#xe63c;",
        "href": YZ.ip + "/page/project/projectType/list"
    }, {
        "title": "添加外部项目",
        "icon": "&#xe61f;",
        "href": YZ.ip + "/page/project/projectExternal/add"
    }, {
        "title": "外部项目列表",
        "icon": "&#xe63c;",
        "href": YZ.ip + "/page/project/projectExternal/list"
    }]
}, {
    "title": "快捷百度一下",
    "icon": "fa-search",
    "href": "https://www.baidu.com",
    "spread": false
}];

var tab;

layui.config({
    base: YZ.ip + "/resources/js/common/",
    version: new Date().getTime()
}).use(['element', 'layer', 'navbar', 'tab'], function () {
    var element = layui.element(),
        $ = layui.jquery,
        layer = layui.layer,
        navbar = layui.navbar();
    tab = layui.tab({
        elem: '.admin-nav-card' //设置选项卡容器
        ,
        //maxSetting: {
        //	max: 5,
        //	tipMsg: '只能开5个哇，不能再开了。真的。'
        //},
        contextMenu: true,
        onSwitch: function (data) {
            console.log(data.id); //当前Tab的Id
            console.log(data.index); //得到当前Tab的所在下标
            console.log(data.elem); //得到当前的Tab大容器
            console.log(tab.getCurrentTabId())
        }
    });
    //iframe自适应
    if(isFirefox = navigator.userAgent.indexOf("Firefox") > 0){
        $(window).on('resize', function () {
            var $content = $('.admin-nav-card .layui-tab-content');
            $content.height($(document).height() - 147);
            $content.find('iframe').each(function () {
                $(this).height($content.height());
            });
        }).resize();
    }
    else {
        $(window).on('resize', function () {
            var $content = $('.admin-nav-card .layui-tab-content');
            $content.height($(this).height() - 147);
            $content.find('iframe').each(function () {
                $(this).height($content.height());
            });
        }).resize();
    }




    //设置navbar
    navbar.set({
        spreadOne: true,
        elem: '#admin-navbar-side',
        cached: true,
        data: navs
        /*cached:true,
         url: 'datas/nav.json'*/
    });
    //渲染navbar
    navbar.render();
    //监听点击事件
    navbar.on('click(side)', function (data) {
        tab.tabAdd(data.field);
    });


    //单击收起菜单
    $('.admin-side-toggle').on('click', function () {
        var sideWidth = $('#admin-side').width();
        if (sideWidth === 200) {
            $('#admin-body').animate({
                left: '0'
            }); //admin-footer
            $('#admin-footer').animate({
                left: '0'
            });
            $('#admin-side').animate({
                width: '0'
            });
        } else {
            $('#admin-body').animate({
                left: '200px'
            });
            $('#admin-footer').animate({
                left: '200px'
            });
            $('#admin-side').animate({
                width: '200px'
            });
        }
    });

    //单击全屏
    $('.admin-side-full').on('click', function () {
        var docElm = document.documentElement;
        //W3C
        if (docElm.requestFullscreen) {
            docElm.requestFullscreen();
        }
        //FireFox
        else if (docElm.mozRequestFullScreen) {
            docElm.mozRequestFullScreen();
        }
        //Chrome等
        else if (docElm.webkitRequestFullScreen) {
            docElm.webkitRequestFullScreen();
        }
        //IE11
        else if (elem.msRequestFullscreen) {
            elem.msRequestFullscreen();
        }
        layer.msg('按Esc即可退出全屏');
    });



    //锁屏
    $(document).on('keydown', function () {
        var e = window.event;
        if (e.keyCode === 76 && e.altKey) {
            //alert("你按下了alt+l");
            lock($, layer);
        }
    });
    $('#lock').on('click', function () {
        lock($, layer);
    });

    //手机设备的简单适配
    var treeMobile = $('.site-tree-mobile'),
        shadeMobile = $('.site-mobile-shade');
    treeMobile.on('click', function () {
        $('body').addClass('site-mobile');
    });
    shadeMobile.on('click', function () {
        $('body').removeClass('site-mobile');
    });
});

var isShowLock = false;
function lock($, layer) {
    if (isShowLock)
        return;
    //自定页
    layer.open({
        title: false,
        type: 1,
        closeBtn: 0,
        anim: 6,
        content: $('#lock-temp').html(),
        shade: [0.9, '#393D49'],
        success: function (layero, lockIndex) {
            isShowLock = true;
            //给显示用户名赋值
            layero.find('div#lockUserName').text('admin');
            layero.find('input[name=lockPwd]').on('focus', function () {
                    var $this = $(this);
                    if ($this.val() === '输入密码解锁..') {
                        $this.val('').attr('type', 'password');
                    }
                })
                .on('blur', function () {
                    var $this = $(this);
                    if ($this.val() === '' || $this.length === 0) {
                        $this.attr('type', 'text').val('输入密码解锁..');
                    }
                });
            //在此处可以写一个请求到服务端删除相关身份认证，因为考虑到如果浏览器被强制刷新的时候，身份验证还存在的情况
            //do something...
            //e.g.
            /*
             $.post(url,params,callback,'json');
             */
            //绑定解锁按钮的点击事件
            layero.find('button#unlock').on('click', function () {
                var $lockBox = $('div#lock-box');

                var userName = $lockBox.find('div#lockUserName').text();
                var pwd = $lockBox.find('input[name=lockPwd]').val();
                if (pwd === '输入密码解锁..' || pwd.length === 0) {
                    layer.msg('请输入密码..', {
                        icon: 2,
                        time: 1000
                    });
                    return;
                }
                unlock(userName, pwd);
            });
            /**
             * 解锁操作方法
             * @param {String} 用户名
             * @param {String} 密码
             */
            var unlock = function (un, pwd) {
                //这里可以使用ajax方法解锁
                /*$.post('api/xx',{username:un,password:pwd},function(data){
                 //验证成功
                 if(data.success){
                 //关闭锁屏层
                 layer.close(lockIndex);
                 }else{
                 layer.msg('密码输入错误..',{icon:2,time:1000});
                 }
                 },'json');
                 */
                isShowLock = false;
                //演示：默认输入密码都算成功
                //关闭锁屏层
                layer.close(lockIndex);
            };
        }
    });
};