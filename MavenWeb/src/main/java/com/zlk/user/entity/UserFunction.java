package com.zlk.user.entity;

import java.util.Date;

/**
 * @ClassName： UserFunction
 * @Description： 权限实体类
 * @Author： wy
 * @Date： 2019/10/8 15:58
 */
public class UserFunction {
    /*权限id*/
    private Integer funId;
    /*权限名称*/
    private String funName;
    /*权限路径*/
    private String url;
    /*权限状态*/
    private String status;
    /*权限创建人*/
    private String createUser;
    /*权限创建时间*/
    private Date createTime;
    /*父权限*/
    private Integer pid;

    public Integer getFunId() {
        return funId;
    }

    public void setFunId(Integer funId) {
        this.funId = funId;
    }

    public String getFunName() {
        return funName;
    }

    public void setFunName(String funName) {
        this.funName = funName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }
}
