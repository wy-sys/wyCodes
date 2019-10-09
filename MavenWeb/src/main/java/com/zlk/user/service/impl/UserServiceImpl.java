package com.zlk.user.service.impl;

import com.zlk.user.entity.User;
import com.zlk.user.mapper.UserMapper;
import com.zlk.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName： UserServiceImpl
 * @Description：
 * @Author： wy
 * @Date： 2019/10/8 16:04
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User findNameAndPwd(User user) {
        return userMapper.findNameAndPwd(user);
    }

    @Override
    public User findUserByName(String uname) {
        return userMapper.fingUserByName(uname);
    }
}
