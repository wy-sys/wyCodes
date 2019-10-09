<%--
  Created by IntelliJ IDEA.
  User: wy
  Date: 2019/10/8
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单列表</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/layui/css/layui.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/layui/layui.js"></script>
    <script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>

</head>
<body>
<table class="layui-table" id="test" lay-filter="test"></table>
<script type="text/javascript">

    layui.use(['layer','table','laydate','upload'],
        function() {
            var layer = layui.layer,
                $ = layui.jquery,
                table = layui.table,
                laydate = layui.laydate;

            //点击日期
            laydate.render({elem: '#date1', btns: ['confirm'], type: 'datetime'});
            laydate.render({elem: '#date2', btns: ['confirm'], type: 'datetime'});
            laydate.render({elem: '#ocreatetime', btns: ['confirm'], type: 'datetime'});
            laydate.render({elem: '#ofinishtime', btns: ['confirm'], type: 'datetime'});

            /*订单信息表*/
            table.render({
                elem: '#test',
                url:"<%=request.getContextPath()%>/orders/ordersList",
                cellMinWidth: 80,
                page : true, //开启分页
                cols: [[
                    {type:'numbers', width:30},
                    {type:'checkbox'},
                    {field:'oid', width:87, align:'center', title: '订单编号'},
                    {field:'oCname', width:87, align:'center', title: '订购客户'},
                    {field:'oPname', width:87, align:'center', title: '订购产品'},
                    {field:'onum', width:87, align:'center', title: '订购数量'},
                    {field:'oprice', width:87, align:'center', title: '税前单价'},
                    {field:'ounit', width: 70, align:'center', title: '单位'},
                    {field:'ostate', width: 87, align:'center', title: '状态'},
                    {field:'ocreatetime',width: 144, align:'center',  title: '订购日期',
                        templet:'<div>{{layui.util.toDateString(d.ocreatetime,"yyyy-MM-dd HH:mm")}}</div>',sort:true},
                    {field:'ofinishtime', width:144, align:'center', title: '要求日期',
                        templet:'<div>{{layui.util.toDateString(d.ofinishtime,"yyyy-MM-dd HH:mm")}}</div>',sort:true},
                    {field:'ops', width:87, align:'center', title: '订购要求'},
                    {templet:imgbox, width:100, align:'center', title: '相关图片'},
                    {field:'oacr', width:120, align:'center', title: '附件'},
                    {fixed:'right', width:120, align:'center', title: '操作',toolbar:'#barDemo'}
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
                            url:"<%=request.getContextPath()%>/orders/ordersDelete?oid="+data.oid,
                            success:function (msg) {
                                layer.msg(msg);
                            }
                        });
                        layer.close(index);
                    });
                } else if(obj.event === 'edit'){
                    $("#oid").val(data.oid);
                    $("#oCname").val(data.oCname);
                    $("#oPname").val(data.oPname);
                    $("#onum").val(data.onum);
                    $("#oprice").val(data.oprice);
                    $("#ounit").val(data.ounit);
                    $("#ostate").val(data.ostate);
                    $("#ocreatetime").val(data.ocreatetime);
                    $("#ofinishtime").val(data.ofinishtime);
                    $("#ops").val(data.ops);
                    $("#oimg").val(data.oimg);
                    $("#oacr").val(data.oacr);
                    layer.open({
                        type: 1,
                        title:'编辑订单',
                        area:['40%','80%'],
                        content: $('#update'),
                        btn: false
                    });
                }
            });

            //头工具栏事件,添加订单的弹窗
            table.on('toolbar(test)', function(obj){
                var data = obj.data;
                if(obj.event==='add'){
                    layer.open({
                        type: 1,
                        title:'添加订单',
                        area:['40%','80%'],
                        content: $('#add')
                    })
                }
            });


        });

    layui.use('form', function(){
        var form = layui.form,
            $ = layui.jquery,
            upload = layui.upload;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });

    function imgbox(data){
        var oimg = data.oimg;
        var img="<img src='"+oimg+"' style='width:40px;height:40px;'/>";
        return img;
    }

    layui.use('upload', function() {
        var $ = layui.jquery,
            upload = layui.upload;
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1',  //上传图片button的id
            url: '<%=request.getContextPath()%>/orders/uploadImg',
            before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            },
            done: function (res) {
                //如果上传失败
                if (res.code < 0) {
                    return layer.msg('上传失败');
                }
                //上传成功
                else if (res.code == 1) {
                    layer.msg("上传成功");
                    //这两个要跟上传图片的id对应，区别绝对路径和虚拟路径
                    $("#orealimg").val(res.realPath);//这两个要跟controller里面的“”里面对应
                    $("#oimg").val(res.imgPath);//绝对路径
                }
            },
            error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> ' +
                    '<a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    });
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<%--添加订单信息弹窗--%>
<div id="add" hidden="hidden" style="margin: 40px 70px;">
    <form class="layui-form" action="<%=request.getContextPath()%>/orders/ordersInsert">
        <%--<div class="layui-form-item">
            <label class="layui-form-label">订单编号：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="oid" placeholder="请输入订单编号">
            </div>
        </div>--%>
        <div class="layui-form-item">
            <label class="layui-form-label">订单客户：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="oCname" placeholder="请输入订单客户">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订购产品：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="oPname" placeholder="请输入订购产品">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订购数量：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="onum" placeholder="请输入订购数量">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">税前单价：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="oprice" placeholder="请输入税前单价">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单位：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="ounit" placeholder="请输入单位">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态：</label>
            <div class="layui-input-block">
                <select name="ostate" lay-verify="required">
                    <option value="">请选择状态</option>
                    <option value="未开始">未开始</option>
                    <option value="已开始">已开始</option>
                    <option value="已完成">已完成</option>
                    <option value="订单取消">订单取消</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">订购日期:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="ocreatetime" id="date1"
                       lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off">
            </div>
        </div><br><br>
        <div class="layui-inline">
            <label class="layui-form-label">要求日期:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="ofinishtime" id="date2"
                       lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off">
            </div>
        </div><br><br>

        <div class="layui-upload">
            <label class="layui-form-label">上传图片:</label>
            <button type="button" class="layui-btn" id="test1">上传图片</button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1">
                <p id="demoText"></p >
            </div>
            <input type="hidden" id="oimg" name="oimg">
            <input type="hidden" id="orealimg" name="orealimg">
        </div>

        <%--<div class="layui-upload">
            <label class="layui-form-label">上传附件:</label>
            <button type="button" class="layui-btn" id="file1">上传附件</button>
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo11">
                <p id="demoText1"></p >
            </div>
            <input type="hidden" id="oacr" name="oacr">
            <input type="hidden" id="orealacr" name="orealacr">
        </div>--%>

        <div class="layui-form-item">
            <label class="layui-form-label">订单要求：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="ops" placeholder="请输入订单要求">
            </div>
        </div>
        <input class="layui-btn" type="submit" value="提交" style="margin-left: 40px"><br><br>
    </form>
</div>

<%--编辑信息弹窗--%>
<div id="update" hidden="hidden" style="margin: 40px 70px;">
    <form class="layui-form" action="<%=request.getContextPath()%>/orders/ordersUpdate">
        <div class="layui-form-item">
            <label class="layui-form-label">订单编号：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="oid" id="oid">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订单客户：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="oCname" id="oCname">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订购产品：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="oPname" id="oPname">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">订购数量：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="onum" id="onum">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">税前单价：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="oprice" id="oprice">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单位：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="ounit" id="ounit">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">状态：</label>
            <div class="layui-input-block">
                <select name="ostate" id="ostate" lay-verify="required">
                    <option value="">请选择状态</option>
                    <option value="未开始">未开始</option>
                    <option value="已开始">已开始</option>
                    <option value="已完成">已完成</option>
                    <option value="订单取消">订单取消</option>
                </select>
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">订购日期:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="ocreatetime" id="ocreatetime"
                       lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off">
            </div>
        </div><br><br>
        <div class="layui-inline">
            <label class="layui-form-label">要求日期:</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="ofinishtime" id="ofinishtime"
                       lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off">
            </div>
        </div><br><br>

        <%--上传图片<input type="file" name="file" id="img2" onchange="uploadImg()"/>
        <input type="hidden" name="avatar" id="avatar2"/>
        <img src="" alt="" id="avatarShow2" width="100px" height="100px"/><br><br>

        上传附件：
        <input type="file" name="file" id="file" onchange="uploadImg()">
        <input type="hidden" name="avatar" id="avatar"><br><br>--%>
        <div class="layui-form-item">
            <label class="layui-form-label">订单要求：</label>
            <div class="layui-input-block">
                <input class="layui-input" type="text" name="ops" id="ops">
            </div>
        </div>
        <input class="layui-btn" type="submit" value="提交" style="margin-left: 40px"><br><br>
    </form>
</div>

</body>
</html>
