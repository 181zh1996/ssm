<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>首页</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="../../js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="../../js/bootstrap.min.js"></script>
    <script type="text/javascript">
    </script>


    <script>
        window.onload=function () {
            if(${empty user}){
                alert("尊敬的管理员用户，请先登录，再进行操作")
            }

            document.getElementById("out").onclick=function () {
                confirm("尊敬的管理员，您确定要退出登录吗")
            }

        }
    </script>
</head>
<body>

    <c:if test="${not empty user}">
        <div>${user.name}:欢迎您</div>
        <div><a href="${pageContext.request.contextPath}/user/outLogin" id="out">退出登录</a></div>
        <div align="center">

            <a
                    href="${pageContext.request.contextPath}/user/findAll" style="text-decoration:none;font-size:33px">查询所有用户信息
            </a>

        </div>
    </c:if>
    <c:if test="${empty user}">
        <div>
                <a href="${pageContext.request.contextPath}/user/wait">登录</a>
            </div>
        <div align="center">

            <a
                    href="#"  id="login" style="text-decoration:none;font-size:33px">查询所有用户信息
            </a>
        </div>
    </c:if>

</body>
</html>