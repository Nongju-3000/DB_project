<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>����� �α�����...</title>
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
        /*enginner �α���*/
        Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
        stmt = conn.createStatement();

        String sql = "select * from engineer where enginner_id = '" + id + "' and enginner_password = '" + pw + "'";
        result = stmt.executeQuery(sql);

        if(result.next()){
            System.out.println("�α��� ����");
            response.sendRedirect("enginner_main.jsp");
            /*���ǿ� ���̵� ����*/
            session.setAttribute("enginner_id", id);
        }else{
            System.out.println("�α��� ����");
            response.sendRedirect("login_enginner.jsp");
        }
    } catch(Exception e){
        e.printStackTrace();
    }
%>
</body>
</html>