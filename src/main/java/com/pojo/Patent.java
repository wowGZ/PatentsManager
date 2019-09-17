package com.pojo;

import cn.afterturn.easypoi.excel.annotation.Excel;

import javax.validation.constraints.NotNull;

/**
 * Created by WowGz
 * User: WowGz
 * Date: 2019/09/12
 * Time: 9:37
 * Blog: https://wowgz.com.cn
 */
public class Patent {
    //专利号
    @Excel(name = "专利号")
    @NotNull
    private int patentNumber;
    //专利名
    @Excel(name = "专利名称")
    @NotNull
    private String patentName;
    //专利人
    @Excel(name = "专利申请人")
    @NotNull
    private String patentee;
    //专利申请年份
    @Excel(name = "专利申请年份")
    @NotNull
    private int patentRegistrationYear;
    //专利所在领域
    @Excel(name = "专利所在领域")
    @NotNull
    private String patentField;

    public int getPatentNumber() {
        return patentNumber;
    }

    public void setPatentNumber(int patentNumber) {
        this.patentNumber = patentNumber;
    }

    public String getPatentName() {
        return patentName;
    }

    public void setPatentName(String patentName) {
        this.patentName = patentName;
    }

    public String getPatentee() {
        return patentee;
    }

    public void setPatentee(String patentee) {
        this.patentee = patentee;
    }

    public String getPatentField() {
        return patentField;
    }

    public void setPatentField(String patentField) {
        this.patentField = patentField;
    }

    public int getPatentRegistrationYear() {
        return patentRegistrationYear;
    }

    public void setPatentRegistrationYear(int patentRegistrationYear) {
        this.patentRegistrationYear = patentRegistrationYear;
    }
}
