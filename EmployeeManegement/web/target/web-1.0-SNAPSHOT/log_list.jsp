<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>${Type}日志</title>
    <link rel="stylesheet" type="text/css" href="../css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../css/common.css"/>
    <link rel="stylesheet" type="text/css" href="../css/thems.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function(){
            //自适应屏幕宽度
            window.onresize=function(){ location=location };

            var main_h = $(window).height();
            $('.hy_list').css('height',main_h-45+'px');

            var search_w = $(window).width()-40;
            $('.search').css('width',search_w+'px');
            //$('.list_hy').css('width',search_w+'px');
        });
    </script>
    <!--框架高度设置-->
</head>

<body onLoad="Resize();">
<div id="right_ctn">
    <div class="right_m">
        <div class="hy_list">
            <div class="box_t">
                <span class="name">${Type}日志</span>
            </div>
            <div class="space_hx">&nbsp;</div>
            <!--列表-->
            <table cellpadding="0" cellspacing="0" class="list_hy">
                <tr>
                    <th scope="col">操作时间</th>
                    <th scope="col">操作员</th>
                    <th scope="col">模块</th>
                    <th scope="col">操作</th>
                    <th scope="col">结果</th>
                </tr>
                <c:forEach items="${Page.resultList}" var="log">
                <tr>
                    <td><fmt:formatDate value="${log.oprTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>${log.operator}</td>
                    <td>${log.moudle}</td>
                    <td>${log.operation}</td>
                    <td>${log.result}</td>
                </tr>
                </c:forEach>
            </table>
            <!--列表-->
            <div>
                <a href="loginLog.do?page=1">首页</a>
                <a href="loginLog.do?page=${Page.prePageNum}">上一页</a>
                <c:forEach var="i" begin="${Page.startPage}" end="${Page.endPage}" step="1">
                    <a href="loginLog.do?page=${i}"> ${i} </a>
                </c:forEach>
                <a href="loginLog.do?page=${Page.nextPageNum}">下一页</a>
                <a href="loginLog.do?page=${Page.totalPageNum}">尾页</a>
            </div>
        </div>
        <!--会议列表-->
    </div>
</div>
</body>
</html>
