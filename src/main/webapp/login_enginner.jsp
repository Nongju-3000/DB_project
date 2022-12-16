<%@ page language="java" contentType="text/html; charset=EUC-KR"
         pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="EUC-KR">
    <title>기관사 로그인</title>
</head>
<body>
<%--로그인 페이지 아이디와 비밀번호를 입력받음--%>
    <form action="login_enginner_ok.jsp" method="post">
        아이디 : <input type="text" name="id" /><br/>
        비밀번호 : <input type="password" name="pw" /><br/>
        <input type="submit" value="로그인" />
    </form>
</body>
</html>