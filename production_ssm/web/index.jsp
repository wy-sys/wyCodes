<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/9/16
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页跳转</title>
    <script type="text/javascript">
        location.href="<%=request.getContextPath()%>/user/toLogin";
    </script>
</head>
<body>

</body>
</html>
