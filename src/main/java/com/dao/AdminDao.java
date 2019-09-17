package com.dao;

import com.pojo.Admin;

/**
 * Created by WowGz
 * User: WowGz
 * Date: 2019/09/12
 * Time: 16:15
 * Blog: https://wowgz.com.cn
 */
public interface AdminDao {
    Admin queryAdminByNumber(int adminNumber);
}
