package com.controller;

import com.pojo.News;
import com.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by WowGz
 * User: WowGz
 * Date: 2019/09/18
 * Time: 20:01
 * Blog: https://wowgz.com.cn
 */
@Controller
@RequestMapping("/news")
public class NewsController {
    @Autowired
    private NewsService newsService;

    @RequestMapping("/newsDetail/{id}")
    String newsDetail(@PathVariable("id") int id, Model model){
        model.addAttribute("news", newsService.queryNewsById(id));
        return "newsDetail";
    }

    @RequestMapping("/toAddNews")
    String toAddNews(){
        return "addNews";
    }

    @RequestMapping("/addNews")
    String addNews(News news){
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        news.setNewsTime(dateFormat.format(date));
        newsService.addNews(news);
        return "redirect:/news/toAllNews";
    }

    @RequestMapping("toAllNews")
    String showAllNews(Model model){
        model.addAttribute("list", newsService.queryAllNews());
        return "showAllNews";
    }

    @RequestMapping("/toUpdateNews/{id}")
    String toUpdateNews(@PathVariable("id") int id, Model model){
        News news = newsService.queryNewsById(id);
        Date date = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        news.setNewsTime(dateFormat.format(date));
        model.addAttribute("news", news);
        return "updateNews";
    }

    @RequestMapping("/updateNews")
    String updateNews(News news){
        newsService.updateNews(news);
        return "redirect:/news/toAllNews";
    }

    @RequestMapping("/toDeleteNews/{id}")
    String toDeleteNews(@PathVariable("id") int id, Model model){
        model.addAttribute("news", newsService.queryNewsById(id));
        return "deleteNews";
    }

    @RequestMapping("/deleteNews")
    String deleteNews(News news){
        newsService.deleteNewsById(news.getId());
        return "redirect:/news/toAllNews";
    }

}
