package com.zlk.user.controller;

import com.zlk.user.entity.User;
import com.zlk.user.service.RoleService;
import com.zlk.user.service.UserService;
import com.zlk.user.util.MD5Utils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @ClassName： UserController
 * @Description：
 * @Author： wy
 * @Date： 2019/10/8 16:25
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/toLogin")
    public String toLogin() throws Exception{
        return "login";
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) throws Exception{
        session.invalidate();
        return "login";
    }

    /**
     * 没有权限跳转
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "noPrivilegeUI")
    public String noPrivilegeUI() throws Exception{
        return "noPrivilegeUI";
    }

    @RequestMapping(value = "/login")
    public ModelAndView login(HttpServletRequest request, User user, String code) throws Exception{
        String md5 = MD5Utils.md5Encrypt32Lower(user.getPwd());
        UsernamePasswordToken token = new UsernamePasswordToken(user.getUname(), md5);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
        } catch (IncorrectCredentialsException ice) {
            // 捕获密码错误异常
            ModelAndView mv = new ModelAndView("login");
            mv.addObject("wrong", "密码不正确");
            return mv;
        } catch (UnknownAccountException uae) {
            // 捕获未知用户名异常
            ModelAndView mv = new ModelAndView("login");
            mv.addObject("wrong", "用户名不正确");
            return mv;
        } catch (ExcessiveAttemptsException eae) {
            // 捕获错误登录过多的异常
            ModelAndView mv = new ModelAndView("login");
            mv.addObject("wrong", "登陆异常");
            return mv;
        }
        User user1 = userService.findNameAndPwd(user);
        subject.getSession().setAttribute("user", user1);
        ModelAndView mv = new ModelAndView();
        mv.addObject("uname",user.getUname());
        mv.setViewName("index");
        return mv;
    }

}
