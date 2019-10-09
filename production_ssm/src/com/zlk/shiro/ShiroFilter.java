package com.zlk.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName： ShiroFilter
 * @Description： Shiro Filter工具类
 * @Author： wy
 * @Date： 2019/9/26 14:27
 */
public class ShiroFilter {

    final static Class<? extends ShiroFilter> CLAZZ = ShiroFilter.class;
    //登录页面
    static final String loginUrl="/user/toLogin";
    //没有授权提醒
    static final String noPrivilegeUI = "/user/noPrivilegeUI";

    /**
     *是否是Ajax请求,如果是ajax请求响应头会有，x-requested-with
     * @param request
     * @return
     */
    public static boolean isAjax(ServletRequest request){
        return "XMLHttpRequest".equalsIgnoreCase(((HttpServletRequest)request).getHeader("X-Requested-With"));
    }

    /**
     * response 设置超时
     */
    public static void out(ServletResponse servletResponse){
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        response.setCharacterEncoding("UTF-8");
        //在响应头设置session状态
        response.setHeader("session-status", "timeout");
    }

}
