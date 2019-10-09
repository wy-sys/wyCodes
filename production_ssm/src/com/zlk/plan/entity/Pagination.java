package com.zlk.plan.entity;

import java.util.List;

/**
 * @ClassName： Pagination
 * @Description：封装分页
 * @Author： wy
 * @Date： 2019/9/18 10:32
 */
public class Pagination {
    /**当前页*/
    private Integer page;
    /**每页显示的条数*/
    private Integer limit;
    /**起始页*/
    private Integer startPage;

    public Pagination() {
    }

    public Pagination(Integer page, Integer limit, Integer startPage) {
        this.page = page;
        this.limit = limit;
        this.startPage = startPage;
    }

    public Integer getStartPage() {
        return startPage;
    }
    public void setStartPage(Integer startPage) {
        this.startPage = startPage;
    }
    public Integer getPage() {
        return page;
    }
    public void setPage(Integer page) {
        this.page = page;
    }
    public Integer getLimit() {
        return limit;
    }
    public void setLimit(Integer limit) {
        this.limit = limit;
    }
}
