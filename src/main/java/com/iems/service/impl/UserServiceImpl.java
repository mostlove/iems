package com.iems.service.impl;

import com.iems.entity.User;
import com.iems.mapper.IUserMapper;
import com.iems.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Eric Xie on 2017/5/29.
 */
@Service
public class UserServiceImpl implements IUserService {

    @Resource
    private IUserMapper userMapper;

    public void addUser(User user) {
        userMapper.addUser(user);
    }

    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    public User queryUserByAccount(String account) {
        return userMapper.queryUserByAccount(account);
    }
}
