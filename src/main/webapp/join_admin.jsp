<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������ ���</title>
</head>
<body>
    <form action="join_admin_ok.jsp" method="post">
        <table>
            <tr>
                <td>���̵�</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>��й�ȣ</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td>�̸�</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="���"></td>         
            </tr>
        </table>
    </form>
</body>
</html>