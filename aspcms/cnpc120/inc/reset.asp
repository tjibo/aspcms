<!DOCTYPE html>
<html><head>
<title>��ֹ��½��ʱ</title>
<meta http-equiv="refresh"content="50;url='?action=reset'">
</head>
<%
if Session("adminName")<>"" then
session("resettimeout")=1
else
session("resettimeout")=0
end if
%>
����:<%=session("resettimeout")%>
<body>
</body>
</html>