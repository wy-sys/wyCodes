package com.zlk.plan.service.impl;

import com.zlk.plan.entity.Custom;
import com.zlk.plan.entity.Pagination;
import com.zlk.plan.mapper.CustomMapper;
import com.zlk.plan.service.CustomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName： CustomServiceImpl
 * @Description：
 * @Author： wy
 * @Date： 2019/10/8 16:13
 */
@Service
public class CustomServiceImpl implements CustomService {

    @Autowired
    private CustomMapper customMapper;

    @Override  //查询所有的客户信息
    public List<Custom> findAll(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return customMapper.findAll(pagination);
    }

    @Override  //通过id查询
    public Custom findCustomById(Integer cid) {
        return customMapper.findCustomById(cid);
    }

    @Override //总条数
    public Integer findCount(Pagination pagination) {
        return customMapper.findCount(pagination);
    }

    @Override //通过id删除客户
    public Integer deleteCustomById(Integer cid) {
        return customMapper.deleteCustomById(cid);
    }

    @Override  //添加客户
    public Integer insertCustomById(Custom custom) {
        return customMapper.insertCustomById(custom);
    }

    @Override  //通过id修改客户
    public Integer updateCustomById(Custom custom) {
        return customMapper.updateCustomById(custom);
    }

}
