<!--#include file="AspCms_SettingFun.asp" -->
<%CheckAdmin("AspCms_PaymentSetting.asp")%>
<%getComplanySetting%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<LINK href="../images/style.css" type=text/css rel=stylesheet>
</HEAD>
<BODY>
<DIV class=formzone>
<FORM name="" action="?action=saveb" method="post">
<DIV class=tablezone>

<TABLE cellSpacing=0 cellPadding=8 width="100%" align=center border=0>
<TBODY>
<TR>
<TD width="193" class=innerbiaoti>����֧��</TD>
<TD class=innerbiaoti width=568 height=28 align="right">&nbsp;&nbsp;<a href="http://www.aspcms.com/article-23-1.html" style="color:#AAAAAA" target="_blank">֧�����˺�����ָ��</a></TD>
</TR>
<TR class=list>
<TD>����֧���� : </TD>
<TD><INPUT class="input" size="30" style="width:300px;"  value="<%=seller_email%>" name="seller_email"/>  </TD>
</TR>
<TR class=list>
<TD>�������� : </TD>
<TD><INPUT class="input" size="30" style="width:300px;"  value="<%=subject%>" name="subject"/>  </TD>
</TR>
<TR class=list>
<TD>������ID : </TD>
<TD><INPUT class="input" size="30" style="width:300px;"  value="<%=partner%>" name="partner"/>  </TD>
</TR>
<TR class=list>
<TD>��ȫ������ : </TD>
<TD><INPUT class="input" size="30" style="width:300px;"  value="<%=key%>" name="key"/>  </TD>
</TR>
<TR class=list>

<TD>�첽֪ͨҳ�� : </TD>
<TD><INPUT class="input" size="30" style="width:300px;"  value="<%="http://"&siteurl&"/"&sitepath%>order/alipay/notify_url.asp" name="notify_url"/>  </TD>
</TR>

<TR class=list>
<TD>ͬ��֪ͨҳ��  : </TD>
<TD><INPUT class="input" size="30" style="width:300px;"  value="<%="http://"&siteurl&"/"&sitepath%>order/alipay/return_url.asp" name="return_url"/>  </TD>
</TR>
<TR class=list>
<TD>�ʺ���Ϣ : </TD>
<TD><textarea class="textarea" name="Payment_Online" cols="60" style="width:98%" rows="8"><%SafeEcho("Payment_Online")%></textarea></TD>
</TR>

<TR>
<TD width="193" class=innerbiaoti>����֧��</TD>
<TD class=innerbiaoti width=568 height=28>&nbsp;&nbsp;<a href="#" style="color:#AAAAAA">�����˺ź�����֧����ȫ����</a></TD>
</TR>
<TR class=list>
<TD>�ʺ���Ϣ : </TD>
<TD><textarea class="textarea" name="Payment_Bank" cols="60" style="width:98%" rows="8"><%SafeEcho("Payment_Bank")%></textarea></TD>
</TR>

<TR>
<TD width="193" class=innerbiaoti>�ʾָ���</TD>
<TD class=innerbiaoti width=568 height=28></TD>
</TR>
<TR class=list>
<TD>�ʺ���Ϣ : </TD>
<TD><textarea class="textarea" name="Payment_PostOffice" cols="60" style="width:98%" rows="8"><%SafeEcho("Payment_PostOffice")%></textarea></TD>
</TR>

    
</TBODY></TABLE>
</DIV>
<DIV class=adminsubmit>
<INPUT type="hidden" value="<%=LanguageID%>" name="LanguageID" />
<INPUT class="button" type="submit" value="����" />
<INPUT class="button" type="button" value="����" onClick="history.go(-1)"/> 
 </DIV></FORM>
</DIV>
</BODY>
</HTML>
