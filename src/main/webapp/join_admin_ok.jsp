<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.time.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자 등록중...</title>
</head>
<body>
    <%
    	Connection conn = null;
		Statement stmt = null;
        try{
            String id = request.getParameter("id");
            String pw = request.getParameter("password");
            String name = request.getParameter("name");
            
            String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_train_corp";
			String dbUser = "root";
			String dbPass = "root";
            String query = "INSERT INTO admin (admin_id, admin_password, admin_name) VALUES('"+id+"','"+pw+"','"+name+"');";
            System.out.println(query);

            conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			stmt = conn.createStatement();

            stmt.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>