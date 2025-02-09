<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: He Guo
  Date: 2021/5/9
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <jsp:include page="../commons/metas.jsp" />
    <title>Title</title>
    <jsp:include page="../commons/styles.jsp" />
    <style>
        .layui-form-checkbox {
            margin-top: 6px !important;
        }
    </style>
</head>
<body>
<div class="layuimini-container">
    <div class="layuimini-main">
        <div class="layui-fluid">
            <div class="layui-card">
                <div class="layui-card-body" style="padding-top: 40px;">
                    <div class="layui-carousel" id="stepForm" lay-filter="stepForm" style="margin: 0 auto;">
                        <div carousel-item>
                            <div>
                                <form class="layui-form" style="margin: 0 auto;max-width: 560px;padding-top: 40px;">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">试卷名称</label>
                                        <div class="layui-input-block">
                                            <input type="text" name="examName" placeholder="请填写考试名称" lay-verify="required" class="layui-input" required />
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">考试时间</label>
                                        <div class="layui-input-block">
                                            <input type="text" id="date_time_range" name="examTime" lay-verify="required" class="layui-input" placeholder="考试时间">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">单选题分数</label>
                                        <div class="layui-input-block">
                                            <input type="number" name="single" lay-verify="number" autocomplete="off" placeholder="单选题每题分数" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">多选题分数</label>
                                        <div class="layui-input-block">
                                            <input type="number" name="multiple" lay-verify="number" autocomplete="off" placeholder="多选题每题分数" class="layui-input">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <button class="layui-btn" lay-submit lay-filter="formStep">
                                                &emsp;提交试卷信息，下一步&emsp;
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div>
                                <form class="layui-form" style="margin: 0 auto;max-width: 660px;padding-top: 40px;">
                                    <div class="layui-form-item">
                                        <label class="layui-form-label">选择题目</label>
                                        <div class="layui-input-inline" style="width: 465px;">
                                            <input type="text" name="questionIds" id="questionIds" placeholder="选择完成的题目题号将显示出来" autocomplete="off" class="layui-input" id="demo" ts-selected="">
                                        </div>
                                    </div>
                                    <div class="layui-form-item">
                                        <div class="layui-input-block">
                                            <button class="layui-btn" lay-submit lay-filter="formStep2">
                                                &emsp;选题完成，下一步&emsp;
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div>
                                <div style="text-align: center;margin-top: 90px;">
                                    <i class="layui-icon layui-circle"
                                       style="color: white;font-size:30px;font-weight:bold;background: #52C41A;padding: 20px;line-height: 80px;">&#xe605;</i>
                                    <div style="font-size: 24px;color: #333;font-weight: 500;margin-top: 30px;">
                                        创建成功
                                    </div>
                                    <div style="font-size: 14px;color: #666;margin-top: 20px;">考试将会在考试开始时生效</div>
                                </div>
                                <div style="text-align:center; margin-top: 50px;">
                                    <button class="layui-btn next">再次创建</button>
                                    <button class="layui-btn layui-btn-primary layui-border-green" id="closeSelf">退出</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../commons/scripts.jsp" />
<script>
    layui.use(['table', 'form', 'step', 'tableSelect', 'laydate'], function () {
        var $ = layui.$,
            form = layui.form,
            step = layui.step,
            table = layui.table,
            tableSelect = layui.tableSelect,
            laydate = layui.laydate;

        // 日期
        laydate.render({
            elem: '#date_time_range',
            type: 'datetime',
            range: true
        });

        // 分步
        step.render({
            elem: '#stepForm',
            filter: 'stepForm',
            width: '100%', //设置容器宽度
            stepWidth: '750px',
            height: '500px',
            stepItems: [{
                title: '创建试卷'
            }, {
                title: '添加试题'
            }, {
                title: '发布考试'
            }]
        });

        form.on('submit(formStep)', function (data) {
            console.log("试卷操作", data);
            layer.confirm('确认考试信息填写无误？', function (index) {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/exam/addExam",
                    data: {
                        classId: sessionStorage.getItem("examClassId"),
                        examName: data.field.examName,
                        examTime: data.field.examTime,
                        single: data.field.single,
                        multiple: data.field.multiple
                    },
                    traditional: true,
                    success: function(data){
                        console.log(data);
                        // layer.msg(data.message);
                        // 判断返回的数据是json还是字符串
                        if(typeof data === 'string') {
                            data = JSON.parse(data);
                        }
                        if(data.code === 0) {
                            step.next('#stepForm');
                            layer.close(index);
                            layer.msg(data.message, {icon: 1});
                        } else if (data.code === 1) {
                            layer.msg(data.message, {icon: 2});
                        } else if (data.code === -1) {
                            layer.msg(data.message, {icon: 7}, function(){
                                top.location.href = '${pageContext.request.contextPath}/login';
                            });
                        }
                    }
                });
            });
            return false;
        });

        form.on('submit(formStep2)', function (data) {
            console.log("试题添加");
            layer.confirm('确认要添加这些题目吗？', function (index) {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/exam/addExamQuestion",
                    data: {
                        questionIds: data.field.questionIds
                    },
                    traditional: true,
                    success: function(data){
                        console.log(data);
                        // layer.msg(data.message);
                        // 判断返回的数据是json还是字符串
                        if(typeof data === 'string') {
                            data = JSON.parse(data);
                        }
                        if(data.code === 0) {
                            step.next('#stepForm');
                            layer.close(index);
                            layer.msg(data.message, {icon: 1});
                        } else if (data.code === 1) {
                            layer.msg(data.message, {icon: 2});
                        } else if (data.code === -1) {
                            layer.msg(data.message, {icon: 7}, function(){
                                top.location.href = '${pageContext.request.contextPath}/login';
                            });
                        }
                    }
                });
            });
            return false;
        });

        tableSelect.render({
            elem: '#questionIds',
            searchType: 'more',
            searchList: [
                {searchKey: 'questionname', searchPlaceholder: '搜索用户姓名'},
                {searchKey: 'belongclass', searchPlaceholder: '班级id'},
            ],
            checkedKey: 'id',
            searchPlaceholder: '输入关键字查询你要寻找的题目',
            table: {
                url: '${pageContext.request.contextPath}/tiku/findQuestion',
                method: "post",
                parseData: function(res){ //res 即为原始返回的数据
                    return {
                        "code": res.code, //解析接口状态
                        "msg": res.message, //解析提示文本
                        "count": res.total, //解析数据长度
                        "data": res.data //解析数据列表
                    };
                },
                where: {
                    belongclass: sessionStorage.getItem("examClassId")
                },
                cols: [[
                    {type: "checkbox"},
                    {field: 'id', width: 80, title: '序号', type:'numbers'},
                    {field: 'questionname', width: 150, title: '问题描述'},
                    {field: 'ismulti', width: 80, title: '选择题类型', templet: function(d){
                            if(d.ismulti === 1){
                                return '多选'
                            }else{
                                return '单选'
                            }
                        }
                    },
                    {field: 'answer', width: 85, title: '答案'},
                    {field: 'level', width: 85, title: '难度', templet: function(d){
                            switch (d.level) {
                                case 1:
                                    return "简单";
                                case 2:
                                    return "一般";
                                case 3:
                                    return "困难";
                            }
                        }
                    }
                ]]
            },
            done: function (elem, data) {
                var NEWJSON = []
                layui.each(data.data, function (index, item) {
                    NEWJSON.push(item.id)
                })
                elem.val(NEWJSON.join(","))
            }
        });

        // 关闭窗口
        $("#closeSelf").click(function () {
            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
        });
    })
</script>
</body>
</html>
