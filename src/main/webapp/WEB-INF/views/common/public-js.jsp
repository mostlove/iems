<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/common/jquery-2.1.0.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/plugins/layui/layui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/plugins/layui/lay/dest/layui.all.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/angular.min.js"></script>
<%--<script type="text/javascript" src="<%=request.getContextPath()%>/resources/dataTable/js/jquery.dataTables.min.js"></script>--%>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/datatables/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/config.js"></script>
<!--时间控件-->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/My97DatePicker/WdatePicker.js"></script>

<script>

    //打印登录人信息
    console.log(YZ.getUserInfo());

    $(function () {
        $(".fa-refresh").click(function () {
            location.reload();
        });
    });

    //获取角色列表
    function getRoleList(type, selectId) {
        YZ.ajaxRequestData("get", false, YZ.ip + "/role/list", {type : type}, null , function(result){
            if(result.flag == 0 && result.code == 200){
                var html = "<option value=\"\">选择或搜索角色</option>";
                for (var i = 0; i < result.data.length; i++) {
                    if (result.data[i].id == selectId) {
                        html += "<option selected=\"selected\" value=\"" + result.data[i].id + "\">" + result.data[i].roleName + "</option>";
                    }
                    else {
                        html += "<option value=\"" + result.data[i].id + "\">" + result.data[i].roleName + "</option>";
                    }
                }
                if (result.data.length == 0) {
                    html += "<option value=\"0\" disabled>暂无</option>";
                }
                $("select[name='roleId']").html(html);
                $("select[name='roleId']").parent().parent().show();
            }
        });
    }

    //获取角色列表
    function getRoleListType(type, selectId) {

        //type：0 所有角色  1常规角色
        if (type == 0) {
            type = null;
        }
        var arr = {
            type:type
        }
        YZ.ajaxRequestData("get", false, YZ.ip + "/role/list", arr, null , function(result){
            if(result.flag == 0 && result.code == 200){
                var html = "<option value=\"\">选择或搜索角色</option>";
                for (var i = 0; i < result.data.length; i++) {
                    if (result.data[i].id == selectId) {
                        html += "<option selected=\"selected\" value=\"" + result.data[i].id + "\">" + result.data[i].roleName + "</option>";
                    }
                    else {
                        html += "<option value=\"" + result.data[i].id + "\">" + result.data[i].roleName + "</option>";
                    }
                }
                if (result.data.length == 0) {
                    html += "<option value=\"0\" disabled>暂无</option>";
                }
                $("select[name='roleId']").html(html);
                $("select[name='roleId']").parent().parent().show();
            }
        });
    }

    //获取公司列表
    function getCompanyList (selectId) {
        YZ.ajaxRequestData("get", false, YZ.ip + "/company/listForWeb", {}, null , function(result){
            if(result.flag == 0 && result.code == 200){
                var html = "<option value=\"\">选择或搜索公司</option>";
                for (var i = 0; i < result.data.length; i++) {
                    if (result.data[i].id == selectId) {
                        html += "<option selected=\"selected\" value=\"" + result.data[i].id + "\">" + result.data[i].companyName + "</option>";
                    }
                    else {
                        html += "<option value=\"" + result.data[i].id + "\">" + result.data[i].companyName + "</option>";
                    }
                }
                if (result.data.length == 0) {
                    html += "<option value=\"0\" disabled>暂无</option>";
                }
                $("select[name='companyId']").html(html);
                $("select[name='companyId']").parent().parent().show();
            }
        });
    }

    //获取公司列表
    function getCompanyListType (type,selectId) {
        YZ.ajaxRequestData("get", false, YZ.ip + "/company/listForWeb", {}, null , function(result){
            if(result.flag == 0 && result.code == 200){
                var html = "<option value=\"\">选择或搜索公司</option>";
                for (var i = 0; i < result.data.length; i++) {
                    if (result.data[i].type == type) {
                        if (result.data[i].id == selectId) {
                            html += "<option selected=\"selected\" value=\"" + result.data[i].id + "\">" + result.data[i].companyName + "</option>";
                        }
                        else {
                            html += "<option value=\"" + result.data[i].id + "\">" + result.data[i].companyName + "</option>";
                        }
                    }

                }
                if (result.data.length == 0) {
                    html += "<option value=\"0\" disabled>暂无</option>";
                }
                $("select[name='companyId']").html(html);
                $("select[name='companyId']").parent().parent().show();
            }
        });
    }

    //获取部门列表
    function getDepartmentList (companyId, type, selectId) {
        YZ.ajaxRequestData("get", false, YZ.ip + "/department/getAllDepartmentByCompanyIdForWeb", {companyId : companyId, type : type}, null , function(result){
            if(result.flag == 0 && result.code == 200){
                var html = "<option value=\"\">选择或搜索部门</option>";
                for (var i = 0; i < result.data.length; i++) {
                    if (result.data[i].id == selectId) {
                        html += "<option selected=\"selected\" value=\"" + result.data[i].id + "\">" + result.data[i].departmentName + "</option>";
                    }
                    else {
                        html += "<option value=\"" + result.data[i].id + "\">" + result.data[i].departmentName + "</option>";
                    }
                }
                if (result.data.length == 0) {
                    html += "<option value=\"0\" disabled>暂无</option>";
                }
                $("select[name='departmentId']").html(html);
                $("select[name='departmentId']").parent().parent().show();
            }
        });
    }

    //获取部门列表
    function getDepartmentListType (companyId, type, selectId) {

        var arr = {
            companyId : companyId,
            type:null
        }
        YZ.ajaxRequestData("get", false, YZ.ip + "/department/getAllDepartmentByCompanyIdForWeb", arr, null , function(result){
            if(result.flag == 0 && result.code == 200){
                var html = "<option value=\"\">选择或搜索部门</option>";
                for (var i = 0; i < result.data.length; i++) {
                    if (result.data[i].id == selectId) {
                        html += "<option selected=\"selected\" value=\"" + result.data[i].id + "\">" + result.data[i].departmentName + "</option>";
                    }
                    else {
                        html += "<option value=\"" + result.data[i].id + "\">" + result.data[i].departmentName + "</option>";
                    }
                }
                if (result.data.length == 0) {
                    html += "<option value=\"0\" disabled>暂无</option>";
                }
                $("select[name='departmentId']").html(html);
                $("select[name='departmentId']").parent().parent().show();
            }
        });
    }

    //获取公司和部门列表
    function getAllDepartment (selectId) {
        YZ.ajaxRequestData("get", false, YZ.ip + "/department/getAllForWeb", {}, null , function(result){
            if(result.flag == 0 && result.code == 200){
                var html = "<option value=\"\">选择或搜索公司和部门</option>";
                for (var i = 0; i < result.data.length; i++) {
                    if (result.data[i].id == selectId) {
                        html += "<option selected=\"selected\" value=\"" + result.data[i].id + "\">" + result.data[i].departmentName + "</option>";
                    }
                    else {
                        html += "<option value=\"" + result.data[i].id + "\">" + result.data[i].departmentName + "</option>";
                    }
                }
                if (result.data.length == 0) {
                    html += "<option value=\"0\" disabled>暂无</option>";
                }
                $("select[name='departmentId']").html(html);
                $("select[name='departmentId']").parent().parent().show();
            }
        });
    }

    //获取事务类型列表
    function getTransactionList (selectId) {
        YZ.ajaxRequestData("get", false, YZ.ip + "/transactionSub/list", {isShow : 1}, null , function(result){
            if(result.flag == 0 && result.code == 200){
                var html = "<option value=\"\">选择事务类型</option>";
                for (var i = 0; i < result.data.length; i++) {
                    if (result.data[i].id == selectId) {
                        html += "<option selected=\"selected\" transactionTypeName=\"" + result.data[i].transactionTypeName + "\" value=\"" + result.data[i].id + "\">" + result.data[i].transactionSubName + "</option>";
                    }
                    else {
                        html += "<option transactionTypeName=\"" + result.data[i].transactionTypeName + "\" value=\"" + result.data[i].id + "\">" + result.data[i].transactionSubName + "</option>";
                    }
                }
                if (result.data.length == 0) {
                    html += "<option value=\"0\" disabled>暂无</option>";
                }
                $("select[name='transactionSubId']").html(html);
            }
        });
    }

    //通过角色ID获取用户列表
    function getRoleUserList (roleId, selectId) {
        var html = "";
        YZ.ajaxRequestData("get", false, YZ.ip + "/user/queryUserByRole", {roleId : roleId }, null , function(result){
            if(result.flag == 0 && result.code == 200){
                html = "<option value=\"\">选择或搜索</option>";
                for (var i = 0; i < result.data.length; i++) {
                    if (result.data[i].id == selectId) {
                        html += "<option selected=\"selected\" value=\"" + result.data[i].id + "\">" + result.data[i].name + "</option>";
                    }
                    else {
                        html += "<option value=\"" + result.data[i].id + "\">" + result.data[i].name + "</option>";
                    }
                }
                if (result.data.length == 0) {
                    html += "<option value=\"0\" disabled>暂无</option>";
                }
            }
        });
        return html;
    }

    //通过角色ID获取用户列表之排查部门
    function getRoleDepartmentIdUserList (roleId, selectId, departmentId) {
        var html = "";
        YZ.ajaxRequestData("get", false, YZ.ip + "/user/queryUserByRole", {roleId : roleId , departmentId : departmentId}, null , function(result){
            if(result.flag == 0 && result.code == 200){
                html = "<option value=\"\">选择或搜索</option>";
                for (var i = 0; i < result.data.length; i++) {
                    if (result.data[i].id == selectId) {
                        html += "<option selected=\"selected\" value=\"" + result.data[i].id + "\">" + result.data[i].name + "</option>";
                    }
                    else {
                        html += "<option value=\"" + result.data[i].id + "\">" + result.data[i].name + "</option>";
                    }
                }
                if (result.data.length == 0) {
                    html += "<option value=\"0\" disabled>暂无</option>";
                }
            }
        });
        return html;
    }

</script>