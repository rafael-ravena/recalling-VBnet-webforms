Public Class _Default
    Inherits Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Dim masterPage As SiteMaster = CType(Me.Master, SiteMaster)
        masterPage.IsLeftBlockVisible = False
        masterPage.IsHeaderVisible = False
    End Sub
End Class