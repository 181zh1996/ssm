<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>管理员登录</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="${pageContext.request.contextPath}/js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>

    <script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
    <script type="text/javascript">
    </script>
	  <%--<script>
		  function refreshCode() {
		      var id = document.getElementById("vcode");
		      id.src="${pageContext.request.contextPath}/checkCode?time="+new Date().getTime();
          }
	  </script>--%>
	  <script type="text/javascript">
              $(document).ready(function () {
                //  alert("cookie:"+$.cookie("username"));
                  if ($.cookie("rmbUser") == "true") {
                      $("#ck_rmbUser").attr("checked", true);
                      $("#username").val($.cookie("username"));
                      $("#password").val($.cookie("password"));
                  }
              });

          //记住用户名密码
          function Save() {
              //alert("flag:"+$("#ck_rmbUser").prop("checked"));
              if ($("#ck_rmbUser").prop("checked")) {//prop（）判断复选框是否被选中
                  //alert("ok"+ $("#txt_username").val());
                  var str_username = $("#username").val();
                  var str_password = $("#password").val();
                  $.cookie("rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
                  $.cookie("username", str_username, { expires: 7 });
                  $.cookie("password", str_password, { expires: 7 });
              }
              else {
                  $.cookie("rmbUser", "false", { expire: -1 });
                  $.cookie("username", "", { expires: -1 });
                  $.cookie("password", "", { expires: -1 });
              }
          };
	  </script>
  </head>
  <body>
  	<div class="container" style="width: 400px;">
  		<h3 style="text-align: center;">管理员登录</h3>
        <form action="${pageContext.request.contextPath}/user/login" method="post">
	      <div class="form-group">
	        <label for="username">用户名：</label>
	        <input type="text" name="username" class="form-control" id="username" placeholder="请输入用户名"/>
	      </div>
	      
	      <div class="form-group">
	        <label for="password">密码：</label>
	        <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码"/>
	      </div>
	      
	 <%--     <div class="form-inline">
	        <label for="vcode">验证码：</label>
	        <input type="text" name="verifycode" class="form-control" id="verifycode" placeholder="请输入验证码" style="width: 120px;"/>
	        <a href="javascript:refreshCode()"><img src="${pageContext.request.contextPath}/checkCode" title="看不清点击刷新" id="vcode"/></a>
	      </div>--%>
	      <hr/>
			<input type="checkbox" id="ck_rmbUser">记住密码
			<div class="form-group" style="text-align: center;">
	        <input class="btn btn btn-primary" type="submit" value="登录"onclick="Save()">
	       </div>
	  	</form>
		
		<!-- 出错显示的信息框 -->
	  	<div class="alert alert-warning alert-dismissible" role="alert">
		  <button type="button" class="close" data-dismiss="alert" >
		  	<span>&times;</span></button>
		   <strong>${msg}</strong>
		</div>
  	</div>
  </body>
</html>