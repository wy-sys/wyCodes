package com.zlk.shiro;

import com.zlk.user.entity.User;
import com.zlk.user.entity.UserFunction;
import com.zlk.user.service.RoleService;
import com.zlk.user.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * @ClassName： UserRealm
 * @Description：自定义realm，注入给安全管理器
 * @Author： wy
 * @Date： 2019/9/23 20:46
 */
public class UserRealm extends AuthorizingRealm {
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    //认证方法
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("realm中的认证方法执行了。。。。");
        UsernamePasswordToken myToken = (UsernamePasswordToken) token;
        String loginName = myToken.getUsername();
        //根据用户名查询数据库中的用户
        User user = userService.findUserByName(loginName);
        if (user == null) {
            //用户名不存在
            return null;
        }
        //如果能查询到，再由框架比对数据库中查询到的密码和页面提交的密码是否一致
        AuthenticationInfo info = new SimpleAuthenticationInfo(loginName, user.getPwd(), this.getName());
        return info;
    }

    //授权方法
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals){
        String username =(String) principals.getPrimaryPrincipal();
        List<UserFunction> list = roleService.findFunByName(username);
        Set<String> roles = new HashSet<>();
        for(UserFunction uf:list){
            roles.add(uf.getFunName());
        }
        AuthorizationInfo info = new SimpleAuthorizationInfo(roles);
        return info;
    }

}
