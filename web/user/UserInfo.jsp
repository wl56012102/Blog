<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.CallableStatement" %><%--
  Created by IntelliJ IDEA.
  User: wang
  Date: 2017/5/24
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../css/bootstrap.css" rel="stylesheet">
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
<jsp:useBean id="conn" class="sqlconn.SqlConn"></jsp:useBean>
<%
    Statement stmt= conn.getConn().createStatement();
    String select_user = "select * from suser where name='"+session.getAttribute("username")+"'";
    ResultSet rs =stmt.executeQuery(select_user);
    while (rs.next()){
%>
<form class="form-horizontal" method="post" action="UploadArticle.jsp?action=upload">

    <div class="form-group">
        <label for="username" class="col-sm-2 control-label">用户名</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="username" name ="username" width="30%" value="<%=session.getAttribute("username")%>">
        </div>
    </div>

    <div class="form-group">
        <label for="sex" class="col-sm-2 control-label">性别</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="sex" name ="sex" width="30%" value="<%=rs.getString("sex")%>">
        </div>
    </div>

    <div class="form-group">
        <label for="edu" class="col-sm-2 control-label">教育</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="edu" name ="edu" width="30%" value="<%=rs.getString("edu")%>">
        </div>
    </div>

    <div class="form-group">
        <label for="idnum" class="col-sm-2 control-label">身份证</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="idnum" name ="idnum" width="30%" value="<%=rs.getString("idnum")%>">
        </div>
    </div>

    <div class="form-group">
        <label for="tel" class="col-sm-2 control-label">电话</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="tel" name ="tel" width="30%" value="<%=rs.getString("tel")%>">
        </div>
    </div>

    <div class="form-group">
        <label for="email" class="col-sm-2 control-label">邮箱</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="email" name ="email" width="30%" value="<%=rs.getString("email")%>">
        </div>
    </div>
</form>


<%
    }
%>
</body>
</html>
