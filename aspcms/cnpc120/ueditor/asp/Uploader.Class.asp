<!--#include file="PathFormatter.class.asp"-->
<!--#include file="MultiformProcessor.class.asp"-->

<%
' ASP �ļ��ϴ���
' Author: techird
' Email: techird@qq.com

'����
'MAX_SIZE �������趨��֮��������ִ��ϴ�ʧ�ܣ���ִ�����²���
'IIS 6 
    '�ҵ�λ�� C:\Windows\System32\Inetsrv �е� metabase.XML �򿪣��ҵ�ASPMaxRequestEntityAllowed �����޸�Ϊ��Ҫ��ֵ����10240000��10M��
'IIS 7
    '��IIS����̨��ѡ�� ASP����������������һ�����������ʵ���������ơ���������Ҫ��ֵ

CURRENT_ENCODING = "gb2312"

Class Uploader

    '�ϴ�����
    Private cfgMaxSize
    Private cfgAllowType
	Private cfgUpPath
    Private cfgPathFormat
    Private cfgFileField

    '�ϴ�������Ϣ
    Private stateString
    Private rsOriginalFileName
    Private rsFilePath

    Private rsFileName
    Private rsFileSize
    Private rsState
    Private rsFormValues

    Private Sub Class_Initialize
        Set stateString = Server.CreateObject("Scripting.Dictionary")
        stateString.Add "SIZE_LIMIT_EXCCEED", "File size exceeded!"
        stateString.Add "TYPE_NOW_ALLOW", "File type not allowed!"
    End Sub

    Public Property Let MaxSize(ByVal size)
        cfgMaxSize = size
    End Property

    Public Property Let AllowType(ByVal types)
        Set cfgAllowType = types
    End Property

    Public Property Let PathFormat(ByVal format)
        cfgPathFormat = format
    End Property
	
    Public Property Let UpPath(ByVal format)
        cfgUpPath = format
    End Property

    Public Property Let FileField(ByVal field)
        cfgFileField = field
    End Property

    Public Property Get OriginalFileName
        OriginalFileName = rsOriginalFileName
    End Property

    Public Property Get FileName
        FileName = rsFileName
    End Property 

    Public Property Get FilePath
        FilePath = rsFilePath
    End Property

    Public Property Get FileSize
        FileSize = rsFileSize
    End Property

    Public Property Get State
        State = rsState
    End Property

    Public Property Get FormValues
        Set FormValues = rsFormValues
    End Property

    Public Function UploadForm()
        ProcessForm()
        SaveFile()
    End Function

    Public Function ProcessForm()        
        Set processor = new MultiformProcessor
        Set rsFormValues = processor.Process()
    End Function

    Public Function SaveFile()
        Dim stream, filename
        Set stream = rsFormValues.Item( cfgFileField )
        filename = rsFormValues.Item( "filename" )
        DoUpload stream, filename
    End Function

    Public Function UploadBase64( filename ) 
        Dim stream, content
        content = Request.Item ( cfgFileField )
        Set stream = Base64Decode( content )

        DoUpload stream, filename
    End Function

    Public Function UploadRemote( url )
        Dim stream, filename
        filename = Right( url, Len(url) - InStrRev(url, "/") )

        Set stream = CrawlImage( url )

        If Not IsNull(stream) Then
            DoUpload stream, filename
        Else
            rsState = "Failed"
        End If
        Set stream = Nothing
    End Function

    Private Function DoUpload( stream, filename )

        rsFileSize = stream.Size
        If rsFileSize > cfgMaxSize Then
            rsState = stateString.Item( "SIZE_LIMIT_EXCCEED" )
            Exit Function
        End If

        rsOriginalFileName = filename
        fileType = GetExt(filename)
        If CheckExt(fileType) = False Then
            rsState = stateString.Item( "TYPE_NOW_ALLOW" )
            Exit Function
        End If
        
        Set formatter = new PathFormatter
        rsFilePath = formatter.format( cfgUpPath & cfgPathFormat, filename )
        
        savePath = Server.MapPath(rsFilePath)
        CheckOrCreatePath(  GetDirectoryName(savePath) )

        stream.SaveToFile savePath
        stream.Close
        rsState = "SUCCESS"
    End Function

    Private Function GetDirectoryName(path)
        GetDirectoryName = Left( path, InStrRev(path, "\") )
    End Function

    Private Function Base64Decode( content )
        dim xml, stream, node
        Set xml = Server.CreateObject("MSXML2.DOMDocument")
        Set stream = Server.CreateObject("ADODB.Stream")
        Set node = xml.CreateElement("tmpNode")
        node.dataType = "bin.base64"
        node.Text = content
        stream.Charset = CURRENT_ENCODING
        stream.Type = 1
        stream.Open()
        stream.Write( node.nodeTypedValue )
        Set Base64Decode = stream
        Set node = Nothing
        Set stream = Nothing
        Set xml = Nothing
    End Function

    Private Function CrawlImage( url )
        Dim http, stream
        Set http = Server.CreateObject("Microsoft.XMLHTTP")
        http.Open "GET", url, false
        http.Send
        If http.Status = 200 Then
            Set stream = Server.CreateObject("ADODB.Stream")
            stream.Type = 1
            stream.Open()
            stream.Write http.ResponseBody
            Set CrawlImage = stream
        Else
            Set CrawlImage = null
        End If
        Set http = Nothing
    End Function

    Private Function CheckExt( fileType )
        If IsEmpty (cfgAllowType) Then
            CheckExt = true
             Exit Function
        End If
        For Each ext In cfgAllowType
            If UCase(fileType) = UCase(cfgAllowType.Item(ext)) Then 
                CheckExt = true
                Exit Function
            End If
        Next
        CheckExt = false
    End Function
    
    Private Function GetExt( file )
        GetExt = Right( file, Len(file) - InStrRev(file, ".") + 1 )
    End Function

'   Private Function CheckOrCreatePath( ByVal path )
'       Set fs = Server.CreateObject("Scripting.FileSystemObject")
'       Dim parts
'       parts = Split( path, "\" )
'       path = ""
'       For Each part in parts
'           path = path + part + "\"
'           If fs.FolderExists( path ) = False Then
'               fs.CreateFolder( path )
'           End If
'       Next
'   End Function

Public Function CreateDir(ByVal crDirname) 
  Dim M_fso 
  CreateDir=False 
  Set M_fso = CreateObject("Scripting.FileSystemObject") 
  If (M_fso.FolderExists(crDirname)) Then 
   CreateDir=False 
  Else 
   M_fso.CreateFolder(crDirname) 
   CreateDir=True 
  End If 
  Set M_fso = Nothing 
 End Function 
 
 Function CheckOrCreatePath(byval LocalPath) '����Ŀ¼�ĳ�������ж༶Ŀ¼����һ��һ���Ĵ��� 
  on error resume next 
  LocalPath = replace(LocalPath,"\","/") 
  set FileObject = server.createobject("Scripting.FileSystemObject") 
  patharr = split(LocalPath,"/") 
  path_level = ubound(patharr) 
  for i = 0 to path_level 
  if i=0 then pathtmp=patharr(0) & "/" else pathtmp = pathtmp & patharr(i) & "/" 
  cpath = left(pathtmp,len(pathtmp)-1) 
  if not FileObject.FolderExists(cpath) then FileObject.CreateFolder cpath 
  next 
  set FileObject = nothing 
  if err.number<>0 then 
  CreateDIR = false 
  err.Clear 
  else 
  CreateDIR = true 
  end if 
 End Function

End Class
%>