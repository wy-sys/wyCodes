<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/10/8
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#imgCode").click(function () {
                var time = new Date().getTime();
                $("#imgCode").attr("src","<%=request.getContextPath()%>/validateCodeServlet?time"+time)
            });
        });
    </script>
    <link rel="stylesheet" type="text/css" href="/layui/css/layui.css"/>
    <script src="/layui/layui.js" type="text/javascript"></script>
    <style type="text/css">
        body{background: #F2F2F2;padding: 0;margin: 0;}
        .div1{width: 100%;height: 150px;background: #009688;}
        .div2{width: 100%;height: 70%;}
        .p1{margin: 0 auto;text-align: center;padding-top: 120px;font-size: 20px;color: #FFFFFF;}
        .div3{background: #FFFFFF;width: 400px;height: 350px;margin: 0 auto;margin-top: 50px;
            box-shadow: 2px 2px 5px #737383;}
        .div33{margin: 50px;margin-top: 20px;}
        .p2{color: #555555;font-size: 20px;}
        .input{height: 30px;}
        .input1{width: 100px;height: 20px;}
        .login{margin-left: 100px;background-color: #01AAED;width: 100px;height: 40px;
            color: #FFFFFF;border: 0px none;font-size: 16px;}
    </style>
</head>
<body>
    <div class="div1">
        <div class="div11">
            <p class="p1">管理系统</p>
        </div>
    </div>
    <div class="div2">
        <div class="div3">
            <form action="<%=request.getContextPath()%>/user/login" class="div33" method="post">
                <br /><p class="p2">登录</p>
                <span style="color: red;">${wrong}</span><br>
                用户名：<input class="input" type="text" name="uname" placeholder="请输入管理员姓名" /><br /><br />
                密&nbsp;&nbsp;&nbsp;码：<input class="input" type="password" name="pwd" placeholder="请输入密码" /><br /><br />
                <%--验证码：<input class="input1" id="code" name="code" type="text" placeholder="请输入验证码" />
                <img id="imgCode" src="<%=request.getContextPath()%>/validateCodeServlet">
                <br /><br />--%>
                <input class="login" type="submit" value="登&nbsp;&nbsp;&nbsp;&nbsp;录" />
            </form>

        </div>
    </div>
</body>
</html>
