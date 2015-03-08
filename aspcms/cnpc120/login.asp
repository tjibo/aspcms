<!--#include file="inc/AspCms_SettingClass.asp" -->
<%
dim action : action=getForm("action","get")
if action = "login" then
	dim UserName,Password,sql,code,Rs,atype
	UserName = filterPara(getForm("username","post"))
	atype = getForm("atype","post")
	Password = md5(getForm("Password","post"),16)
	code     = getForm("code","post")
	if admincode=1 then
		if code <> Session("Code") then	alertMsgAndGo "您填写的验证码错误!","-1"
	end if
	if isOutSubmit then  alertMsgAndGo"非法外部提交被禁止","-1"

	sql = "select count(1) from {prefix}User where LoginName = '"& UserName &"' and Password='"&Password&"'"
	Dim rsObj : Set rsObj=Conn.Exec(sql,"r1")
	if rsObj(0)=1 then
	
		
		Set rsObj=Conn.Exec("select IsAdmin, GroupStatus,GroupName, UserStatus, UserID, b.GroupMenu,GroupSort, LanguageID,adminrand from {prefix}User as a, {prefix}UserGroup as b where LoginName='"&UserName&"' and a.GroupID=b.GroupID","r1")	
		if not rsObj.Eof Then
			if rsObj("IsAdmin")<>1 then alertMsgAndGo"对不起，你不是管理员！","-1"
			if rsObj("GroupStatus")<>1 then alertMsgAndGo"对不起，您所在用户组已被禁用！","-1"
			if rsObj("UserStatus")<>1 then alertMsgAndGo"对不起，您的账号已被禁用！","-1"
			Session("adminName")=UserName
			Session("GroupName")=rsObj("GroupName")
			'wCookie"adminpwd",getForm("Password","post")
			Session("adminpwd") = getForm("Password","post")
			Session("adminId")=rsObj("UserID")
			Session("groupMenu")=repnull(rsObj("GroupMenu"))
			Session("GroupSort")=repnull(rsObj("GroupSort"))
			Session("sitepath")=SitePath
			'查找
			dim LanguageID
			LanguageID=rsObj("LanguageID")

			if isnul(LanguageID) then 				
				set rs=conn.exec("select LanguageID,LanguagePath,Alias from {prefix}Language where IsDefault=1","exe")
				if rs.eof then					
					echoErr err_15,15,"没有设置默认语言"
				else
					LanguageID=rs(0)
				end if
			else 	
				set rs=conn.exec("select LanguageID,LanguagePath,Alias from {prefix}Language where LanguageID="&LanguageID,"exe")				
				LanguageID=rs(0)	
			end if 
			randomize
			dim randnum
			randnum=clng(rnd*99999999)
			Conn.Exec"update {prefix}User set adminrand='"& randnum &"' where UserID="&rsObj("UserID"),"exe"	
			Session("adminrand")=randnum
			Session("languageID")=LanguageID			
			Session("LanguagePath")=rs("LanguagePath")
			Session("LanguageAlias")=rs("Alias")
			

			rs.close : set rs=nothing
			Conn.Exec"update {prefix}User set LastLoginTime='"&now()&"',LastLoginIP='"&getIp()&"',LoginCount=LoginCount+1 where UserID="&rsObj("UserID"),"exe"	
			if atype=0 then		
			response.Redirect("index.asp")
			else
			response.Redirect("index_user.asp")	
			end if
		end if
	else
		alertMsgAndGo "用户名或密码错误!","-1"
	end if
	rsObj.Close() : set rsObj=Nothing	
elseif action = "logout" then
	Session("adminName")=""
	Session("adminId")=""
	Session("groupMenu")=""
	Session("SceneMenu")=""
	response.Redirect("login.asp"):response.End()
elseif action = "relog" then
	alertMsgAndGo "对不起,您的登录状态已经失效,请重新登录!","login.asp"
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title><%=setting.siteTitle%></title>
<style type="text/css">
<!--

