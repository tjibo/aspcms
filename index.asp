<!--#include file="inc/AspCms_SettingClass.asp" -->
<%
Check_Wap()
if  runMode="0"  then
	dim templateobj,templatePath : set templateobj = new TemplateClass	
	templatePath=sitePath&"/"&"templates/"&setting.defaultTemplate&"/"&setting.htmlFilePath&"/index.html"	
	
	if not CheckTemplateFile(templatePath) then echo "index.html"&err_16	
	with templateObj 
		.content=loadFile(templatePath) 
		.parseHtml()
		.indexpath
		.parseCommon
		echo .content 
	end with	
	set templateobj =nothing : terminateAllObjects
Else
	On Error Resume Next
	Server.Transfer(sitePath&setting.languagepath&"index"&FileExt)
	If -2147467259 = Err.Number Then Response.Charset="gbk":Response.Write "ȱ����ҳ�ļ������¼��̨������ҳ�ļ���"	
end if
If DebugMode Then echo timer - AppSpan 
%>