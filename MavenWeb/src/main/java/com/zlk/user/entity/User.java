package com.zlk.user.entity;

import java.util.Date;

/**
 * @ClassName： User
 * @Description： 用户实体类
 * @Author： wy
 * @Date： 2019/10/8 15:58
 */
public class User {
    /*用户id*/
    private Integer uid;
    /*用户名*/
    private String uname;
    /*密码*/
    private String pwd;
    /*电话*/
    private String phone;
    /*身份证号*/
    private String card;
    /*省市*/
    private String provice;
    /*城市*/
    private String city;
    /*区*/
    private String area;
    /*地址*/
    private String address;
    /*状态*/
    private String status;
    /*创建时间*/
    private Date createTime;
    /*创建人*/
    private String createUser;
    /*修改时间*/
    private Date updateTime;
    /*修改人*/
    private String updateUser;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCard() {
        return card;
    }

    public void setCard(String card) {
        this.card = card;
    }

    public String getProvice() {
        return provice;
    }

    public void setProvice(String provice) {
        this.provice = provice;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateUser() {
        return updateUser;
    }

    public void setUpdateUser(String updateUser) {
        this.updateUser = updateUser;
    }
}
