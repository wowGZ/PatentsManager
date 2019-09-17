<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>专利后台管理系统</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>

<div class="container" style="height: 300px; width: 300px; position: relative; top: 50%; margin-top: -200px">
    <form class="form-signin" >
        <h2 class="form-signin-heading" style="text-align: center">专利后台管理系统</h2>
        <h5 style="color: red">帐号或密码错误!</h5>
        <label for="adminNumber" class="sr-only" >管理员帐号</label>
        <input id="adminNumber" class="form-control" name="adminNumber" placeholder="请输入管理员帐号" required autofocus>
        <br>
        <label for="adminPassword" class="sr-only">密码</label>
        <input type="password" id="adminPassword" name="adminPassword" class="form-control" placeholder="请输入密码" required>
        <br>
        <button class="btn btn-lg btn-primary btn-block" type="submit" onclick="login()">登录</button>
    </form>
    <script type="text/javascript">
        function login() {
            var adminNumebr = document.getElementById("adminNumber").value;
            if (adminNumebr.length != 10) {
                alert("帐号长度不正确！");
            } else {
                var form = document.forms[0];
                form.action = "<%=basePath %>login/validate";//登录模块
                form.method = "post";
                form.submit();
            }
        }
    </script>
</div>
</body>
</html>
