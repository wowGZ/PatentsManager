package com.service;

import com.pojo.Patent;

import java.util.List;

/**
 * Created by WowGz
 * User: WowGz
 * Date: 2019/09/12
 * Time: 9:39
 * Blog: https://wowgz.com.cn
 */
public interface PatentService {

    int addPatent(Patent patent);

    int deletePatentByNumber(int patentNumber);

    int updatePatent(Patent patent);

    Patent queryPatentByNumber(int patentNumber);

    List<Patent> queryAllPatents();

    List<Patent> queryPatentsByCondition(String condition);



}
