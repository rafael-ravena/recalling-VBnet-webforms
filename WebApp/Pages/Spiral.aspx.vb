Imports Spiral

Public Class Spiral
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' Populate the DropDownList with SpiralDirection values
            Dim directions = [Enum].GetValues(GetType(SpiralBuilder.SpiralDirection))
            For Each direction As SpiralBuilder.SpiralDirection In directions
                SelDirection.Items.Add(New ListItem(direction.ToString(), CInt(direction)))
            Next
        End If
    End Sub

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
            Dim matrix As Dictionary(Of String, Integer) = spiral.GetSpiralMatrix(size, CType(SelDirection.SelectedValue, SpiralBuilder.SpiralDirection))

            Dim sb As New StringBuilder
            sb.Append("<table class=""table"">")
            Dim tuple = spiral.GetTupleFromSpiralKey(matrix.Keys(0))
            sb.Append("<tr>")
            For Each item In matrix
                Dim currentTuple = spiral.GetTupleFromSpiralKey(item.Key)
                If currentTuple.Item1 <> tuple.Item1 Then
                    sb.Append("</tr><tr>")
                    tuple = currentTuple
                End If
                sb.Append($"<td title=""{item.Key}"">")
                If item.Value = -1 Then
                    sb.Append("&nbsp;")
                Else
                    sb.Append(item.Value)
                End If
                sb.Append("</td>")
            Next
            sb.Append("</tr></table>")

            LblResult.Text = sb.ToString()
        Catch ex As Exception
            LblResult.Text = "<h4 Class= ""text-danger"">We are sorry, but something went wrong While creating the snake.<br />Please check your inputs To see If there's no rattel around. Snakes hate them!</h4>"
        End Try

    End Sub

End Class