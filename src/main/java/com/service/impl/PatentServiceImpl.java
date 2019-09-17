package com.service.impl;

import com.dao.PatentDao;
import com.pojo.Patent;
import com.service.PatentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
