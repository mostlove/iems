package com.iems.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 部门 entity
 * Created by Eric Xie on 2017/5/29.
 */
public class Department implements Serializable {

    /**主键ID*/
    private Integer id;

    /**部门名字*/
    private String departmentName;

    /**公司ID*/
    private Integer companyId;

    /**部门类型： 0：总公司部门 1：分公司部门*/
    private Integer type;

    /**创建时间*/
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
