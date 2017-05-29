package com.iems.entity;

import java.util.Date;

/**
 * 用户 entity
 * Created by Eric Xie on 2017/1/8.
 */
public class User {

    /**主键ID*/
    private Integer id;

    /**电话号码*/
    private String phone;

    /**密码*/
    private String pwd;

    /**部门ID*/
    private Integer departmentId;

    /**性别 0：男 1：女*/
    private Integer gender;

    /**真实姓名*/
    private String realName;

    /**职位*/
    private String job;

    /**头像*/
    private String avatar;

    /**帐号状态  5001 在职  5002 离职*/
    private Integer status;

    /**入职日期*/
    private Date entryDate;

    /**创建时间*/
    private Date createTime;

    /**最后登录时间*/
    private Date lastLogin;

    private String token;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }


    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(Date lastLogin) {
        this.lastLogin = lastLogin;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
