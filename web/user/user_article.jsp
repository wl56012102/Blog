<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: wang
  Date: 2017/5/31
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="../css/bootstrap.css" rel="stylesheet">
    <title>Title</title>
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
    String select_article = "select * from blogaticle where sid=(select id from suser where name='"+session.getAttribute("username")+"')";
    ResultSet rs =stmt.executeQuery(select_article);
    while (rs.next()){
        %>
<div class="container">
    <div class="page-header">
        <h1><%=rs.getString("atitle")%><small><%=rs.getString("atime")%></small></h1>
    </div>
    <p class="lead"><%=rs.getString("acontent")%></p>
</div>

<%
    }
%>
</body>
</html>
