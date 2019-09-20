package com.service.impl;

import com.dao.PatentDao;
import com.pojo.Patent;
import com.service.PatentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by WowGz
 * User: WowGz
 * Date: 2019/09/12
 * Time: 9:42
 * Blog: https://wowgz.com.cn
 */
@Service
public class PatentServiceImpl implements PatentService {
    @Autowired
    private PatentDao patentDao;

    @Override
    public int addPatent(Patent patent) {
        return patentDao.addPatent(patent);
    }

    @Override
    public int deletePatentByNumber(int patentNumber) {
        return patentDao.deletePatentByNumber(patentNumber);
    }

    @Override
    public int updatePatent(Patent patent) {
        return patentDao.updatePatent(patent);
    }

    @Override
    public Patent queryPatentByNumber(int patentNumber) {
        return patentDao.queryPatentByNumber(patentNumber);
    }

    @Override
    public List<Patent> queryAllPatents() {
        return patentDao.queryAllPatents();
    }

    @Override
    public List<Patent> queryPatentsByCondition(String condition) {
        Map<String, Object> map = new HashMap<>();
        map.put("patentNumber", condition);
        map.put("patentRegistrationYear", condition);

        map.put("patentName", condition);
        map.put("patentee", condition);
        map.put("patentField", condition);

        return patentDao.findPatents(map);



//        List<Patent> resultList = new ArrayList<Patent>();
//        try {
//            int conditionInt = Integer.parseInt(condition);
//            Patent patent = patentDao.queryPatentByNumber(conditionInt);
//            if (patent != null){
//                resultList.add(patent);
//            }
//            List<Patent> listByRegistrationYear = patentDao.queryPatentByRegistrationYear(conditionInt);
//            resultList.addAll(listByRegistrationYear);
//        } catch (NumberFormatException e){
//            List<Patent> listByName = patentDao.queryPatentByName(condition);
//            List<Patent> listByPatentee = patentDao.queryPatentByPatentee(condition);
//            List<Patent> listByField = patentDao.queryPatentByField(condition);
//            resultList.addAll(listByName);
//
//            for (Patent patent :
//                    listByPatentee) {
//                for (Patent p :
//                        listByName) {
//                    if (patent.getPatentNumber() == p.getPatentNumber()){
//                        listByPatentee.remove(patent);
//                    }
//                }
//            }
//            resultList.addAll(listByPatentee);
//
//            for (Patent patent :
//                    listByField) {
//                for (Patent p :
//                        listByName) {
//                    if (patent.getPatentNumber() == p.getPatentNumber()){
//                        listByPatentee.remove(patent);
//                    }
//                }
//            }
//        }
//        return resultList;
    }

}
