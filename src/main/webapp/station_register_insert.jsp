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
      String address = request.getParameter("address");
      String tel = request.getParameter("tel");
      String managername = request.getParameter("managername");
      String budget = request.getParameter("budget");
      String hq = request.getParameter("hq");
      String line = request.getParameter("line");

      if(name == null || name.equals("") || address == null || address.equals("") || tel == null || tel.equals("") || managername == null || managername.equals("") || budget == null || budget.equals("") || hq == null || hq.equals("") || line == null || line.equals("")){
  %>
          <script>
                alert("빈칸을 모두 채워주세요.");
                history.back();
          </script>
  <%
      }
      else {
        String query = "insert into station ( station_name, station_address, station_tel, station_managername, station_budget, station_hq_id, station_line_id) " +
                "( '" + name + "', '" + address + "', '" + tel + "', '" + managername + "', '" + budget + "', '" + hq + "', '" + line + "')";

        try {
          Class.forName("org.mariadb.jdbc.Driver");
          conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
          stmt = conn.createStatement();
          stmt.executeUpdate(query);
          response.sendRedirect("station.jsp");
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
