package com.controller;

import com.pojo.News;
import com.pojo.Patent;
import com.service.NewsService;
import com.service.PatentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * Created by WowGz
 * User: WowGz
 * Date: 2019/09/19
 * Time: 10:59
 * Blog: https://wowgz.com.cn
 */
@Controller
@RequestMapping("/user")
public class CommonUserController {
    @Autowired
    private PatentService patentService;
    @Autowired
    private NewsService newsService;

    @RequestMapping("/index")
    public String toUserIndex(Model model){
        List<News> newsList = newsService.queryAllNews();
        Collections.sort(newsList, new Comparator<News>() {
            @Override
            public int compare(News o1, News o2) {
                return o2.getNewsTime().compareTo(o1.getNewsTime());
            }
        });
        model.addAttribute("newsList", newsList);

        List<Patent> list = patentService.queryAllPatents();
        model.addAttribute("list", list);
        return "userIndex";
    }

    @RequestMapping("/toPatentSearch")
    public String toPatentSearch(Model model){
        List<Patent> list = patentService.queryAllPatents();
        model.addAttribute("list", list);
        return "userPatentSearch";
    }

    @RequestMapping("/patentSearch")
    public String patentSearch(Model model, String condition){
        if (condition.isEmpty()){
            return "redirect:/user/toPatentSearch";
        }
        List<Patent> list = patentService.queryPatentsByCondition(condition);
        model.addAttribute("list", list);
        return "userPatentSearch";
    }

    @RequestMapping("/toNews")
    public String toNews(Model model){
        List<News> list = newsService.queryAllNews();
        model.addAttribute("list", list);
        return "userNews";
    }

    @RequestMapping("/toNewsDetail/{id}")
    public String toNewsDetail(Model model, @PathVariable("id")int id){
        model.addAttribute("news", newsService.queryNewsById(id));
        return "userNewsDetail";
    }

}
