package com.zlk.plan.controller;

import com.zlk.plan.entity.Custom;
import com.zlk.plan.entity.Pagination;
import com.zlk.plan.service.CustomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName： CustomController
 * @Description： 客户增删改查
 * @Author： wy
 * @Date： 2019/9/18 10:58
 */

@Controller
@RequestMapping(value = "/custom")
public class CustomController {
    @Autowired
    private CustomService customService;

    @RequestMapping(value = "/toList")
    public String toList() throws Exception{
        return "custom";
    }

    //分页查询所有客户信息
    @RequestMapping(value = "/customList")
    @ResponseBody
    public Map<String,Object> list(Pagination pagination) throws Exception{
        List<Custom> list = customService.findAll(pagination);
        Integer count = customService.findCount(pagination);
        Map<String,Object> map = new HashMap<>();
        map.put("code","0");
        map.put("count",count);
        map.put("data",list);
        return map;
    }

    //通过id删除客户
    @RequestMapping(value = "/customDelete")
    @ResponseBody
    public String delete(Integer cid) throws Exception{
        Integer flag = customService.deleteCustomById(cid);
        if(flag == 1){
            return "删除成功！";
        }else {
            return "删除失败！";
        }
    }

    //添加客户
    @RequestMapping(value = "/customInsert")
    @ResponseBody
    public ModelAndView insert(Custom custom) throws Exception{
        ModelAndView mv = new ModelAndView();
        Integer flag = customService.insertCustomById(custom);
        if(flag == 1){
            mv.setViewName("custom");
            return mv;
        }else{
            return null;
        }
    }

    //修改客户
    @RequestMapping(value = "/customUpdate")
    public String customEdit(Custom custom) throws Exception{
        Integer flag = customService.updateCustomById(custom);
        if(flag == 1){
            return "redirect:/custom/toList";
        }else {
            return null;
        }
    }

}
