package com.controller;

import com.pojo.Admin;
import com.pojo.News;
import com.pojo.Patent;
import com.service.AdminService;
import com.service.NewsService;
import com.service.PatentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Collections;
import java.util.Comparator;
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
    @Autowired
    private NewsService newsService;

    @RequestMapping("/validate")
    public String validate(Model model, Admin admin, HttpServletRequest request) {
        if (adminService.queryAdminByNumber(admin.getAdminNumber()) != null) {
            Admin resultAdmin = adminService.queryAdminByNumber(admin.getAdminNumber());
            if (resultAdmin.getAdminPassword() != admin.getAdminPassword()) {
                return "reInputIndex";
            } else {
                List<News> newsList = newsService.queryAllNews();
                Collections.sort(newsList, new Comparator<News>() {
                    @Override
                    public int compare(News o1, News o2) {
                        return o2.getNewsTime().compareTo(o1.getNewsTime());
                    }
                });
                model.addAttribute("newsList", newsList);

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
