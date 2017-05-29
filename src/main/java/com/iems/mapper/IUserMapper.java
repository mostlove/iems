package com.iems.mapper;

import com.iems.entity.User;
import org.apache.ibatis.annotations.Param;

/**
 * 用户 Mapper
 * Created by Eric Xie on 2017/5/29.
 */
public interface IUserMapper {


    /**
     * 新增用户
     * @param user
     * @return 影响行数
     */
    Integer addUser(@Param("user") User user);

    /**
     * 根据ID 更新不为空的字段
     * @param user 用户
     * @return 影响行数
     */
    Integer updateUser(@Param("user") User user);

    /**
     * 根据帐号查询用户
     * @param account 帐号
     * @return 用户
     */
    User queryUserByAccount(@Param("account") String account);



}
