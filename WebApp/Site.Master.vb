Public Class SiteMaster
    Inherits MasterPage

    Property IsLeftBlockVisible As Boolean
        Get
            Return LeftBlock.Visible
        End Get
        Set(value As Boolean)
            LeftBlock.Visible = value
        End Set
    End Property

    Property IsHeaderVisible As Boolean
        Get
            Return CardHeader.Visible
        End Get
        Set(value As Boolean)
            CardHeader.Visible = value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load

    End Sub
End Class