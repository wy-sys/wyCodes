package com.zlk.user.service.impl;

import com.zlk.user.entity.UserFunction;
import com.zlk.user.mapper.RoleMapper;
import com.zlk.user.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName： RoleServiceImpl
 * @Description：
 * @Author： wy
 * @Date： 2019/9/26 10:37
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<UserFunction> findFunByName(String uname) {
        return roleMapper.findFunByName(uname);
    }
}
