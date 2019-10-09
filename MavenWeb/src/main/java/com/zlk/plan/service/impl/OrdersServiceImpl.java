package com.zlk.plan.service.impl;

import com.zlk.plan.entity.Orders;
import com.zlk.plan.entity.Pagination;
import com.zlk.plan.mapper.OrdersMapper;
import com.zlk.plan.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName： OrdersServiceImpl
 * @Description：
 * @Author： wy
 * @Date： 2019/10/8 16:17
 */
@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrdersMapper ordersMapper;

    @Override  //查询所有订单信息
    public List<Orders> findAll(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return ordersMapper.findAll(pagination);
    }

    @Override //通过id查询订单
    public Orders findOrdersById(Integer oid) {
        return ordersMapper.findOrdersById(oid);
    }

    @Override  //总条数
    public Integer findCount(Pagination pagination) {
        return ordersMapper.findCount(pagination);
    }

    @Override //通过id删除订单
    public Integer deleteOrdersById(Integer oid) {
        return ordersMapper.deleteOrdersById(oid);
    }

    @Override //添加订单
    public Integer insertOrdersById(Orders orders) {
        return ordersMapper.insertOrdersById(orders);
    }

    @Override //通过id修改
    public Integer updateOrdersById(Orders orders) {
        return ordersMapper.updateOrdersById(orders);
    }
}
