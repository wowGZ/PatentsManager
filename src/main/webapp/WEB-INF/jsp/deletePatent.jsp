<%--
  Created by IntelliJ IDEA.
  User: WowGz
  Date: 2019/9/12/012
  Time: 20:17
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
    <title>删除专利信息</title>
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
                <%--<li><a>欢迎您！管理员<%=request.getAttribute("adminNumber")%></a></li>--%>
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
                <li class="active"><a href="">删除专利信息</a></li>
            </ul>

            <ul class="nav nav-sidebar">
                <li><a href="/patent/toPatentNews">新闻专栏</a></li>
                <li><a href="/news/toAllNews">新闻总览</a></li>
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
    <h2 class="page-header">删除专利信息</h2>
    <div>
        <%--style="position: relative; display: table-cell;text-align: center; vertical-align: middle"--%>
        <form class="form-signin" action="/patent/deletePatent" style="width: 300px; align-content: center">
            <p class="text-danger">确定删除以下信息？</p>
            <div class="row">
                <h4>专利号</h4>
                <label for="patentNumber" class="sr-only"></label>
                <input readonly type="text" id="patentNumber" name="patentNumber" class="form-control"
                       value="${patent.patentNumber}" required autofocus>
            </div>
            <div class="row">
                <h4>专利名称</h4>
                <label for="patentName" class="sr-only"></label>
                <input readonly id="patentName" name="patentName" class="form-control" value="${patent.patentName}"
                       required>
            </div>
            <div class="row">
                <h4>专利申请人</h4>
                <label for="patentee" class="sr-only"></label>
                <input readonly id="patentee" name="patentee" class="form-control" value="${patent.patentee}" required
                       autofocus>
            </div>
            <div class="row">
                <h4>专利领域</h4>
                <label for="patentField" class="sr-only"></label>
                <input readonly id="patentField" name="patentField" class="form-control" value="${patent.patentField}"
                       required>
            </div>
            <div class="row">
                <h4>专利申请年份</h4>
                <label for="patentRegistrationYear" class="sr-only"></label>
                <input readonly id="patentRegistrationYear" name="patentRegistrationYear" class="form-control"
                       value="${patent.patentRegistrationYear}" required>
            </div>
            <br>
            <button class="btn btn-lg btn-primary btn-block" type="submit">确定删除</button>
            <a class="btn btn-lg btn-primary btn-block" href="/patent/allPatents">取消</a>
        </form>
    </div>
</div>
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
