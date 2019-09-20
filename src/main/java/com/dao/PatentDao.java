package com.dao;

import com.pojo.Patent;

import java.util.List;
import java.util.Map;

/**
 * Created by WowGz
 * User: WowGz
 * Date: 2019/09/12
 * Time: 9:43
 * Blog: https://wowgz.com.cn
 */
public interface PatentDao {
    int addPatent(Patent patent);

    int deletePatentByNumber(int patentNumber);

    int updatePatent(Patent patent);

    Patent queryPatentByNumber(int patentNumber);

    List<Patent> queryPatentByName(String patentName);

    List<Patent> queryPatentByPatentee(String patentee);

    List<Patent> queryPatentByField(String patentField);

    List<Patent> queryPatentByRegistrationYear(int patentRegistrationYear);

    List<Patent> queryAllPatents();

    List<Patent> findPatents(Map<String,Object> map);
}
