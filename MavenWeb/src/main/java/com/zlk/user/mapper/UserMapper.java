package com.zlk.user.mapper;

import com.zlk.user.entity.User;

public interface UserMapper {
    /**
     * 检验用户
     * @param user
     * @return
     */
    User findNameAndPwd(User user);

    /**
     * 根据用户名查询用户
     * @param uname
     * @return
     */
    User fingUserByName(String uname);
}
