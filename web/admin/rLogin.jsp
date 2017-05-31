<%--
  Created by IntelliJ IDEA.
  User: wang
  Date: 2017/4/12
  Time: 8:55
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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <base href="<%=basePath%>">
    <title>rlogin</title>
</head>
<body>
<%
    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    String sql="jdbc:sqlserver://localhost:1433;DatabaseName=Demo";
    String sqlname="sa";
    String sqlpasswd="wl1996";
    Connection conn;
    conn=DriverManager.getConnection(sql,sqlname,sqlpasswd);
    Statement stmt = conn.createStatement();
    String input_name = request.getParameter("input_name").trim();
    String input_pwd = request.getParameter("pwd").trim();

    String select_admin = "select * from admin where name='"+input_name+"' and pwd='"+input_pwd+"'";


    ResultSet rs1=stmt.executeQuery(select_admin);
    if (rs1.next()){
        //session.setAttribute("username",input_name);
        response.sendRedirect("index.htm");
    }else{
        out.println("<h1>用户名或密码错误，请重新登录或注册</h1>");
    }
%>

</body>
</html>

