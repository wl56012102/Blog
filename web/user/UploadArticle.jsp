<%@ page import="java.sql.CallableStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: wang
  Date: 2017/5/10
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <script charset="utf-8" src="../kindeditor/kindeditor.js"></script>
    <script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
    <script charset="utf-8" src="../kindeditor/plugins/code/prettify.js"></script>
    <script>
        KindEditor.ready(function(K) {
            var editor1 = K.create('textarea[name="passage"]', {
                cssPath : '../kindeditor/plugins/code/prettify.css',
                uploadJson : '../kindeditor/jsp/upload_json.jsp',
                fileManagerJson : '../kindeditor/jsp/file_manager_json.jsp',
                allowFileManager : true,
                afterCreate : function() {
                    var self = this;
                    K.ctrl(document, 13, function() {
                        self.sync();
                        document.forms['example'].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function() {
                        self.sync();
                        document.forms['example'].submit();
                    });
                }
            });
            prettyPrint();
        });
    </script>
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
<form class="form-horizontal" method="post" action="UploadArticle.jsp?action=upload">

    <div class="form-group">
        <label for="username" class="col-sm-2 control-label">用户名</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="username" name ="username" width="30%" value="<%=session.getAttribute("username")%>">
        </div>
    </div>

    <div class="form-group">
        <label for="category" class="col-sm-2 control-label">文章分类</label>
        <div class="col-sm-5">
            <select class="form-control" name="category" id="category">
                <jsp:useBean id="myconn" class="sqlconn.SqlConn"></jsp:useBean>
                <%
                    CallableStatement cs =myconn.getConn().prepareCall("{call SelectAllCategory}");
                    ResultSet rs =cs.executeQuery();
                    while (rs.next()){
                        out.print("<option>"+rs.getString("category")+"</option>");
                    }
                %>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="title" class="col-sm-2 control-label">文章标题</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="title" name="title" placeholder="" width="30%">
        </div>
    </div>


    <div class="form-group">
        <label for="passage" class="col-sm-2 control-label">文章内容</label>
        <div class="col-sm-5">
            <textarea name="passage" cols="80" rows="10" id="passage" style="width:480px;height:300px;"></textarea>
        </div>
    </div>


    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">提交</button>
        </div>
    </div>
</form>
</body>
<jsp:useBean id="conn" class="sqlconn.SqlConn"/>
<%
    if("upload".equalsIgnoreCase(request.getParameter("action"))){
        String username = request.getParameter("username");
        String category = new String(request.getParameter("ac").getBytes("iso-8859-1"),"utf-8");
        String title =new String(request.getParameter("title").getBytes("iso-8859-1"),"utf-8");
        String passage =new String(request.getParameter("passage").getBytes("iso-8859-1"),"utf-8");
        Date date = new Date();
        SimpleDateFormat ft = new SimpleDateFormat ("yyyy.MM.dd HH:mm:ss");
        CallableStatement css= conn.getConn().prepareCall("{call InsertBlog('"+username+"','"+category+"','"+title+"','"+passage+"','"+ft.format(date)+"') }");
        css.execute();
        response.sendRedirect("user.jsp");
    }
%>
</html>