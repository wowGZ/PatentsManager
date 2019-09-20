<%--
  Created by IntelliJ IDEA.
  User: WowGz
  Date: 2019/9/18/018
  Time: 21:19
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
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>专利信息管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../../css/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<%--头部导航栏--%>
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">WowGz专利信息管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">个人中心</a></li>
            </ul>
            <%--<p class="navbar-right " style="text-align: center;color: grey;position: relative;top: 50%;">欢迎您！管理员<%=request.getAttribute("adminNumber")%></p>--%>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="/patent/allPatents">总览</a></li>
                <li><a href="/patent/toAddPatent">添加专利信息</a></li>
                <%--<li><a href="/patent/toUpdatePatent">修改专利信息</a></li>--%>
                <%--<li><a href="/patent/toDeletePatent">删除专利信息</a></li>--%>
            </ul>

            <ul class="nav nav-sidebar">
                <li><a href="/patent/toPatentNews">新闻专栏</a></li>
                <li class="active"><a href="/news/toAllNews">新闻总览</a></li>
                <li><a href="/news/toAddNews">添加新闻</a></li>
            </ul>

            <ul class="nav nav-sidebar">
                <li><a href="/patent/fileExport">文件导出</a></li>
                <li><a href="/patent/toFileImport">文件导入</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
    <h2 class="page-header">全部新闻信息</h2>
    <div class="table-responsive">
        <table class="table table-striped">
            <thead>
            <tr>
                <th class="text-center">新闻ID</th>
                <th class="text-center">新闻标题</th>
                <th class="text-center">新闻摘要</th>
                <%--<th class="text-center">新闻内容</th>--%>
                <th class="text-center">新闻时间</th>
                <th class="text-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="news" items="${requestScope.get('list')}" varStatus="status">
                <tr>
                    <td class="text-center">${news.id}</td>
                    <td class="text-center">${news.newsTitle}</td>
                    <td class="text-center">${news.newsDigest}</td>
                    <%--<td class="text-center">${news.newsContent}</td>--%>
                    <td class="text-center">${news.newsTime}</td>
                    <td class="text-center">
                        <a class="btn btn-primary" href="/news/toUpdateNews/${news.id}" >修改</a>
                        <a class="btn btn-primary" href="/news/toDeleteNews/${news.id}" >删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>

