package com.zlk.user.mapper;

import com.zlk.user.entity.UserFunction;

import java.util.List;

public interface RoleMapper {
    List<UserFunction> findFunByName(String uname);

}
