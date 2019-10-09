package com.zlk.plan.controller;

import com.zlk.plan.entity.Orders;
import com.zlk.plan.entity.Pagination;
import com.zlk.plan.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName： OrdersController
 * @Description：
 * @Author： wy
 * @Date： 2019/10/8 16:18
 */
@Controller
@RequestMapping(value = "/orders")
public class OrdersController {

    @Autowired
    private OrdersService ordersService;

    @RequestMapping(value = "/toList")
    public String toList() throws Exception{
        return "orders";
    }

    //分页查询所有的订单信息
    @RequestMapping(value = "/ordersList")
    @ResponseBody
    public Map<String,Object> list(Pagination pagination) throws Exception{
        List<Orders> list = ordersService.findAll(pagination);
        Integer count = ordersService.findCount(pagination);
        Map<String,Object> map = new HashMap<>();
        map.put("code","0");
        map.put("count",count);
        map.put("data",list);
        return map;
    }

    //删除
    @RequestMapping(value = "/ordersDelete")
    @ResponseBody
    public String delete(Integer oid) throws Exception{
        Integer flag = ordersService.deleteOrdersById(oid);
        if(flag == 1){
            return "删除成功";
        }else{
            return "删除失败";
        }
    }

    //添加订单
    @RequestMapping(value = "/ordersInsert")
    @ResponseBody
    public ModelAndView insert(Orders orders) throws Exception{
        ModelAndView mv = new ModelAndView();
        Integer flag = ordersService.insertOrdersById(orders);
        if(flag == 1){
            mv.setViewName("orders");
            return mv;
        }else{
            return null;
        }
    }

    //修改订单
    @RequestMapping(value = "/ordersUpdate")
    public String update(Orders orders) throws Exception{
        Integer flag = ordersService.updateOrdersById(orders);
        if(flag == 1){
            return "redirect:/orders/toList";
        }else{
            return null;
        }
    }

    //上传图片
    @RequestMapping(value = "/uploadImg")
    @ResponseBody
    public Map uploadImg(@RequestParam(value = "file",required = false) MultipartFile file, HttpServletRequest request){
        Map map=new HashMap();
        //绝对路径
        String realPath="";
        //虚拟路径
        String imgPath="";
        if(file !=null){
            String originalName=file.getOriginalFilename();
            String lastStr=originalName.substring(originalName.lastIndexOf(".")+1);
            String dateStr=String.valueOf(new Date().getTime());
            //把图片的名字改为时间戳，防止重复
            String imgName=dateStr+"."+lastStr;
            realPath="D:\\upload\\"+imgName;
            imgPath="/upload/"+imgName;
            //通过复制表单中的图片来放到绝对路径中
            File files=new File(realPath);
            try {
                file.transferTo(files);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        map.put("code",1);
        map.put("realPath",realPath);//绝对路径
        map.put("imgPath", imgPath);//虚拟路径
        return map;
    }

}
