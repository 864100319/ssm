<%--
  Created by IntelliJ IDEA.
  User: 1
  Date: 2021/5/16
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <jsp:include page="../commons/metas.jsp" />
    <title>Title</title>
    <jsp:include page="../commons/styles.jsp" />
</head>
<body>

<jsp:include page="../commons/scripts.jsp" />
<script>
    layui.use(['layer'], function () {
        var layer = layui.layer;
        layer.msg('${msg}', {icon: 2}, function(){
            location.href = '${pageContext.request.contextPath}/${path}'
        });
    });
</script>
</body>
</html>

