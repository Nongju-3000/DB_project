<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_train_corp";
    String dbUser = "root";
    String dbPass = "root";
    String query = "select * from train";
%>
<html>
<head>
    <title>열차 관리 페이지</title>
</head>
<body>
    <%--train을 등록하거나 수정할 수 있습니다.--%>
    <h1>열차 관리 페이지</h1>
    <form action="train_register_insert.jsp" method="post">
        <input type="text" name="name" placeholder="열차 이름">
        <input type="text" name="type" placeholder="열차 종류">
        <input type="text" name="condition" placeholder="열차 상태">
        <input type="submit" value="등록">
    </form>
    <hr>
    <table>
        <%
            try {
                Class.forName("org.mariadb.jdbc.Driver");
                conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
                stmt = conn.createStatement();
                rs = stmt.executeQuery(query);
        %>
        <thead>
            <tr>
                <th>열차 이름</th>
                <th>열차 주소</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("train_name") %></td>
                <td><%= rs.getString("train_type") %></td>
                <td><%= rs.getString("train_condition") %></td>
                <td><a href="train_change.jsp<%= request.setAttribute("id", rs.getInt("train_id")) %>">수정</a></td>
                <td><a href="train_del.jsp<%= request.setAttribute("id", rs.getInt("train_id")) %>">삭제</a></td>
            </tr>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) {}
                if (stmt != null) try { stmt.close(); } catch (Exception e) {}
                if (conn != null) try { conn.close(); } catch (Exception e) {}
            }
            %>
        </tbody>
    </table>
<%

%>
</body>
</html>
