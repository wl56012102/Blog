<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: wang
  Date: 2017/4/5
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Melody博客平台</title>
  <link href="homestyle.css" rel="stylesheet" type="text/css" />
  <script language="javascript" type="text/javascript">
      function clearText(field)
      {
          if (field.defaultValue == field.value) field.value = '';
          else if (field.value == '') field.value = field.defaultValue;
      }
  </script>
</head>

<body>
<div id="templatemo_container">
  <div id="templatemo_site_title_bar">
    <div id="site_title">
      <h1><a href="#">
        <img src="images/logo.jpg" alt="logo" /><span>欢迎来到Melody博客平台</span>
      </a></h1>
    </div>
  </div>

  <div id="templatemo_menu">
    <ul>
      <li><a href="#" class="current">主页</a></li>
      <li><a href="#">最新博文</a></li>
      <li><a href="#">精彩博文</a></li>
      <li><a href="#">博文长廊</a></li>
      <li><a href="#">联系我们</a></li>
    </ul>
  </div>
  <div id="templatemo_content_wrapper">

    <div id="templatemo_content">

      <div id="side_column">

        <div class="side_column_box">

          <h2>最新博文</h2>
          <div class="news_section">
            <h3>放飞梦想 </h3>
            <p>小时候，我常常想，要是我长大了......  <a href="#">继续</a></p>
          </div>

          <div class="news_section">
            <h3>很高兴遇见你</h3>
            <p>那一天，天空下着绵绵细雨，我左手抱着一堆书，右手遮着头，正准备冲向雨中，就只见你迈着矫健的步伐，一手插在口袋里，一手撑着伞，潇洒的朝着大楼走过来......<a href="#">继续</a></p>
          </div>

          <div class="button_01"><a href="#">Read all</a></div>

        </div>

        <div class="side_column_box news_letter_box">

          <h3>请在此处登陆</h3><br>

          <form action="index.jsp?action=RLogin" method="post">
            <input type="text" name="username" size="10" class="inputfield" onfocus="clearText(this)" onblur="clearText(this)" />
            <input type="password" name="password" size="10" class="inputfield"  onfocus="clearText(this)" onblur="clearText(this)" />
            <input type="submit" name="dl" value="登录" alt="登录" class="submitbutton" title="Search" />
            <a href="Register.jsp">注册</a>
          </form>
          <jsp:useBean id="conn" class="sqlconn.SqlConn"></jsp:useBean>
          <%
            Statement stmt = conn.getConn().createStatement();
            String input_name = request.getParameter("username");
            String input_pwd = request.getParameter("password");
            String select_user = "select * from suser where name ='"+input_name+"' and pwd ='"+input_pwd+"'";
            if("RLogin".equals(request.getParameter("action"))){
              ResultSet rs1 = stmt.executeQuery(select_user);
              if(rs1.next()){
                if(rs1.getBoolean("blogger")==true){
                  session.setAttribute("username",input_name);
                  response.sendRedirect("user/user.jsp");
                }
                else{
                    session.setAttribute("username",input_name);
                    response.sendRedirect("apply_blogger.jsp");
                }
              }
            }
          %>

        </div>

      </div>

      <div id="main_column">


        <div class="main_column_section">

          <h2>欢迎来到Melody博客平台</h2>
          <a href="#"><img class="image_wrapper fl_image" src="images/templatemo_image_01.jpg" alt="image" /></a>
          <p>Melody博客平台创建于2017年......</p>

          <p>本博客平台是提供给博主们分享文章、传递喜怒哀乐......</p>

          <div class="cleaner_h30"></div>
          <div class="button_01"><a href="#">Read more</a></div>

          <div class="cleaner"></div>
        </div>
        <div class="cleaner_h60"></div>
        <div class="main_column_section">

          <h2>博客园地</h2>

          <div class="section_w280 fl">
            <img class="image_wrapper fl_image" src="images/templatemo_image_01.png" alt="image" />
            <h3>精彩博文</h3>
            <p>此处是博文内容博文内容博文内容博文内容...... <a href="#">阅读全文</a></p>
          </div>

          <div class="section_w280 fr">
            <img class="image_wrapper fl_image" src="images/templatemo_image_02.png" alt="image" />
            <h3>精彩评论</h3>
            <p>此处是读者评论读者评论读者评论读者评论读者评论......<a href="#">阅读评论</a></p>
          </div>

          <div class="cleaner_h30"></div>

          <div class="section_w280 fl">
            <img class="image_wrapper fl_image" src="images/templatemo_image_04.png" alt="image" />
            <h3>博主之星</h3>
            <p>此处是博主之星的格言</p>
          </div>

          <div class="section_w280 fr">
            <img class="image_wrapper fl_image" src="images/templatemo_image_03.png" alt="image" />
            <h3>快速链接</h3>
            <p>推荐的博客平台的链接 <a href="#">更多</a></p>
          </div>

        </div>


        <div class="cleaner"></div>
      </div>


      <div class="cleaner"></div>
    </div>


    <div id="templatemo_footer">

      <ul class="footer_menu">
        <li><a href="#">主页</a></li>
        <li><a href="#">最新博文</a></li>
        <li><a href="#">精彩博文</a></li>
        <li><a href="#">博文长廊</a></li>
        <li><a href="admin/login.htm">后台管理</a></li>
        <li class="last_menu"><a href="#">联系我们</a></li>
      </ul>

      Copyright © 2017 <a href="#">Melody博客平台</a>
      | <a href="http://www.gench.edu.cn">上海建桥学院</a>

    </div>

    <div class="cleaner"></div>
  </div>

</div>
</body>
</html>
