VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Gridcoin to Gridcoin Converter"
   ClientHeight    =   3030
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   4560
   LinkTopic       =   "Gridcoin to Gridcoin Converter"
   ScaleHeight     =   3030
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdConvert 
      Caption         =   "Convert Files"
      Height          =   495
      Left            =   1320
      TabIndex        =   0
      Top             =   1200
      Width           =   1455
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdConvert_Click()
Dim a(63) As String
'Convert all Gridcoin literals to Gridcoin Literals
a(0) = "a:\gridcoin\doc\"
a(1) = "a:\gridcoin\doc\release-notes\bitcoin\"
a(2) = "a:\gridcoin\qa\"
a(3) = "a:\gridcoin\qa\pull-tester\"
a(4) = "a:\gridcoin\qa\rpc-tests\"
a(5) = "a:\gridcoin\qa\rpc-tests\test_framework\"
a(6) = "a:\gridcoin\src\"
a(7) = "a:\gridcoin\share\"
a(8) = "a:\gridcoin\share\qt\"
a(9) = "a:\gridcoin\src\bench\"
a(10) = "a:\gridcoin\src\compat\"
a(11) = "a:\gridcoin\src\drafted\"
a(12) = "a:\gridcoin\src\crypto\"
a(13) = "a:\gridcoin\src\drafted\"
a(14) = "a:\gridcoin\src\qt\"
a(15) = "a:\gridcoin\src\qt\forms\"
a(16) = "a:\gridcoin\src\qt\locale\"
a(17) = "a:\gridcoin\src\qt\res\css\"
a(18) = "a:\gridcoin\src\rpc\"
a(19) = "a:\gridcoin\src\test\"
a(20) = "a:\gridcoin\src\test\data\"
a(21) = "a:\gridcoin\src\wallet\"
a(22) = "a:\gridcoin\src\zmq\"
a(23) = "a:\gridcoin\"
a(24) = "a:\gridcoin\.tx\"
a(25) = "a:\gridcoin\build-aux\m4\"
a(26) = "a:\gridcoin\contrib\debian\"
a(27) = "a:\gridcoin\contrib\"
a(28) = "a:\gridcoin\contrib\gitian-descriptors\"
a(29) = "a:\gridcoin\contrib\devtools\"
a(30) = "a:\gridcoin\contrib\debian\manpages\"
a(31) = "a:\gridcoin\contrib\init\"
a(32) = "a:\gridcoin\contrib\linearize\"
a(33) = "a:\gridcoin\gridcoin-docs\"

a(34) = "a:\gridcoin\contrib\seeds\"
a(35) = "a:\gridcoin\contrib\spendfrom\"
a(36) = "a:\gridcoin\contrib\testgen\"
a(37) = "a:\gridcoin\contrib\Utils\"
a(38) = "a:\gridcoin\contrib\verify-commits\"
a(39) = "a:\gridcoin\depends\"
a(40) = "a:\gridcoin\doc\"
a(41) = "a:\gridcoin\doc\release-notes\bitcoin\"
a(42) = "a:\gridcoin\contrib\macdeploy\"
a(43) = "a:\gridcoin\contrib\macdeploy\Base.lproj\"
a(44) = "a:\gridcoin\doc\release-notes\gridcoin\"
a(45) = "a:\gridcoin\qa\"
a(46) = "a:\gridcoin\src\wallet\test\"
a(47) = "a:\gridcoin\src\support\"
a(48) = "a:\gridcoin\src\script\"
a(49) = "a:\gridcoin\src\qt\test\"
a(50) = "a:\gridcoin\src\qt\res\src\"
a(51) = "a:\gridcoin\contrib\debian\examples\"
a(52) = "a:\gridcoin\contrib\gitian-downloader\"
a(53) = "a:\gridcoin\contrib\qos\"
a(54) = "a:\gridcoin\src\qt\res\"

'Gridcoin Core, gridcoin, Gridcoin, GRIDCOIN, gridcoin
Dim b(24) As String
b(1) = "Gridcoin Core"
b(2) = "gridcoin"
b(3) = "gridcoincore"
b(4) = "GRIDCOIN"
b(5) = "Gridcoin"
b(6) = "GridCoin"
b(7) = "GridcoinCore"
b(8) = "Gridcoincore"
b(9) = "gridcoind"
b(10) = "gridcoin-qt"
b(11) = "gridcoin"
b(12) = "GridCoin"
b(13) = "Gridcoin"
b(14) = "Gridcoin"
b(15) = "gridcoin"

Dim c(24) As String
c(1) = "Gridcoin Core"
c(2) = "gridcoin"
c(3) = "gridcoincore"
c(4) = "GRIDCOIN"
c(5) = "Gridcoin"
c(6) = "GridCoin"
c(7) = "GridcoinCore"
c(8) = "Gridcoincore"
c(9) = "gridcoind"
c(10) = "gridcoin-qt"
c(11) = "gridcoin"
c(12) = "GridCoin"
c(13) = "Gridcoin"
c(14) = "Gridcoin"
c(15) = "gridcoin"

LiteralCount = 15

For x = 0 To 54
    Dim fso As New FileSystemObject
    Dim fld As Folder
    Dim fil As File
    Set fld = fso.GetFolder(a(x))
    For Each fil In fld.Files
         For y = 1 To LiteralCount
            If ContainsLiteral(fil.Path, b(y)) Then
                        Debug.Print fil.Name
                        Call RewriteFile(fil.Path, b(y), c(y))
            End If
         Next y
    Next
Next x
End
End Sub
Private Function RewriteFile(sFileName, sLiteral, sNewLiteral)
Open sFileName For Input As #1
Open "temp.txt" For Output As #2
Do While EOF(1) = False
    Line Input #1, sTemp
    If InStr(1, sTemp, sLiteral) > 0 Then
        sTemp = Replace(sTemp, sLiteral, sNewLiteral)
    End If
    Print #2, sTemp
Loop
Close #1
Close #2
Kill sFileName
FileCopy "temp.txt", sFileName
End Function
Private Function ContainsLiteral(sFileName, sLiteral)
Open sFileName For Input As #1
Do While EOF(1) = False
    Line Input #1, sTemp
    If InStr(1, sTemp, sLiteral) > 0 Then
        Close #1
        ContainsLiteral = True: Exit Function
    End If
Loop
Close #1
ContainsLiteral = False
Exit Function
End Function
