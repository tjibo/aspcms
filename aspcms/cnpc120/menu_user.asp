<!--#include file="inc/AspCms_SettingClass.asp" -->
<%CheckLogin()%>
<%
sub menulist(ParentID)
	Dim rs :set rs =Conn.Exec ("select *,(select count(*) from {prefix}Sort where ParentID=t.SortID) as c from AspCms_Sort t where LanguageID="&session("languageID")&" and ParentID="&ParentID&"  and sortstatus=1 order by Sortorder ","r1")
	
	dim sortTypenames : sortTypenames=split(sortTypes,",")
	IF rs.eof or rs.bof Then
		echo "<tr bgcolor=""#ffffff"" align=""center""><td colspan=""8"">��û�м�¼</td></tr>"
	Else
		dim selecti:selecti=0
		Do While not rs.eof 
			selecti=selecti+1
			dim s,sstr

			echo	"<li>"&vbcrlf
			if rs("SortType")=1  then
			
			echo "<a href='_content/_About/AspCms_AboutEdit_user.asp?id="&rs("SortID")&"' target='main'>"&rs("SortName")&"</a>"
			
			elseif rs("SortType")=7  then
			
			echo "<a href='_content/_Sort/AspCms_SortEdit.asp?id="&rs("SortID")&"&usertype=1' target='main'>"&rs("SortName")&"</a>"
			else
			
			echo "<a href='_content/_Content/AspCms_ContentList_user.asp?sorttype="&rs("SortType")&"&SortID="&rs("SortID")&"' target='main'>"&rs("SortName")&"</a> | <a href='_content/_Content/AspCms_ContentAdd.asp?sortType="& rs("SortType")&"&sortid="& rs("SortID")&"' target='main'>���</a>" &vbcrlf
			end if
			
				if rs("c")>0 then
				echo "<a href='#' class='sub'  target='_self'>+</a> "&vbcrlf
				echo "<ul class=child>"&vbcrlf
				menulist(rs("SortID"))
				echo "</ul>"&vbcrlf
				end if
			echo    "</li>"&vbcrlf


			
			
			
			
			
			
			
			
			
			
			
			rs.MoveNext
		Loop
		rs.close : set rs = nothing
	End If
end sub
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>menu</title>

<link href="css/css_menu_user.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script language="javascript" type="text/javascript" src="js/jquery.min.js"></script>
<style type="text/css">
ul,li{
list-style:none;
font-size:12px;
line-height:30px;

margin:0;

}
.child{
display:none;
}
.nav a{
display:inline-block;
color:#5c84c1;
padding-left:10px;
}
.nav a.sub{
display:block;
float:right;
height:15px;
width:15px;
text-align:center;
line-height:15px;
font-size:15px;
padding:0px;
margin:5px 10px 0 0;
border:1px solid #fff ;
}
</style>
</head>

<script language="javascript" type="text/javascript">
//˵�� ���е�Ԫ����ul li ul li ul li��ѭ����ʽǶ�� ���û���¼����� ����li a����Ƕ��
$(document).ready(function(){
//$(".nav ul li").children("ul").hide();
$(".nav").find("li").not(":has(ul)").children("a").css({textDecoration:"none",color:"#333",background:"none"})
.click(function(){
$(this).get(0).location.href="'"+$(this).attr("href")+"'";
});
$(".nav").find("li:has(ul)").children("a.sub").html("+")
.click(function(){
if($(this).next("ul").is(":hidden")){
$(this).next("ul").slideDown("slow");
if($(this).parent("li").siblings("li").children("ul").is(":visible")){
$(this).parent("li").siblings("li").find("ul").slideUp("1000");
$(this).parent("li").siblings("li:has(ul)").children("a.sub").html("+")
.end().find("li:has(ul)").children("a.sub").html("+");}
$(this).html("-");
return false;
}else{
$(this).next("ul").slideUp("normal");
//����toggle()��ԭ����Ϊ���������˵���ʱ��ͬʱҲ���ò˵����¼��˵��Ժ������Ԫ�ض�����
$(this).html("+");
$(this).next("ul").children("li").find("ul").fadeOut("normal");
$(this).next("ul").find("li:has(ul)").children("a.sub").html("+");
return false;
}
});
});
</script>
<base target="main" />
<body>

<div class="nav">
</ul>


		<%menulist(0)%>


<li><a href="###"  target="_self">��������</a><a href="#" class='sub' target="_self">+</a>
   <ul class="child">
<li><a href='_content/_Comments/AspCms_Message.asp' target='main'>���Թ���</a></li>
<li><a href='_content/_Order/AspCms_Order.asp' target='main'>��������</a></li>
<li><a href='_content/_Apply/AspCms_Apply.asp' target='main'>ӦƸ����</a></li>
<li><a href='_content/_Comments/AspCms_Comments.asp' target='main'>���۹���</a></li>
<li><a href='_adv/AspCms_Advlist.asp' target='main'>������</a></li>
<li><a href='_seo/AspCms_MakeHtml.asp?actType=html' target='main'>��̬����</a></li>

        </ul>
</li>
</ul>

</div>

</body>
</html>
