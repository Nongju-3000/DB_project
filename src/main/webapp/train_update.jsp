<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_train_corp";
    String dbUser = "root";
    String dbPass = "root";
%>
<html>
<head>
    <title>변경중...</title>
</head>
<body>
<%
    String id = request.getParameter("hq_id");
    String name = request.getParameter("hq_name");
    String address = request.getParameter("hq_address");
    try {
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        stmt = conn.createStatement();
        String sql = "update headquarter set hq_name = '" + name + "', hq_address = '" + address + "' where hq_id = '" + id + "'";
        stmt.executeUpdate(sql);

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
