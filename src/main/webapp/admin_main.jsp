<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-12-16
  Time: 오후 1:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>관리 메인 페이지</title>
</head>
<body>
  <%--관리자 메인 페이지, 역, 노선, 본부, 열차, 열차칸, 운행상황 버튼, 기관사 버튼, 통계 버튼 --%>
    <h1>관리자 메인 페이지</h1>
    <a href="station.jsp">역 관리</a>
    <a href="line.jsp">노선 관리</a>
    <a href="hq.jsp">본부 관리</a>
    <a href="train.jsp">열차 관리</a>
    <a href="trainvehicle.jsp">열차칸 관리</a>
    <a href="trainSchedule.jsp">운행상황 관리</a>
    <a href="enginner.jsp">기관사 관리</a>
    <a href="statistics.jsp">통계</a>
</body>
</html>
