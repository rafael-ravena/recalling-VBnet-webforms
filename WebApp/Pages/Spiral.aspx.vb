Imports Spiral

Public Class Spiral
    Inherits System.Web.UI.Page

    Protected Sub Generate(sender As Object, e As EventArgs) Handles BtnGenerate.Click
        Dim spiral As New SpiralBuilder
        If Not IsNumeric(TxtSize.Text) Then
            LblResult.Text = "<h4 class=""text-danger"">To create a snake, we need to know how many times it turns around it's own tail. Please help us know.</h4>"
            Return
        End If
        If Decimal.Parse(TxtSize.Text) > spiral.MaxSupportedSize Then
            LblResult.Text = $"<h4 class=""text-danger"">Please enter a number between {spiral.MinSupportedSize} and {spiral.MaxSupportedSize}. <br />We have no room for such a huge, scary snake.<br />For that, you should visit the Python page <a href=""https://www.python.org/"" target=""_blank"">here</a>.<h4>"
            Return
        End If
        If Decimal.Parse(TxtSize.Text) < spiral.MinSupportedSize Then
            LblResult.Text = $"<h4 class=""text-danger"">If we would create such uncommon snake, smaller than {spiral.MinSupportedSize}, the universe would start returning to Big Bang, time would be passing backwards, and Einstein would show his tongue out, for you.<br/>He probably doesn't want to do that, does him?</h4>"
            Return
        End If
        Try
            Dim size As Integer = Convert.ToInt32(TxtSize.Text)
            Dim matrix As Dictionary(Of Integer, Dictionary(Of Integer, Integer)) = Spiral.GetSpiralMatrix(size, 1)

            Dim sb As New StringBuilder
            sb.Append("<table class=""table table-dark table-bordered"">")
            For Each row In matrix
                sb.Append("<tr>")
                For Each col In row.Value
                    If col.Value < 0 Then
                        sb.Append($"<td> &nbsp; </td>")
                    Else
                        sb.Append($"<td> {col.Value} </td>")
                    End If
                Next
                sb.Append("</tr>")
            Next
            sb.Append("</table>")

            LblResult.Text = sb.ToString()
        Catch ex As Exception
            LblResult.Text = "<h4 class=""text-danger"">We are sorry, but something went wrong while creating the snake.<br />Please check your inputs to see if there's no rattel around. Snakes hate them!</h4>"
        End Try

    End Sub

End Class