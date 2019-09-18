package com.dao;

import com.pojo.News;

import java.util.List;

/**
 * Created by WowGz
 * User: WowGz
 * Date: 2019/09/18
 * Time: 19:44
 * Blog: https://wowgz.com.cn
 */
public interface NewsDao {

    int addNews(News news);

    int deleteNewsById(int id);

    int updateNews(News news);

    News queryNewsById(int id);

    List<News> queryAllNews();

}
