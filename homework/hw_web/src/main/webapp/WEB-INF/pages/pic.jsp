<%--
  Created by IntelliJ IDEA.
  User: zh
  Date: 2019/2/13
  Time: 21:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>查看头像</title>
</head>
<body>
    <c:if test="${not empty picName.pic}">
        <img src="${pageContext.request.contextPath}/pics/${picName.pic}" >
    </c:if>
    <c:if test="${empty picName.pic}">
        <h1>该用户没有上传头像</h1><br>
    </c:if>
</body>
</html>