body{ background:#ededed; margin:0; padding:0; font-size:14px; font-family:"Microsoft Yahei","宋体","Tahoma","Arial"; color:#4d4d4d;}
.top{ height:199px; background:url(./images/top.jpg) center no-repeat; margin:0 auto;}
.main{ height:240px; background:url(./images/main_bg.jpg) repeat-x;}
.box{ height:225px; background:url(./images/main.jpg) center no-repeat; margin:0 auto; padding:15px 0 0 0;}
.bottom{ background:url(./images/bottom.jpg) center no-repeat; height:56px;}
.user{ width:200px; height:27px; line-height:27px; border:1px solid #7ea3b8; padding:0 0 0 35px; font-size:14px;}
.user_bg1{ background:url(./images/user01.jpg) left no-repeat #fff;}
.user_bg2{ background:url(./images/user02.jpg) left no-repeat #fff;}
.user_bg3{ width:64px; padding:0 0 0 2px;}
.but{ width:136px; height:40px; background:url(./images/but.png) no-repeat; border:none;cursor:pointer;}
.lang{height:21px;border:1px solid #7ea3b8;}
form{margin:0;padding:0}
.noticediv{display:none;border:1px #fc5959 solid;background:#FFFDF4 url(./images/chk_error.gif) 10px no-repeat;padding-left:33px;line-height:25px;margin:3px 0px;width:202px;}


-->
</style>
<script type="text/javascript" language="javascript">
<!--
	window.onload = function (){
		var txtUserName = document.getElementById("username");
		var txtPassword = document.getElementById("password");
		changeimg();
		var username = readCookie("username");
		if(username!="")
		{
		txtUserName.value = username;
		txtPassword.focus();
		}
		else	txtUserName.focus();
		document.getElementById("code").value = "";
	}
function changeimg(){document.getElementById('SeedImg').src='../inc/checkcode.asp?'+Math.random();}
function writeCookie(name, value, hours){
  var expire = "";
  if(hours != null)  {
    expire = new Date((new Date()).getTime() + hours * 3600000);
    expire = "; expires=" + expire.toGMTString();
  }
  document.cookie = name + "=" + escape(value) + expire;

}
function readCookie(name){
  var cookieValue = "";
  var search = name + "=";
  if(document.cookie.length > 0) { 
    offset = document.cookie.indexOf(search);
    if (offset != -1)  { 
      offset += search.length;
      end = document.cookie.indexOf(";", offset);
      if (end == -1) end = document.cookie.length;
      cookieValue = unescape(document.cookie.substring(offset, end))
    }
  }
  return cookieValue;
}


-->
</script>

</head>
<body>
<div class="top"></div>

<div class="main">
	<div class="box">
		<form method="post" action="?action=login" onsubmit="writeCookie('username',this.username.value, 1)">
		<input type="hidden" name="gotopage" value="/aspcms/index.asp">
        <input type="hidden" name="dopost" value="login">
		<table cellspacing="0" align="center" border="0" cellpadding="0" width="260">
		<tbody>
		<tr>
			<td height="40">帐   号：<input type="text"  id="username" name="username" size="20" maxlength="20" onfocus="this.style.borderColor='#239fe3'" onblur="this.style.borderColor='#dcdcdc'" /></td>
		</tr>
 
  <tr>
    <td height="40">密   码：<input type="password" id="password" maxlength="20" name="password"  size="20" onfocus="this.style.borderColor='#239fe3'" onblur="this.style.borderColor='#dcdcdc'" /></td>
    </tr>

  <%if admincode=1 then%>


  <tr>
    <td height="40">验证码：<input type="text" id="code" name="code"   size="10" maxlength="4" onfocus="this.style.borderColor='#239fe3'" onblur="this.style.borderColor='#dcdcdc'" /><img src="../inc/checkcode.asp" id="SeedImg" align="absmiddle" style="cursor:pointer;" border="0" alt="点我刷新" title="点我刷新" onclick="changeimg()" />
					 </td>
    </tr>
	 <%end if%>
	 
  <tr>
    <td height="40"><input name="atype" type="hidden" value="1" checked="checked"/>
					 </td>
    </tr>
               

  <tr>
    <td><div id="notice" class="noticediv"></div></td>
    </tr>
  <tr>
    <td colspan="3" height="60" valign="bottom">
    <input name="act" id="act" value="adminlogin" type="hidden">
    <input name="submit" class="but" value=" " type="submit"></td>
    </tr>
  </tbody></table>
</form></div>


		
                      
                
          
	

</body>
</html>
