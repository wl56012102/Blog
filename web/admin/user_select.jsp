<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: wang
  Date: 2017/4/25
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <title>用户查询页面</title>
</head>
<body>
<table class="table table-bordered table-striped">
    <caption>用户表</caption>
    <thead>
    <tr>
        <th>用户名</th>
        <th>性别</th>
        <th>身份证</th>
        <th>电话</th>
        <th>教育</th>
    </tr>
    </thead>
    <jsp:useBean id="conn1" class="sqlconn.SqlConn"></jsp:useBean>
    <%

        Statement stmt = conn1.getConn().createStatement();

        String sql_show ="select * from suser";
        ResultSet rs1=stmt.executeQuery(sql_show);
        while(rs1.next()){
            out.print("<tr><td>"+rs1.getString("name")+"</td><td>"+rs1.getString("sex")+"</td><td>"+rs1.getString("idnum")+"</td><td>"+rs1.getString("tel")+"</td><td>"+rs1.getString("edu")+"</td></tr>");
        }
    %>
</table>
</body>
</html>
