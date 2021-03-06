<%--
  Created by IntelliJ IDEA.
  User: WowGz
  Date: 2019/9/19/019
  Time: 15:51
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
                        <li><a href="/user/index">首页</a></li>
                        <li class="active"><a href="/user/toPatentSearch">专利检索</a></li>
                        <li><a href="/user/toNews">专利新闻</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>
<div style="margin-top: 80px; margin-right: 50px; margin-left: 50px">
    <div class="row">
        <form class="navbar-form" action="/user/patentSearch">
            <div class="form-group">
                <input name="condition" type="text" placeholder="请输入您所要查找的内容" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">查找</button>
        </form>
    </div>
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
    <!-- FOOTER -->
    <footer>
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
