package com.zlk.shiro;

import org.apache.shiro.web.filter.AccessControlFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * @ClassName： LoginFilter
 * @Description： 判断登录过滤器
 * @Author： wy
 * @Date： 2019/9/26 14:58
 */
public class LoginFilter extends AccessControlFilter {
    @Override  //是否允许访问
    protected boolean isAccessAllowed(ServletRequest servletRequest,
                                      ServletResponse servletResponse, Object o) throws Exception {
        return false;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        return false;
    }
}
