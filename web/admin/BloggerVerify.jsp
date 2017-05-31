<%--
  Created by IntelliJ IDEA.
  User: wang
  Date: 2017/4/18
  Time: 22:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <meta charset="utf-8">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <title>Title</title>
</head>
<body>
<table class="table table-bordered table-striped">
    <caption>显示博主申请</caption>
    <thead>
    <tr>
        <th>用户名</th>
        <th>操作</th>
    </tr>
    </thead>
    <jsp:useBean id="conn" class="sqlconn.SqlConn"></jsp:useBean>
    <%
        request.setCharacterEncoding("utf-8");
        Statement stmt = conn.getConn().createStatement();

        String sql_show ="select * from suser where apply_blogger=1";

        ResultSet rs1=stmt.executeQuery(sql_show);
        while(rs1.next()){
            %>
    <tr><td>
        <% out.print(rs1.getString("name"));%>
    </td>
        <td>
            <form action="BloggerVerify.jsp?action=apply" method="post">
                <button type="submit" name="btn1" class="btn btn-default" value="<%=rs1.getString("name")%>">接受申请</button>
                <button type="submit" name="btn2" class="btn btn-danger" value="<%=rs1.getString("name")%>">拒绝申请</button>
            </form>

        </td>
    </tr>
    <%
            //out.print("<tr><td>"+rs1.getString("name")+"</td><td><button type=\"button\" class=\"btn btn-default\">接受申请</button></td></tr>");
        }
    %>
    <%
        if("apply".equals(request.getParameter("action"))){
            Statement stmt1 = conn.getConn().createStatement();
            String name=request.getParameter("btn1");
            String sql_blog="update suser set apply_blogger=0,blogger=1 where name ='"+name+"'";
            stmt1.execute(sql_blog);
            response.sendRedirect("BloggerVerify.jsp");
        }
    %>

</table>

</body>
</html>
