<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/9/16
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>

    <script>
        layui.use(['element', 'layer','table'],
            function() {
                var element = layui.element; //导航
                var layer = layui.layer;
                var $ = layui.$;
                var table = layui.table;
                var $ = layui.jquery, layer = layui.layer;

                //监听导航点击
                element.on('nav(demoNav)', function(elem) {
                        //如果点击的是条目就不切换新增选项卡。
                        $(elem).parent().hasClass("layui-nav-item") || tabChange('demoTab', elem);
                });
                //选项卡是否存在
                function tabIsExist(filter, id) {
                    //0=false, 1=true(存在一个选项卡)
                    return !! $('.layui-tab[lay-filter="' + filter + '"]').find('.layui-tab-title li[lay-id="' + id + '"]').length;
                }
                //切换、新增选项卡
                tabChange = function(filter, elem) {
                    var id = $(elem).attr('lay-id');
                    if (!tabIsExist(filter, id)) {
                        //新增一个Tab项
                        element.tabAdd(filter, {
                            id: id,
                            title: elem.text(),
                            content: '内容' + (Math.random() * 1000 | 0)
                        })
                    }
                    //切换到指定Tab项
                    element.tabChange(filter, id); //切换到
                }
                //定位菜单
                element.on('tab(demoTab)', function(elem) {
                    var filter = 'demoNav'; //菜单
                    var id = $(this).attr('lay-id');
                    var navElem = $('.layui-nav[lay-filter="' + filter + '"]'); //菜单导航元素
                    //移除所有选中、获取当前tab选择导航、标注选中样式、展开条目
                    navElem.find('dd').removeClass('layui-this').find('a[lay-id="' + id + '"]').parent().addClass('layui-this').parents('li,dl').addClass('layui-nav-itemed')
                });



            });

        /*//全局的ajax访问，处理ajax清求时session超时
        $.ajaxSetup({
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            complete:function(XMLHttpRequest,textStatus){
                //通过XMLHttpRequest取得响应头，sessionstatus，
                var sessionstatus=XMLHttpRequest.getResponseHeader("session-status");
                if(sessionstatus=="timeout"){
                    //如果超时就处理 ，指定要跳转的页面(比如登陆页)
                    window.location.replace("<%--<%=request.getContextPath()%>--%>"+"/user/toLogin");
                }
            }
        });*/

    </script>

    <style>
        .order1{background: #F2F2F2;font-weight: bold;height: 25px;border-bottom: 1px #C0C4CC solid;}
    </style>


</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">制造装备物联生产管理平台</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href=" ">
                    订单管理员：${uname}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="<%=request.getContextPath()%>/user/logout">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="demoNav">
                <li class="layui-nav-item">
                    <a href="javascript:;">计划进度</a>
                    <dl class="layui-nav-child">
                        <dd><a href="<%=request.getContextPath()%>/orders/toList" target="orders">订单管理</a></dd>
                        <dd><a href="<%=request.getContextPath()%>/custom/toList" target="orders">客户管理</a></dd>
                        <dd><a href="" target="orders">产品管理</a></dd>
                        <dd><a href="" target="orders">作业管理</a></dd>
                        <dd><a href="" target="orders">生产计划管理</a></dd>
                        <dd><a href="" target="orders">生产派工管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">设备管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="" target="orders">设备台账</a></dd>
                        <dd><a href="" target="orders">设备种类</a></dd>
                        <dd><a href="" target="orders">设备例检</a></dd>
                        <dd><a href="" target="orders">设备故障</a></dd>
                        <dd><a href="" target="orders">设备维修</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">工艺监控</a>
                    <dl class="layui-nav-child">
                        <dd><a href="" target="orders">工艺管理</a></dd>
                        <dd><a href="" target="orders">工艺要求</a></dd>
                        <dd><a href="" target="orders">工艺计划</a></dd>
                        <dd><a href="" target="orders">工序管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">物料监控</a>
                    <dl class="layui-nav-child">
                        <dd><a href="" target="orders">物料信息</a></dd>
                        <dd><a href="" target="orders">物料收入</a></dd>
                        <dd><a href="" target="orders">物料消耗</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">质量监控</a>
                    <dl class="layui-nav-child">
                        <dd><a href="" target="orders">不合格品管理</a></dd>
                        <dd><a href="" target="orders">成品计量监控</a></dd>
                        <dd><a href="" target="orders">成品计数监制</a></dd>
                        <dd><a href="" target="orders">工序计量质检</a></dd>
                        <dd><a href="" target="orders">工序计数质检</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">人员监控</a>
                    <dl class="layui-nav-child">
                        <dd><a href="" target="orders">部门管理</a></dd>
                        <dd><a href="" target="orders">员工管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">系统管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" target="orders">用户管理</a></dd>
                        <dd><a href="javascript:;" target="orders">角色管理</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div>
        <iframe name="orders" style="width: 100%; height: 90%;border: 0 none;vertical-align: middle;
                margin-left: 200px" frameborder="1"></iframe>
    </div>

</div>

</body>
</html>
