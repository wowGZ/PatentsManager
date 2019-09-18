package com.service.impl;

import com.dao.NewsDao;
import com.pojo.News;
import com.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by WowGz
 * User: WowGz
 * Date: 2019/09/18
 * Time: 19:45
 * Blog: https://wowgz.com.cn
 */
@Service
public class NewsServiceImpl implements NewsService {
    @Autowired
    private NewsDao newsDao;


    @Override
    public int addNews(News news) {
        return newsDao.addNews(news);
    }

    @Override
    public int deleteNewsById(int id) {
        return newsDao.deleteNewsById(id);
    }

    @Override
    public int updateNews(News news) {
        return newsDao.updateNews(news);
    }

    @Override
    public News queryNewsById(int id) {
        return newsDao.queryNewsById(id);
    }

    @Override
    public List<News> queryAllNews() {
        return newsDao.queryAllNews();
    }
}
