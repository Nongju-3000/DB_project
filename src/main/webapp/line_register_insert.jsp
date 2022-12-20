<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-12-16
  Time: 오후 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Connection conn = null;
  Statement stmt = null;

  String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_train_corp";
  String dbUser = "root";
  String dbPass = "root";
%>
<html>
<head>
    <title>등록중...</title>
</head>
<body>
  <%
      String name = request.getParameter("name");
      String year = request.getParameter("year");
      String length = request.getParameter("length");
      String hq = request.getParameter("hq");

      if(name == null || name.equals("") || year == null || length.equals("") || hq == null || hq.equals("")){
  %>
          <script>
                alert("빈칸을 모두 채워주세요.");
                history.back();
          </script>
  <%
      }
      else {
        String query = "insert into line ( line_name, line_builtyear, line_length, line_hq_id) values ('" + name + "', " + year + ", " + length + ", " + hq + ")";

        try {
          Class.forName("org.mariadb.jdbc.Driver");
          conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
          stmt = conn.createStatement();
          stmt.executeUpdate(query);
          response.sendRedirect("line.jsp");
        } catch (Exception e) {
          e.printStackTrace();
        } finally {

          try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
          } catch (Exception e) {
            e.printStackTrace();
          }
        }
      }
  %>
</body>
</html>
