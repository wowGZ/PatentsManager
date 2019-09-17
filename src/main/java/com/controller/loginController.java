package com.controller;

import com.pojo.Admin;
import com.pojo.Patent;
import com.service.AdminService;
import com.service.PatentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by WowGz
 * User: WowGz
 * Date: 2019/09/12
 * Time: 16:10
 * Blog: https://wowgz.com.cn
 */
@Controller
@RequestMapping("/login")
public class loginController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private PatentService patentService;

    @RequestMapping("/validate")
    public String validate(Model model, Admin admin, HttpServletRequest request) {
        if (adminService.queryAdminByNumber(admin.getAdminNumber()) != null) {
            Admin resultAdmin = adminService.queryAdminByNumber(admin.getAdminNumber());
            if (resultAdmin.getAdminPassword() != admin.getAdminPassword()) {
                return "reInputIndex";
            } else {
                List<Patent> list = patentService.queryAllPatents();
                model.addAttribute("list",list);
                request.setAttribute("adminNumber", resultAdmin.getAdminNumber());
                return "patentManagement";
            }
        } else {
            return "reInputIndex";
        }

    }

}
