<!--#include file="AspCms_SettingFun.asp" -->
<%CheckAdmin("AspCms_ComplanySetting.asp")%>
<%getComplanySetting%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<LINK href="../images/style.css" type=text/css rel=stylesheet>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.tinyTips.js"></script>
<script type="text/javascript">
		$(document).ready(function() {
			$('a.tTip').tinyTips('title');
			$('a.imgTip').tinyTips('title');
			$('img.tTip').tinyTips('title');
			$('h1.tagline').tinyTips('tinyTips are totally awesome!');
		});
		</script>
<link rel="stylesheet" type="text/css" media="screen" href="../css/tinyTips.css" />
</HEAD>
<BODY>
<DIV class=formzone>
<FORM name="" action="?action=savec" method="post">
<DIV class=tablezone>

<TABLE cellSpacing=0 cellPadding=8 width="100%" align=center border=0>
<TBODY>
    <TR>
    <TD width="150" class=innerbiaoti><STRONG>��վ��Ϣ</STRONG></TD>
        <TD class=innerbiaoti width=661 height=28><STRONG>����</STRONG></TD>
        </TR>
        <TR class=list>
        <TD><STRONG>��վ���� : </STRONG></TD>
        <TD width=661><INPUT class="input" size="30" style="width:300px;"  value="<%=SiteTitle%>" name="SiteTitle"/>  
			<INPUT class="input" readOnly="true" value="{aspcms:sitetitle}"/></TD>
    </TR>
    <TR class=list>
        <TD><STRONG>��ҳ���ӱ��� : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=AdditionTitle%>" name="AdditionTitle"/> 
		<INPUT class="input" readOnly="true" value="{aspcms:additiontitle}"/>
		</TD>
    </TR>
    <TR class=list>
        <TD><STRONG>LOGOͼƬURL : </STRONG></TD>
        <TD align="left"><INPUT class="input" size="30" style="width:300px;"  value="<%=SiteLogoUrl%>" name="SiteLogoUrl" id="SiteLogoUrl"/>
<INPUT class="input" readOnly="true" value="{aspcms:sitelogo}"/>
		
        </TD>
    </TR>
    <TR class=list>   
        <TD valign="top"><STRONG>�ϴ� : </STRONG></TD>
        <TD align="left"><iframe src="../editor/upload.asp?sortType=12&stype=file&Tobj=SiteLogoUrl" scrolling="no" topmargin="0" height="40" width="100%" marginwidth="0" marginheight="0" frameborder="0" align="left"></iframe>
        </TD>
    </TR>
	 <TR class=list>
        <TD><STRONG>icoͼƬURL : </STRONG></TD>
        <TD align="left"><INPUT class="input" size="30" style="width:300px;"  value="favicon.ico" name="SiteicoUrl" id="SiteicoUrl" disabled/>
        </TD>
    </TR>
    <TR class=list>   
        <TD valign="top"><STRONG>�ϴ� : </STRONG></TD>
        <TD align="left"><iframe src="../editor/upload.asp?sortType=15&stype=file&Tobj=SiteicoUrl" scrolling="no" topmargin="0" height="40" width="100%" marginwidth="0" marginheight="0" frameborder="0" align="left"></iframe>
        </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>վ����ַ : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=SiteUrl%>" name="SiteUrl"/> <INPUT class="input" readOnly="true" value="{aspcms:siteurl}"/></TD>
    </TR>
    <TR class=list>
        <TD><STRONG>��ҵ���� : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyName%>" name="CompanyName"/> <INPUT class="input" readOnly="true" value="{aspcms:companyname}"/></TD>
    </TR>
    <TR class=list>
        <TD><STRONG>��ҵ��ַ : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyAddress%>" name="CompanyAddress"/> <INPUT class="input" readOnly="true" value="{aspcms:companyaddress}"/></TD>
    </TR>
    <TR class=list>
        <TD><STRONG>�������� : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyPostCode%>" name="CompanyPostCode"/> <INPUT class="input" readOnly="true" value="{aspcms:companypostcode}"/> </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>��ϵ�� : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyContact%>" name="CompanyContact"/> <INPUT class="input" readOnly="true" value="{aspcms:companycontact}"/> </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>�绰���� : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyPhone%>" name="CompanyPhone"/> <INPUT class="input" readOnly="true" value="{aspcms:companyphone}"/> </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>�ֻ����� : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyMobile%>" name="CompanyMobile"/> <INPUT class="input" readOnly="true" value="{aspcms:companymobile}"/> </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>��˾���� : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyFax%>" name="CompanyFax"/> <INPUT class="input" readOnly="true" value="{aspcms:companyfax}"/> </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>�������� : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyEmail%>" name="CompanyEmail"/> <INPUT class="input" readOnly="true" value="{aspcms:companyemail}"/> </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>������ : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:300px;"  value="<%=CompanyICP%>" name="CompanyICP"/> <INPUT class="input" readOnly="true" value="{aspcms:companyicp}"/></TD>
    </TR>
   <%
   dim cnzzarr:cnzzarr=split(CNZZUSER,"@")
   %>
    <TR class=list>
        <TD><STRONG>ͳ�ƴ��� : </STRONG></TD>
        <TD>        
        <textarea class="textarea" name="StatisticalCode" cols="60" style="width:80%" rows="3"><% 
		if isnul(trim(StatisticalCode)) then 
			if  ubound(cnzzarr)>0 then
echo trim(decodeHtml("<script src='http://w.cnzz.com/c.php?id="&cnzzarr(0)&"&l=2' language='JavaScript' charset='gb2312'></script>"))
			end if
		else
		echo trim(decodeHtml(StatisticalCode))
		 end if%></textarea>  <INPUT class="input" readOnly="true" value="{aspcms:statisticalcode}"/> <img src="../images/help.gif" class="tTip" title="������ͳ�ƴ���<br>���ñ�ǩ��{aspcms:companypostcode}">&nbsp;&nbsp;<a href="http://www.aspcms.com/article-19-1.html" target="_blank" style="color:#AAAAAA">�������ͳ�ƴ���</a>
		</TD>
    </TR>
    <TR class=list>
        <TD><STRONG>�ײ���Ϣ : </STRONG></TD>
        <TD>
        <textarea class="textarea" name="CopyRight" cols="60" style="width:80%" rows="3"><%=decodeHtml(CopyRight)%></textarea> <INPUT class="input" readOnly="true" value="{aspcms:copyright}"/> <img src="../images/help.gif" class="tTip" title="��Ȩ��Ϣ<br>���ñ�ǩ��{aspcms:copyright}">
         </TD>
    </TR>
    <TR class=list>
        <TD><STRONG>վ��ؼ��� : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:80%;"  value="<%=SiteKeywords%>" name="SiteKeywords"/> <INPUT class="input" readOnly="true" value="{aspcms:sitekeywords}"/> <img src="../images/help.gif" class="tTip" title="��վ�ؼ���<br>���ñ�ǩ��{aspcms:sitekeywords}"></TD>
    </TR>
    <TR class=list>
        <TD><STRONG>վ������ : </STRONG></TD>
        <TD><INPUT class="input" size="30" style="width:80%;"  value="<%=SiteDesc%>" name="SiteDesc"/> <INPUT class="input" readOnly="true" value="{aspcms:sitedesc}"/> <img src="../images/help.gif" class="tTip" title="��վ��Ϣ����<br>���ñ�ǩ��{aspcms:sitedesc}"></TD>
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
