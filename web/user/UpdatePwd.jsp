<%--
  Created by IntelliJ IDEA.
  User: wang
  Date: 2017/5/24
  Time: 13:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>修改密码</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myInverseNavbar2" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
            <a class="navbar-brand" href="user.jsp">博客首页</a> </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="myInverseNavbar2">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="UpdatePwd.jsp">修改密码</a></li>
                <li><a href="UploadArticle.jsp">上传文章</a></li>
                <li><a href="user_article.jsp">我的文章</a></li>
                <li><a href="UserInfo.jsp">个人信息</a></li>
                <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true">Dropdown <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
<div class="row">
    <div class="col-md-1"></div>
</div>
<br>
<h1 class="text-center">密码修改页面！</h1>
<form class="form-horizontal" method="post" name="form1" action="UpdatePwd.jsp?action=update" onsubmit="return checkform()">

    <div class="form-group">
        <label for="username" class="col-sm-2 control-label">用户名</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="username" name ="username" value="<%=session.getAttribute("username")%>" width="30%">
        </div>
    </div>

    <div class="form-group">
        <label for="password1" class="col-sm-2 control-label">输入密码</label>
        <div class="col-sm-5">
            <input type="password" class="form-control" id="password1" name="password1" placeholder="请输入密码" width="300">
        </div>
    </div>

    <div class="form-group">
        <label for="password2" class="col-sm-2 control-label">确认密码</label>
        <div class="col-sm-5">
            <input type="password" class="form-control" id="password2" name ="password2" placeholder="请确认密码" width="300">
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">修改</button>
            <button type="reset" class="btn btn-default">重置</button>
        </div>
    </div>
</form>
</body>
<jsp:useBean id="conn" class="sqlconn.SqlConn"></jsp:useBean>
<%
    String pwd1=request.getParameter("password1");
    String pwd2=request.getParameter("password2");

    if ("update".equals(request.getParameter("action"))){
        CallableStatement stmt = conn.getConn().prepareCall("{call UpdatePwd('"+session.getAttribute("username")+"','"+pwd1+"')}");
        stmt.execute();
        out.print("已修改密码,请返回<a href=\"../index.jsp\">登陆页面</a>");
    }
%>
</html>
<script>
function checkform() {
    var pwd = /^[A-Z]\w{5,}/;
    var pwd1 = document.forms["form1"]["password1"].value;
    var pwd2 = document.forms["form1"]["password2"].value;
    if(pwd1=="" || pwd1 ==null){
        alert("密码不能为空");
        return false;
    }
    else if(pwd1!=pwd2){
        alert("两次密码不一致");
        return false;
    }
    else if(!pwd.test(pwd1)){
        alert("密码强度不够");
        return false;
    }
}

</script>