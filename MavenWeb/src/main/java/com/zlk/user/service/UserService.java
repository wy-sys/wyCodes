package com.zlk.user.service;

import com.zlk.user.entity.User;

public interface UserService {
    /**
     * 检验用户
     * @param user
     * @return
     */
    User findNameAndPwd(User user);

    /**
     * 通过名字查询用户
     * @param uname
     * @return
     */
    User findUserByName(String uname);
}
