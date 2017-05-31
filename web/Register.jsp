<%--
  Created by IntelliJ IDEA.
  User: wang
  Date: 2017/3/25
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <meta charset="utf-8">
    <title>注册页面</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<h1 class="text-center">用户注册页面！</h1>
<body>
<form class="form-horizontal" method="post" action="Register.jsp?action=reg" onsubmit="return checkform()">

    <div class="form-group">
        <label for="username" class="col-sm-2 control-label">用户名</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="username" name ="username" placeholder="请输入用户名" width="30%">
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
        <label for="sex1" class="col-sm-2 control-label">性别</label>
        <div class="col-sm-5">
            <label class="radio-inline">
                <input type="radio" name="sex" id="sex1" value="男" checked> 男
            </label>
            <label class="radio-inline">
                <input type="radio" name="sex" id="sex2" value="女"> 女
            </label>
        </div>
    </div>

    <div class="form-group">
        <label for="edu" class="col-sm-2 control-label">学历</label>
        <div class="col-sm-5">
            <select class="form-control" name="edu" id="edu">
                <option>本科生</option>
                <option>研究生</option>
                <option>博士生</option>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label for="idnum" class="col-sm-2 control-label">身份证号</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="idnum" name="idnum" placeholder="请输入身份证号" width="30%">
        </div>
    </div>

    <div class="form-group">
        <label for="tel" class="col-sm-2 control-label">联系方式</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="tel" name="tel" placeholder="请输入联系方式" width="30%">
        </div>
    </div>

    <div class="form-group">
        <label for="address" class="col-sm-2 control-label">联系地址</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="address" name="address" placeholder="请输入联系地址" width="30%">
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default">注册</button>
            <button type="reset" class="btn btn-default">重置</button>
        </div>
    </div>
</form>
</body>
<jsp:useBean id="conn1" class="sqlconn.SqlConn"></jsp:useBean>
<%
    if("reg".equals(request.getParameter("action"))){
        Statement stmt = conn1.getConn().createStatement();

        String username=request.getParameter("username");
        String password1 = request.getParameter("password1");
        String password2 = request.getParameter("password2");
        String sex = request.getParameter("sex");
        String edu = request.getParameter("edu");
        String idnum = request.getParameter("idnum");
        String tel = request.getParameter("tel");
        String address = request.getParameter("address");
        String sql_insertuser = "insert into suser (name,pwd,idnu,sex,tel,edu,email) values ('"+username+"','"+password1+"','"+idnum+"','"+sex+"','"+tel+"','"+edu+"','"+address+"')";
        String sql_selectuser="select * from suser where name ='"+username+"'";

        ResultSet rs1=stmt.executeQuery(sql_selectuser);

        if (rs1.next()){
            out.println("<h3>已存在相同用户名，请重新<a href=Register.jsp>注册</a>!</h3>");
        }else if(password1.equals("")){
            out.println("<h3>密码为空，请重新<a href=Register.jsp>注册</a>!!</h3>");
        }
        else if(!password1.equals(password2)){
            out.println("<h3>密码不一致!</h3>");
        }
        else {
            stmt.execute(sql_insertuser);
            out.println("<h3>注册成功，请前往<a href=\"index.jsp\">登录</a>页面");
        }
    }
%>
</html>

