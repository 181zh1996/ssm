<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
    <%--<script  src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>--%>
    <script>

       function deleteUser(id) {
           if(confirm("您确认要删除吗？")){
               location.href="${pageContext.request.contextPath}/user/delById?id="+id;
           }
       }

       window.onload=function () {
           document.getElementById("delSelected").onclick=function () {
               var name = document.getElementsByName("uid");
               var  s=false;
                for(var i = 0; i<name.length;i++){
                    if(name[i].checked){
                        s=true;
                        break;
                    }
                }
                if(!s){
                alert("请选择要删除的数据！");
                return;
                }
                if(confirm("确定要删除数据吗？")){
                    if(s){
                        document.getElementById("form").submit();
                    }
                }
           }
           document.getElementById("back").onclick=function () {
               if(confirm("您要返回首页吗？")) {
                   location.href="${pageContext.request.contextPath}/user/waitIndex"
               }
           }
       }

    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">用户信息列表</h3>

    <div style="float: left;">

        <form class="form-inline" action="${pageContext.request.contextPath}/user/findAll" method="post">
            <div class="form-group">
                <label for="exampleInputName2">姓名</label>
                <input type="text" name="name" value="${condition.name}" class="form-control" id="exampleInputName2" >
            </div>
            <div class="form-group">
                <label for="exampleInputName3">籍贯</label>
                <input type="text" name="address" value="${condition.address}" class="form-control" id="exampleInputName3" >
            </div>

            <div class="form-group">
                <label for="exampleInputsex2">性别</label>
                <input type="text" name="sex" value="${condition.sex}" class="form-control" id="exampleInputsex2" >
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>

    </div>

    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" href="${pageContext.request.contextPath}/user/waitAdd">添加联系人</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="delSelected">删除选中</a>
        <a class="btn btn-primary" id="back" href="#<%----%>">返回首页</a>
    </div>
    <form id="form" action="${pageContext.request.contextPath}/user/delByIds" method="post">
    <table border="1" class="table table-bordered table-hover">
        <tr class="success">
            <th ><input type="checkbox" onclick="checkAll(this)"></th>
            <th>编号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>籍贯</th>
            <th>QQ</th>
            <th>邮箱</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${pb.list}" var="user" varStatus="s">
            <tr>
                <td><input type="checkbox" name="uid" class="cb" value="${user.id}"></td>
                <td>${s.count}</td>
                <td>${user.name}</td>
                <td>${user.sex}</td>
                <td>${user.age}</td>
                <td>${user.address}</td>
                <td>${user.qq}</td>
                <td>${user.email}</td>
                <td><a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/user/findById?id=${user.id}">修改</a>&nbsp;
                    <a class="btn btn-default btn-sm" href="javascript:deleteUser(${user.id});">删除</a>&nbsp;
                    <a target="_blank"  class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/user/findPicName?id=${user.id}">查看头像</a>&nbsp;
                </td>

            </tr>
        </c:forEach>

    </table>
    </form>

<div>
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <c:if test="${pb.currentPage  != 1}">
                <li>
                    <a href="${pageContext.request.contextPath}/user/findAll?currentPage=1&rows=5&name=${condition.name}&address=${condition.address}&sex=${condition.sex}" aria-label="Previous">
                        <span aria-hidden="true">|<<</span>
                    </a>
                </li>
                <li>
                <a href="${pageContext.request.contextPath}/user/findAll?currentPage=${pb.currentPage-1}&rows=5&name=${condition.name}&address=${condition.address}&sex=${condition.sex}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
                </c:if>

            <c:forEach begin="1" end="${pb.totalPage}" var="i">
                <li><a href="${pageContext.request.contextPath}/user/findAll?currentPage=${i}&rows=5&name=${condition.name}&address=${condition.address}&sex=${condition.sex}">${i}</a></li>
            </c:forEach>

            <c:if test="${pb.currentPage != pb.totalPage}">
            <li>
                <a href="${pageContext.request.contextPath}/user/findAll?currentPage=${pb.currentPage+1}&rows=5&name=${condition.name}&address=${condition.address}&sex=${condition.sex}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
                <li>
                    <a href="${pageContext.request.contextPath}/user/findAll?currentPage=${pb.totalPage}&rows=5&name=${condition.name}&address=${condition.address}&sex=${condition.sex}" aria-label="Previous">
                        <span aria-hidden="true">>>|</span>
                    </a>
                </li>
            </c:if>

            <span style="font-size: 25px;margin-left: 5px;">
                共${pb.totalCount}条记录，共${pb.totalPage}页
            </span>
        </ul>
    </nav>
</div>

<script>
   function checkAll(obj) {
       $(".cb").prop("checked",obj.checked);
   }

</script>
</body>
</html>


