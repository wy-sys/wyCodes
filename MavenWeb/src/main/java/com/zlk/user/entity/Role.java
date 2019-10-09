package com.zlk.user.entity;

import java.util.Date;

/**
 * @ClassName： Role
 * @Description： 角色实体类
 * @Author： wy
 * @Date： 2019/10/8 15:59
 */
public class Role {
    /*角色编号*/
    private Integer rid;
    /*角色名*/
    private String rname;
    /*创建时间*/
    private Date createTime;
    /*创建人*/
    private String createUser;

    public Integer getRid() {
        return rid;
    }

    public void setRid(Integer rid) {
        this.rid = rid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }
}
