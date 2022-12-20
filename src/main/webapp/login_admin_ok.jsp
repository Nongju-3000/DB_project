<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>관리자 로그인중...</title>
</head>
<body>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet result = null;
    try{
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_train_corp";
        String dbUser = "root";
        String dbPass = "root";
        /*admin 로그인*/
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        stmt = conn.createStatement();

        String sql = "select * from admin where admin_id = '" + id + "' and admin_password = '" + pw + "'";
        result = stmt.executeQuery(sql);

        if(result.next()){
            System.out.println("login_success");
            response.sendRedirect("admin_main.jsp");
            /*세션에 아이디 저장*/
            session.setAttribute("admin_id", id);
        }else{
            System.out.println("login_fail");
            response.sendRedirect("login_admin.jsp");
        }
    } catch(Exception e){
        e.printStackTrace();
    }
%>
</body>
</html>