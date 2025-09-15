Imports Core
Imports Literals

Public Class Literals
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub ConvertAmount(sender As Object, e As EventArgs) Handles BtnConvert.Click
        If Not IsNumeric(TxtAmount.Text) Then
            LblResult.Text = "Please enter a valid number."
            Return
        End If
        Try
            If Convert.ToDecimal(TxtAmount.Text) < 0 Then
                LblResult.Text = "Please enter a non-negative number."
                Return
            End If
            Dim LiteralConfig As New ConfigurationHandler(Of LiteralConfiguration)(Server.MapPath("~/literals.json"))
            Dim converter As New NumericToLiteralConverter(LiteralConfig)
            LblResult.Text = converter.Convert(Convert.ToDecimal(TxtAmount.Text))
        Catch ex As Exception
            If TypeOf ex Is InvalidOperationException Then
                LblResult.Text = ex.Message
                Return
            End If
            PnlError.Visible = True
            LblErrorTrace.Text = ex.Message
            Return
        End Try
    End Sub
End Class