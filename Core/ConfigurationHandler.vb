Imports System.IO
Imports Newtonsoft.Json

Public Class ConfigurationHandler(Of T)
    Implements IConfigurationHandler(Of T)
    Private _configuration As T

    ' Load configuration from a JSON file
    ' implement L10n and I18n to get localized configuration
    Public Sub New(filePath As String)
        If Not File.Exists(filePath) Then
            Throw New FileNotFoundException($"Configuration file not found: {filePath}")
        End If
        _configuration = JsonConvert.DeserializeObject(Of T)(File.ReadAllText(filePath))
    End Sub

    Public Property [Get] As T Implements IConfigurationHandler(Of T).Get
        Get
            Return _configuration
        End Get
        Set(value As T)
            _configuration = value
        End Set
    End Property

End Class