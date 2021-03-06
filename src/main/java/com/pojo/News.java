package com.pojo;

/**
 * Created by WowGz
 * User: WowGz
 * Date: 2019/09/18
 * Time: 19:37
 * Blog: https://wowgz.com.cn
 */
public class News {
    private int id;
    private String newsTitle;
    private String newsDigest;
    private String newsContent;
    private String newsTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNewsTitle() {
        return newsTitle;
    }

    public void setNewsTitle(String newsTitle) {
        this.newsTitle = newsTitle;
    }

    public String getNewsDigest() {
        return newsDigest;
    }

    public void setNewsDigest(String newsDigest) {
        this.newsDigest = newsDigest;
    }

    public String getNewsContent() {
        return newsContent;
    }

    public void setNewsContent(String newContent) {
        this.newsContent = newContent;
    }

    public String getNewsTime() {
        return newsTime;
    }

    public void setNewsTime(String newsTime) {
        this.newsTime = newsTime;
    }
}
