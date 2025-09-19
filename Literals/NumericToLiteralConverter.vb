Imports System.Text
Imports Core

Public Class NumericToLiteralConverter

    Private Const UncleScroogeExceptionMessage As String = "That's too much money! We'll need to borrow it from Uncle Scrooge. Call me back when you're up to it..."
    Private configuration As IConfigurationHandler(Of LiteralConfiguration)
    Public Sub New(configuration As IConfigurationHandler(Of LiteralConfiguration))
        Me.configuration = configuration
    End Sub

    Public Function Convert(number As Decimal) As String
        Dim integerPart As Decimal = Math.Truncate(number)
        If number > Decimal.MaxValue Then
            Throw New InvalidOperationException(UncleScroogeExceptionMessage)
        End If
        Dim decimalPart As Integer = CInt((number - integerPart) * 100)

        Dim integerLiteral As String = MakeFirstLetterUpperCase(ConvertNumericPart(integerPart))
        Dim decimalLiteral As String = $"{decimalPart:00}/100"
        Return $"{integerLiteral.Replace("- ", "-")}{configuration.Get.Separator} {decimalLiteral} {configuration.Get.Currency}"
    End Function

    Private Function ConvertNumericPart(number As Decimal) As String
        Return ConvertNumericPart(number, 0)
    End Function

    Private Function ConvertNumericPart(number As Decimal, ordinal As Integer) As String
        Dim sb As New StringBuilder()
        If ordinal >= configuration.Get.ThousandSeparator.Length Then
            Throw New InvalidOperationException(UncleScroogeExceptionMessage)
        End If
        If number >= 1000 Then
            sb.Append(ConvertNumericPart(Math.Truncate(number / 1000), (ordinal + 1)))
            number = number - (1000 * Math.Truncate(number / 1000))
        End If

        Dim lessThanThousandsNumberText As String = ConvertLessThanThousands(number)

        If Not String.IsNullOrEmpty(lessThanThousandsNumberText.Trim()) Then
            sb.Append(lessThanThousandsNumberText.Trim())
            sb.Append($" {configuration.Get.ThousandSeparator(ordinal)}")
        End If
        sb.AppendLine()

        Return sb.ToString()
    End Function

    Private Function ConvertLessThanThousands(number As Decimal) As String
        Dim hundreds As New StringBuilder()
        Dim tens As New StringBuilder()
        Dim units As New StringBuilder()

        If number >= 100 Then
            hundreds.Append($"{configuration.Get.Units(Math.Truncate(number / 100))} {configuration.Get.Hundreds}")
            number = number - (100 * Math.Truncate(number / 100))
        End If
        If number >= 20 Then
            tens.Append($"{configuration.Get.Decimals(Math.Truncate(number / 10))}")
            number = number - (10 * Math.Truncate(number / 10))
        End If
        units.Append($"{configuration.Get.Units(number)}")
        Dim sb As New StringBuilder()
        sb.Append(hundreds.ToString())
        sb.Append(" ")
        sb.Append(tens.ToString())
        If tens.Length > 0 AndAlso units.Length > 0 Then
            sb.Append($"-")
        Else
            sb.Append(" ")
        End If
        sb.Append(units.ToString())
        Return sb.ToString()
    End Function

    Private Function MakeFirstLetterUpperCase(text As String) As String
        Dim sb As New StringBuilder()
        If text.Length > 1 Then
            sb.Append(Char.ToUpper(text.Trim()(0)))
            sb.Append(text.Trim().Substring(1).ToLower())
        End If
        sb.Append(vbNewLine)
        Return sb.ToString()
    End Function
End Class
