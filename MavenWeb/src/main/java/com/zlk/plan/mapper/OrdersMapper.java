package com.zlk.plan.mapper;

import com.zlk.plan.entity.Orders;
import com.zlk.plan.entity.Pagination;

import java.util.List;

public interface OrdersMapper {
    /**
     * 查询所有订单信息
     * @param pagination
     * @return
     */
    List<Orders> findAll(Pagination pagination);

    /**
     * 通过id查询
     * @param oid
     * @return
     */
    Orders findOrdersById(Integer oid);
    /**
     * 查询总条数
     * @param pagination
     * @return
     */
    Integer findCount(Pagination pagination);

    /**
     * 通过id删除订单
     * @param oid
     * @return
     */
    Integer deleteOrdersById(Integer oid);

    /**
     * 添加订单
     * @param orders
     * @return
     */
    Integer insertOrdersById(Orders orders);

    /**
     * 通过id修改
     * @param orders
     * @return
     */
    Integer updateOrdersById(Orders orders);
}
