<%--
  Created by IntelliJ IDEA.
  User: WowGz
  Date: 2019/9/19/019
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>专利信息检索系统</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="/css/carousel.css" rel="stylesheet">
</head>
<!-- NAVBAR
================================================== -->
<body>
<div class="navbar-wrapper">
    <div class="container">

        <nav class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">专利信息检索系统</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="/user/index">首页</a></li>
                        <li><a href="/user/toPatentSearch">专利检索</a></li>
                        <li><a href="/user/toNews">专利新闻</a></li>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>

<div id="myCarousel" class="carousel slide" data-ride="carousel">

    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active" style="height: 500px">
            <img style="height: 500px" class="first-slide" src="/image/1.jpg" alt="First slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>让专利查询更加方便</h1>
                    <p>本系统实现专利信息检索功能，能让您更贴心的进行专利查询。</p>
                    <p><a class="btn btn-lg btn-primary" href="/user/index" role="button">欢迎使用</a></p>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
        <div class="item" style="height: 500px">
            <img style="height: 500px" class="second-slide" src="/image/2.jpg" alt="Second slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>专利检索</h1>
                    <p>多条件查询您所需要查询的专利信息，让您更容易找到您所需要检索的专利信息</p>
                    <p><a class="btn btn-lg btn-primary" href="/user/toPatentSearch" role="button">开始查询</a></p>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
        <div class="item" style="height: 500px">
            <img style="height: 500px" class="third-slide" src="/image/3.jpg" alt="Third slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>专利新闻</h1>
                    <p>为您提供更新鲜的专利新闻，及时为您提供您所需要的专利相关信息</p>
                    <p><a class="btn btn-lg btn-primary" href="/user/toNews" role="button">开始浏览</a></p>
                    <br>
                    <br>
                    <br>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="container marketing">
    <div class="row">
        <h2 class="page-header">专利新闻</h2>
        <c:forEach var="news" items="${requestScope.get('newsList')}" varStatus="status" end="2">
            <div class="col-lg-4">
                <h2>${news.newsTitle}</h2>
                <p>${news.newsDigest}</p>
                <p>${news.newsTime}</p>
                <br>
                <p class="pull-right"><a class="btn btn-default" href="/user/toNewsDetail/${news.id}" role="button">阅读全部
                    &raquo;</a></p>
            </div>
        </c:forEach>
    </div>
</div>

    <div style="margin-right: 80px; margin-left: 80px">
        <h2 class="sub-header">专利信息</h2>
        <div class="table-responsive">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th class="text-center">专利号</th>
                    <th class="text-center">专利名称</th>
                    <th class="text-center">专利申请人</th>
                    <th class="text-center">专利领域</th>
                    <th class="text-center">专利申请年份</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="patent" items="${requestScope.get('list')}" varStatus="status">
                    <tr>
                        <td class="text-center">${patent.patentNumber}</td>
                        <td class="text-center">${patent.patentName}</td>
                        <td class="text-center">${patent.patentee}</td>
                        <td class="text-center">${patent.patentField}</td>
                        <td class="text-center">${patent.patentRegistrationYear}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

    <!-- FOOTER -->
    <footer style="margin-right: 80px; margin-left: 80px">
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>Made By Group 5  (1607084132-郭朕   160708419-陈蔚涛   1607084113-申张钰  1607084135-李春雷)</p>
    </footer>

</div><!-- /.container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="../../assets/js/vendor/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>




