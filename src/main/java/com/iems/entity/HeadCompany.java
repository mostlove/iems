package com.iems.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * 总公司 entity
 * Created by Eric Xie on 2017/5/29.
 */
public class HeadCompany implements Serializable {

    /**主键ID*/
    private Integer id;

    /**总公司名字*/
    private String headCompanyName;

    /**创建时间*/
    private Date createTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHeadCompanyName() {
        return headCompanyName;
    }

    public void setHeadCompanyName(String headCompanyName) {
        this.headCompanyName = headCompanyName;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
