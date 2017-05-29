package com.iems.service;

import com.iems.entity.User;

/**
 * Created by Eric Xie on 2017/5/29.
 */
public interface IUserService {

    /**
     * 新增用户
     * @param user
     */
    void addUser(User user);

    /**
     *  更新用户
     * @param user
     */
    void updateUser(User user);


    /**
     *  查询帐号
     * @param account
     * @return
     */
    User queryUserByAccount(String account);

}
