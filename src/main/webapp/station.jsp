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
    String query = "select * from station";
%>
<html>
<head>
    <title>역 관리 페이지</title>
</head>
<body>
    <%--station을 등록하거나 수정할 수 있습니다.--%>
    <h1>역 관리 페이지</h1>
    <form action="station_register_insert.jsp" method="post">
        <input type="text" name="name" placeholder="역 이름">
        <input type="text" name="address" placeholder="역 주소">
        <input type="text" name="tel" placeholder="역 전화번호">
        <input type="text" name="managername" placeholder="역 관리자">
        <input type="text" name="budget" placeholder="역 예산">
        <input type="text" name="hq" placeholder="역 본부">
        <input type="text" name="line" placeholder="역 노선">
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
                <th>역 이름</th>
                <th>역 주소</th>
                <th>역 전화번호</th>
                <th>역 관리자</th>
                <th>역 예산</th>
                <th>역 본부</th>
                <th>역 노선</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("station_name") %></td>
                <td><%= rs.getString("station_address") %></td>
                <td><%= rs.getString("station_tel") %></td>
                <td><%= rs.getString("station_managername") %></td>
                <td><%= rs.getString("station_budget") %></td>
                <td><%= rs.getString("station_hq_id") %></td>
                <td><%= rs.getString("station_line_id") %></td>
                <td><a href="station_change.jsp<%= request.setAttribute("id", rs.getInt("station_id")) %>">수정</a></td>
                <td><a href="station_del.jsp<%= request.setAttribute("id", rs.getInt("station_id")) %>">삭제</a></td>
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
