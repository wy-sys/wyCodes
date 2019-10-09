package com.zlk.user.service;

import com.zlk.user.entity.UserFunction;

import java.util.List;

public interface RoleService {

    List<UserFunction> findFunByName(String uname);

}
