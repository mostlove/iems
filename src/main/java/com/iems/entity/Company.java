package com.iems.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 分公司 entity
 * Created by Eric Xie on 2017/5/29.
 */
public class Company implements Serializable {

    /**主键ID*/
    private Integer id;

    /**分公司公司名字*/
    private String companyName;

    /**总公司ID*/
    private Integer headCompanyId;

    /**创建时间*/
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public Integer getHeadCompanyId() {
        return headCompanyId;
    }

    public void setHeadCompanyId(Integer headCompanyId) {
        this.headCompanyId = headCompanyId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
