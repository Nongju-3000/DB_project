<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Connection conn = null;
  Statement stmt = null;
  ResultSet rs = null;

  String jdbcDriver = "jdbc:mariadb://localhost:3306/yonsei_train_corp";
  String dbUser = "root";
  String dbPass = "root";

  String id = (String) request.getAttribute("id");

  String sql = "select * from headquarter where id = '" + id + "'";
%>
<html>
<head>
    <title>본부 수정 페이지</title>
</head>
<body>
  <%--headquarter를 수정하는 페이지--%>
    <h1>본부 수정 페이지</h1>
    <form action="hq_update.jsp" method="post">
        <table border="1">
            <tr>
                <td>본부 이름</td>
                <td><input type="text" name="hq_name" value="<%=request.getAttribute("hq_name")%>"></td>
            </tr>
            <tr>
                <td>본부 주소</td>
                <td><input type="text" name="heq_address" value="<%=request.getAttribute("hq_address")%>"></td>
            </tr>
        </table>
        <%--본부 id를 전달하기 위해 hidden으로 전달--%>
        <input type="hidden" name="hq_id" value="<%=request.getAttribute("hq_id")%>">
        <input type="submit" value="변경" />
    </form>
</body>
</html>
