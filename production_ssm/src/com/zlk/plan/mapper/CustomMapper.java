package com.zlk.plan.mapper;

import com.zlk.plan.entity.Custom;
import com.zlk.plan.entity.Pagination;

import java.util.List;

public interface CustomMapper {
    /**
     * 查询所有客户信息
     * @param
     * @return
     */
    List<Custom> findAll(Pagination pagination);

    /**
     * 通过id查询
     * @param cid
     * @return
     */
    Custom findCustomById(Integer cid);
    /**
     * 查询总条数
     * @param pagination
     * @return
     */
    Integer findCount(Pagination pagination);

    /**
     * 通过id删除客户
     * @param cid
     * @return
     */
    Integer deleteCustomById(Integer cid);

    /**
     * 添加客户
     * @param custom
     * @return
     */
    Integer insertCustomById(Custom custom);

    /**
     * 通过id修改
     * @param custom
     * @return
     */
    Integer updateCustomById(Custom custom);
}
