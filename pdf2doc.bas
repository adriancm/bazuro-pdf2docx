Attribute VB_Name = "NewMacros"

Sub PDF2DOC()
Attribute PDF2DOC.VB_ProcData.VB_Invoke_Func = "Normal.NewMacros.PDF2DOC"
'
' PDF2DOC Macro
'
'
    ChangeFileOpenDirectory ThisDocument.Path
    ActiveDocument.SaveAs2 FileName:=Left(ActiveDocument.FullName, InStrRev(ActiveDocument.FullName, ".")) + "docx", FileFormat:= _
        wdFormatXMLDocument, LockComments:=False, Password:="", AddToRecentFiles _
        :=True, WritePassword:="", ReadOnlyRecommended:=False, EmbedTrueTypeFonts _
        :=False, SaveNativePictureFormat:=False, SaveFormsData:=False, _
        SaveAsAOCELetter:=False, CompatibilityMode:=15
    Application.Quit SaveChanges:=wdDoNotSaveChanges
End Sub
