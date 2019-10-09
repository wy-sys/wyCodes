<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/10/8
  Time: 16:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>客户信息</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
</head>
<body>
<table class="layui-table" id="test" lay-filter="test"></table>
<script type="text/javascript">

    layui.use(['layer','table','form'],
        function() {
            var layer = layui.layer;
            var $ = layui.jquery;
            var table = layui.table;
            var form = layui.form;



            /*客户信息表*/
            table.render({
                elem: '#test', //这个跟table标签里面的id对应
                url:"<%=request.getContextPath()%>/custom/customList",
                cellMinWidth: 80,
                page : true, //开启分页
                cols: [[
                    {type:'numbers', width:30},
                    {type:'checkbox'},
                    {field:'cid', width:90, align:'center', title: '客户编号'},
                    {field:'cname', width:100, align:'center', title: '客户名称'},
                    {field:'crealname', width:161, align:'center', title: '客户全称'},
                    {field:'caddress', width:130, align:'center', title: '地址'},
                    {field:'cfax', width: 100, align:'center', title: '传真'},
                    {field:'cemail', width: 137, align:'center', title: '邮箱'},
                    {field:'cadmin', width: 90, align:'center', title: '经理姓名'},
                    {field:'cphone',width: 130, align:'center',  title: '电话'},
                    {field:'cstate', width:100, align:'center', title: '客户状态'},
                    {field:'cps', width:100, align:'center', title: '备注'},
                    {fixed:'right', width:130, align:'center', title: '操作',toolbar:'#barDemo'}
                ]],
                toolbar:'<div class="site-demo-button" id="layerDemo">\n' +
                    '    <button data-method="offset" data-type="auto" class="layui-btn layui-btn-normal"\n' +
                    '            lay-event="add" onclick="insert()">添加</button>\n' +
                    '    </div>'
            });


            //监听行工具事件
            table.on('tool(test)', function(obj){
                var data = obj.data;
                if(obj.event === 'del'){
                    layer.confirm('真的删除行么', function(index){
                        obj.del();
                        $.ajax({
                            type:'POST',
                            url:"<%=request.getContextPath()%>/custom/customDelete?cid="+data.cid,
                            success:function (msg) {
                                layer.msg(msg);
                            }
                        });
                        layer.close(index);
                    });
                } else if(obj.event === 'edit'){
                    $("#cid").val(data.cid);
                    $("#cname").val(data.cname);
                    $("#crealname").val(data.crealname);
                    $("#caddress").val(data.caddress);
                    $("#cfax").val(data.cfax);
                    $("#cemail").val(data.cemail);
                    $("#cadmin").val(data.cadmin);
                    $("#cphone").val(data.cphone);
                    $("#cstate").val(data.cstate);
                    $("#cps").val(data.cps);
                    layer.open({
                        type: 1,
                        title:'编辑客户',
                        area:['40%','80%'],
                        content: $('#update'),
                        btn: false
                    });
                }
            });

            //头工具栏事件,添加客户的弹窗
            table.on('toolbar(test)', function(obj){
                var data = obj.data;
                if(obj.event==='add'){
                    layer.open({
                        type: 1,
                        title:'添加客户',
                        area:['40%','80%'],
                        content: $('#add')
                    })
                }
            });

        });


</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<%--添加信息弹窗--%>
<div id="add" hidden="hidden" style="margin: 40px 70px;">
    <form class="layui-form" action="<%=request.getContextPath()%>/custom/customInsert">
        <%--<div class="layui-form-item">
            <label class="layui-form-label">客户编号：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cid" placeholder="请输入客户编号">
            </div>
        </div>--%>
        <div class="layui-form-item">
            <label class="layui-form-label">客户名称：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cname" placeholder="请输入客户名称">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">客户全称：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="crealname" placeholder="请输入客户全称">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地址：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="caddress" placeholder="请输入地址">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">传真：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cfax" placeholder="请输入传真">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cemail" placeholder="请输入邮箱">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">经理姓名：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cadmin" placeholder="请输入经理姓名">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系电话：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cphone" placeholder="请输入联系电话">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">客户状态：</label>
            <div class="layui-input-block">
                <select name="cstate" lay-verify="required">
                    <option value=""></option>
                    <option value="有效客户">有效客户</option>
                    <option value="无效客户">无效客户</option>
                    <option value="未知状态">未知状态</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">客户介绍：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cps" placeholder="请输入客户介绍">
            </div>
        </div>
        <input class="layui-btn" type="submit" value="提交" style="margin-left: 40px">
    </form>
</div>

<%--编辑信息弹窗--%>
<div id="update" hidden="hidden" style="margin: 40px 70px;">
    <form class="layui-form" action="<%=request.getContextPath()%>/custom/customUpdate">
        <div class="layui-form-item">
            <label class="layui-form-label">客户编号：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cid" id="cid">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">客户名称：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cname" id="cname">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">客户全称：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="crealname" id="crealname">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">地址：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="caddress" id="caddress">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">传真：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cfax" id="cfax">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">邮箱：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cemail" id="cemail">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">经理姓名：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cadmin" id="cadmin">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系电话：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cphone" id="cphone">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态：</label>
            <div class="layui-input-block">
                <select name="cstate" id="cstate" lay-verify="required">
                    <option value=""></option>
                    <option value="有效客户">有效客户</option>
                    <option value="无效客户">无效客户</option>
                    <option value="未知状态">未知状态</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">客户介绍：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="cps" id="cps">
            </div>
        </div>
        <input class="layui-btn" type="submit" value="提交" style="margin-left: 40px">
    </form>
</div>

</body>
</html>
