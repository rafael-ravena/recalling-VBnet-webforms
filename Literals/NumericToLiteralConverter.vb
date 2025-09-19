Imports System.Text
Imports Core

Public Class NumericToLiteralConverter

    Private Const UncleScroogeExceptionMessage As String = "That's too much money! We'll need to borrow it from Uncle Scrooge. Call me back when you're up to it..."
    Private configuration As IConfigurationHandler(Of LiteralConfiguration)
    Public Sub New(configuration As IConfigurationHandler(Of LiteralConfiguration))
        Me.configuration = configuration
    End Sub

    Public Function Convert(number As Decimal) As String
        Dim integerPart As Long = Math.Truncate(number)
        If number > Long.MaxValue Then
            Throw New InvalidOperationException(UncleScroogeExceptionMessage)
        End If
        Dim decimalPart As Integer = CInt((number - integerPart) * 100)

        Dim integerLiteral As String = ConvertNumericPart(integerPart).Replace("- ", "-")
        Dim decimalLiteral As String = $"{decimalPart:00}/100"
        Return $"{integerLiteral} {vbNewLine}{configuration.Get.Separator} {decimalLiteral} {configuration.Get.Currency}"
    End Function

    Private Function ConvertNumericPart(number As Long) As String
        Return ConvertNumericPart(number, 0)
    End Function

    Private Function ConvertNumericPart(number As Long, ordinal As Integer) As String
        Dim sb As New StringBuilder()
        If ordinal >= configuration.Get.ThousandSeparator.Length Then
            Throw New InvalidOperationException(UncleScroogeExceptionMessage)
        End If
        If number >= 1000 Then
            sb.Append(ConvertNumericPart(Math.Truncate(number / 1000), ordinal + 1))
            sb.AppendLine($" {configuration.Get.ThousandSeparator(ordinal)}")
            number = number - (1000 * Math.Truncate(number / 1000))
        End If

        sb.Append(ConvertLessThanThousands(number))

        Return MakeFirstLetterUpperCase(sb.ToString().Trim())
    End Function

    Private Function ConvertLessThanThousands(number As Long) As String
        Dim sb As New StringBuilder()
        'actual number-to-text conversion
        If number >= 100 Then
            sb.Append($"{configuration.Get.Units(Math.Truncate(number / 100))} {configuration.Get.Hundreds}")
            number = number - (100 * Math.Truncate(number / 100))
        End If
        If number >= 20 Then
            sb.Append($" {configuration.Get.Decimals(Math.Truncate(number / 10))}-")
            number = number - (10 * Math.Truncate(number / 10))
        End If
        sb.Append($" {configuration.Get.Units(number)}")
        Return sb.ToString()
    End Function

    Private Function MakeFirstLetterUpperCase(text As String) As String
        Dim sb As New StringBuilder()
        sb.Append(Char.ToUpper(text(0)))
        If text.Length > 1 Then
            sb.Append(text.Substring(1).ToLower())
        End If
        Return sb.ToString().Trim()
    End Function
End Class
