package com.zlk.plan.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @ClassName： Orders
 * @Description：订单实体类
 * @Author： wy
 * @Date： 2019/9/18 14:52
 */
public class Orders {
    /*订单编号*/
    private Integer oid;
    /*订购客户*/
    private String oCname;
    /*订购产品*/
    private String oPname;
    /*订购数量*/
    private Integer onum;
    /*税前单价*/
    private Double oprice;
    /*单位*/
    private String ounit;
    /*订单状态*/
    private String ostate;
    /*订购日期*/
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date ocreatetime;
    /*要求日期*/
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date ofinishtime;
    /*订单要求*/
    private String ops;
    /*相关照片 绝对路径*/
    private String oimg;
    /*相关照片 虚拟路径*/
    private String orealimg;
    /*订单附件 虚拟路径*/
    private String oacr;

    public String getOrealimg() {
        return orealimg;
    }

    public void setOrealimg(String orealimg) {
        this.orealimg = orealimg;
    }

    public String getOrealacr() {
        return orealacr;
    }

    public void setOrealacr(String orealacr) {
        this.orealacr = orealacr;
    }

    /*订单附件 绝对路径*/
    private String orealacr;

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
    }

    public String getoCname() {
        return oCname;
    }

    public void setoCname(String oCname) {
        this.oCname = oCname;
    }

    public String getoPname() {
        return oPname;
    }

    public void setoPname(String oPname) {
        this.oPname = oPname;
    }

    public Integer getOnum() {
        return onum;
    }

    public void setOnum(Integer onum) {
        this.onum = onum;
    }

    public Double getOprice() {
        return oprice;
    }

    public void setOprice(Double oprice) {
        this.oprice = oprice;
    }

    public String getOunit() {
        return ounit;
    }

    public void setOunit(String ounit) {
        this.ounit = ounit;
    }

    public String getOstate() {
        return ostate;
    }

    public void setOstate(String ostate) {
        this.ostate = ostate;
    }

    public Date getOcreatetime() {
        return ocreatetime;
    }

    public void setOcreatetime(Date ocreatetime) {
        this.ocreatetime = ocreatetime;
    }

    public Date getOfinishtime() {
        return ofinishtime;
    }

    public void setOfinishtime(Date ofinishtime) {
        this.ofinishtime = ofinishtime;
    }

    public String getOps() {
        return ops;
    }

    public void setOps(String ops) {
        this.ops = ops;
    }

    public String getOimg() {
        return oimg;
    }

    public void setOimg(String oimg) {
        this.oimg = oimg;
    }

    public String getOacr() {
        return oacr;
    }

    public void setOacr(String oacr) {
        this.oacr = oacr;
    }

    public Orders() {
    }


}
