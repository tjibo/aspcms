<!--#include file="inc/AspCms_SettingClass.asp" -->
<%CheckLogin()	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>Home</title>
<link href="css/css_body.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/jquery.js"></script>
</head>

<body>
<%
if "admin_aspcms"=lcase(getAdminDir) then 
%>
<div class="bodytitle">
  <div class="bodytitleleft"></div>
  <div class="bodytitletxt">��ȫ��ʾ</div>
</div>
<div class="tab_bk1">
  <div class="txtbox1">
    <p class="red">���ĺ�̨����Ŀ¼ΪĬ��Ŀ¼������ʹ��ftp����������ʽ����̨Ŀ¼������</p>
    <p class="red"><strong>�������������վ��ȫ��</strong>��<br />
      1���޸ĺ�̨·����<br />
      2���޸����ݿ�·�������ơ�<br />
      3�����ý�Ϊ���ӵĺ�̨�������롣</p>
  </div>
</div>
<%end if%>

<div class="bodytitle">
  <div class="bodytitleleft"></div>
  <div class="bodytitletxt">��վͳ��</div>
</div>
<div class="tab_bk1">
  <div class="txtbox1">
    <p>���� <strong class="red"><%=getTodayVisits%></strong> �� ������ <strong class="red"><%=getYesterdayVisits%></strong> �� ������ <strong class="red"><%=getMonthVisits%></strong> �� ���ܷ��� <strong class="red"><%=getAllVisits%></strong> �ˡ�</p>
  </div>
</div>
<div class="bodytitle">
  <div class="bodytitleleft"></div>
  <div class="bodytitletxt">��ݹ���</div>
</div>
<div class="tab_bk1">
  <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="60" align="center"><table width="96%" border="0" cellspacing="10" cellpadding="0" style="margin-top:5px;">
          <tr class="main_qbut">
            <td width="16%" align="center"><div style="background-position:center 10px;"><a href="_content/_Sort/AspCms_Sort.asp">��Ŀ����</a></div></td>
            <td width="16%" align="center"><div style="background-position:center -130px;"><a href="_content/_Content/AspCms_ContentAdd.asp?sortType=2&sortid=&keyword=&page=&psize=&order=&ordsc=">�����ĵ�</a></div></td>
            <td width="16%" align="center"><div style="background-position:center -270px;"><a href="_content/_Content/AspCms_Recycling.asp">���ݻ���վ</a></div></td>
            <td width="16%" align="center"><div style="background-position:center -414px;"><a href="_content/_Comments/AspCms_Comments.asp">���۹��� </a></div></td>
            <td width="16%" align="center"><div style="background-position:center -554px;"><a href="_seo/AspCms_MakeHtml.asp?actType=html">����HTML</a></div></td>
            <td width="16%" align="center"><div style="background-position:center -694px;"><a href="_system/AspCms_SiteSetting.asp">����ϵͳ���� </a></div></td>
            <td width="4%" align="center">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<div class="bodytitle">
  <div class="bodytitleleft"></div>
  <div class="bodytitletxt">����������</div>
</div>
<div class="tab_bk1">
  <div class="txtbox1">
    <p> <a href="_content/_Comments/AspCms_Message.asp">δ�ش�����</a>��<%=getDataCount("select Count(*) from {prefix}GuestBook where faqStatus=0")%>��<small>|</small> <a href="_content/_Order/AspCms_Order.asp">δ������</a>��<%=getDataCount("select Count(*) from {prefix}Order2 where state=0")%>��<small>|</small> <a href="_content/_Comments/AspCms_Comments.asp">δ��������</a>��<%=getDataCount("select Count(*) from {prefix}Comments where CommentStatus=0")%>��<small>|</small> <a href="_content/_Apply/AspCms_Apply.asp">δ����ӦƸ</a>��<%=getDataCount("select Count(*) from {prefix}Apply where ApplyStatus=0")%>��<small>|</small> </p>
  </div>
</div>
<div class="bodytitle">
  <div class="bodytitleleft"></div>
  <div class="bodytitletxt">ϵͳ��Ϣ</div>
</div>
<table width="100%" border="0" align="center" cellpadding="10" cellspacing="1" bgcolor="#cad9ea" >
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft" width="250">��ǰ����汾��</td>
    <td bgcolor="#FFFFFF" class="main_bright"><%=aspcmsVersion%> </td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft">��Ȩ��Ϣ</td>
    <td bgcolor="#FFFFFF" class="main_bright">��Դ��Ѱ�</td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft">���������ƣ�</td>
    <td bgcolor="#FFFFFF" class="main_bright">���� <%=Request.ServerVariables("SERVER_NAME")%>(IP:<%=Request.ServerVariables("LOCAL_ADDR")%>) �˿�:<%=Request.ServerVariables("SERVER_PORT")%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft">վ������·����</td>
    <td bgcolor="#FFFFFF" class="main_bright"><%=Request.ServerVariables("PATH_TRANSLATED")%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft">FSO�ı���д��</td>
    <td bgcolor="#FFFFFF" class="main_bright"><%If Not isInstallObj(FSO_OBJ_NAME) Then%>
      <font color="#FF0066"><b>��</b>��վ��������ʹ��</font>
      <%else%>
      <b>��</b>
      <%end if%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft">JMail�����</td>
    <td bgcolor="#FFFFFF" class="main_bright"><%If Not isInstallObj("JMail.Message") Then%>
      <font color="#FF0066"><b>��</b>�ʼ����ѹ��ܲ�������ʹ��</font>
      <%else%>
      <b>��</b>
      <%end if%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft"> ASPJpeg �����</td>
    <td bgcolor="#FFFFFF" class="main_bright"><%If Not isInstallObj("Persits.Jpeg") Then%>
      <font color="#FF0066"><b>��</b>ˮӡ���ܲ�������ʹ��</font>
      <%else%>
      <b>��</b>
      <%end if%></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft">�ű��������棺</td>
    <td bgcolor="#FFFFFF" class="main_bright"><%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
  </tr>
  <tr>
    <td align="right" bgcolor="#f5fafe" class="main_bleft">������IIS�汾��</td>
    <td bgcolor="#FFFFFF" class="main_bright"><%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
  </tr>
</table>
</body>
</html>