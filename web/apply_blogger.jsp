<%--
  Created by IntelliJ IDEA.
  User: wang
  Date: 2017/4/18
  Time: 23:03
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
    <title>Title</title>
    <link href="admin/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<h4>
    <%=session.getAttribute("username")%>不是博主!点击按钮申请博主
</h4>
<form action="apply_blogger.jsp?apply1" method="post" >
    <button type="submit" class="btn-default btn" name="app1" value="<%=session.getAttribute("username")%>">申请博主</button>
</form>
<a href="index.jsp">返回主页</a>
</body>
</html>
<jsp:useBean id="conn" class="sqlconn.SqlConn"></jsp:useBean>

<%
    request.setCharacterEncoding("utf-8");
    String name = request.getParameter("app1");
    Statement stmt = conn.getConn().createStatement();
    String sql="update suser set apply_blogger=1 where name='"+name+"'";
    stmt.execute(sql);
%>