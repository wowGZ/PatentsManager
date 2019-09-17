package com.service.impl;

import com.dao.AdminDao;
import com.pojo.Admin;
import com.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by WowGz
 * User: WowGz
 * Date: 2019/09/12
 * Time: 16:16
 * Blog: https://wowgz.com.cn
 */
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin queryAdminByNumber(int adminNumber) {
        return adminDao.queryAdminByNumber(adminNumber);
    }

}
