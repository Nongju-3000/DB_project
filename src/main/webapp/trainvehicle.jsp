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
    String query = "select * from vehicle";
%>
<html>
<head>
    <title>객차 관리 페이지</title>
</head>
<body>
    <%--headquarter를 등록하거나 수정할 수 있습니다.--%>
    <h1>객차 관리 페이지</h1>
    <form action="trainvehicle_register_insert.jsp" method="post">
        <input type="text" name="type" placeholder="객차 종류">
        <input type="text" name="model" placeholder="객차 모델">
        <input type="text" name="year" placeholder="객차 도입년도">
        <input type="text" name="status" placeholder="객차 상태">
        <input type="text" name="train_id" placeholder="열차">
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
                <th>객차 종류</th>
                <th>객차 모델</th>
                <th>객차 도입년도</th>
                <th>객차 상태</th>
                <th>열차</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("vehicle_type") %></td>
                <td><%= rs.getString("vehicle_model") %></td>
                <td><%= rs.getString("vehicle_year") %></td>
                <td><%= rs.getString("vehicle_status") %></td>
                <td><%= rs.getString("vehicle_train_id") %></td>
                <td><a href="trainvehicle_change.jsp<%= request.setAttribute("id", rs.getInt("vehicle_id")) %>">수정</a></td>
                <td><a href="trainvehicle_del.jsp<%= request.setAttribute("id", rs.getInt("vehicle_id")) %>">삭제</a></td>
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
