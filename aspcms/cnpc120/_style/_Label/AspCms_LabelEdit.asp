<!--#include file="AspCms_LabelFun.asp" -->
<%getLabel%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE></TITLE>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<LINK href="../../images/style.css" type=text/css rel=stylesheet>
<script type="text/javascript" charset="gbk" src="../../ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="gbk" src="../../ueditor/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="gbk" src="../../ueditor/lang/zh-cn/zh-cn.js"></script>
</HEAD>
<BODY>
<FORM name="form" action="?action=edit" method="post" >
<DIV class=formzone>
<DIV class=namezone>�༭�Զ����ǩ</DIV>
<DIV class=tablezone>
<DIV class=noticediv id=notice></DIV>
<TABLE cellSpacing=0 cellPadding=2 width="100%" align=center border=0>
  <TBODY>
  <TR>						
    <TD align=middle width=100 height=30>��ǩ����</TD>
    <TD><INPUT class="input" style="WIDTH: 200px" maxLength="200" name="LabelName" value="<%=LabelName%>"/> <FONT color=#ff0000>*</FONT> </TD>
  </TR>
  <TR>
    <TD align=middle width=100 height=30>����</TD>
    <TD><input class="input" maxlength="6" style="WIDTH: 360px" name="LabelDesc" value="<%=LabelDesc%>"/> </TD></TR>
  <TR >
    <TD align="middle" height="30">
       	����<BR><BR></TD>
    <TD>
<div style="width:80%"><textarea name="Content" class="ckeditor" id="myEditor"><%=decodeHtml(Content)%></textarea> 
<script type="text/javascript">
    var editor = new UE.ui.Editor();
    editor.render("myEditor");
</script></div>
    </TD>
  </TR>
    <tr>
    <TD align=middle height=30 valign="top">�ϴ�ͼƬ</td>
      <td colspan="3"><iframe name="image" frameborder="0" width='100%' height="40" scrolling="no" src="../../editor/upload.asp?sortType=10&stype=sort&Tobj=content" allowTransparency="true"></iframe></td>
    </tr>
  <TR>
  
    </TBODY></TABLE>
</DIV>
<DIV class=adminsubmit>
<INPUT type="hidden" name="LabelID" value="<%=LabelID%>"/>
<INPUT class="button" type="submit" value="�޸�" />
<INPUT class="button" type="button" value="����" onClick="history.go(-1)"/> 
<INPUT onClick="location.href='<%=getPageName()&"?id="&LabelID%>'" type="button" value="ˢ��" class="button" /> 
</DIV></DIV></FORM>

</BODY></HTML>