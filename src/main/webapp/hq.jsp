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
    String query = "select * from headquarter";
%>
<html>
<head>
    <title>본부 관리 페이지</title>
</head>
<body>
    <%--headquarter를 등록하거나 수정할 수 있습니다.--%>
    <h1>본부 관리 페이지</h1>
    <form action="hq_register_insert.jsp" method="post">
        <input type="text" name="name" placeholder="본부 이름">
        <input type="text" name="address" placeholder="본부 주소">
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
                <th>본부 이름</th>
                <th>본부 주소</th>
            </tr>
        </thead>
        <tbody>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("hq_name") %></td>
                <td><%= rs.getString("hq_address") %></td>
                <td><a href="hq_change.jsp<%= request.setAttribute("id", rs.getInt("hq_id")) %>">수정</a></td>
                <td><a href="hq_del.jsp<%= request.setAttribute("id", rs.getInt("hq_id")) %>">삭제</a></td>
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
