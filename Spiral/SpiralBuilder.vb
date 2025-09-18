Public Class SpiralBuilder
    Public ReadOnly Property MaxSupportedSize As Integer = (36 * 36) - 1
    Public ReadOnly Property MinSupportedSize As Integer = 1
    Private Property Spiral As New Dictionary(Of String, Integer)()

    Public Function GetSpiralMatrix(number As Integer, direction As SpiralDirection) As Dictionary(Of String, Integer)

        Dim maxValue As Integer = GetMaxValue(number)

        Dim currentValue As Integer = 0
        Dim currentDirection As SpiralDirection = direction
        Dim currentX As Integer = 0
        Dim currentY As Integer = 0
        Dim isSecondTurn As Boolean = False
        Dim stepSize As Integer = 1
        PrintNumberAndMove(number, maxValue, currentValue, currentX, currentY, currentDirection, stepSize, isSecondTurn)
        Return SortSpiralDictionary()
    End Function

    Private Function GetMaxValue(number As Integer) As Integer
        Dim size As Integer = Math.Ceiling(Math.Sqrt(number + 1))
        Return size * size
    End Function

    Private Sub PrintNumberAndMove(number As Integer, maxValue As Integer, currentValue As Integer, currentX As Integer, currentY As Integer, currentDirection As SpiralDirection, stepSize As Integer, isSecondTurn As Boolean)
        If currentValue > maxValue Then
            Return
        End If
        For i = 1 To stepSize
            PlaceValueIntoMatrix(currentX, currentY, currentValue, number)
            currentY = SetCurrentY(currentY, currentDirection)
            currentX = SetCurrentX(currentX, currentDirection)
            currentValue += 1
        Next
        currentDirection = GetNewDirection(currentDirection)
        stepSize += IncreaseStepSizeIfNeeded(isSecondTurn)
        isSecondTurn = Not isSecondTurn
        PrintNumberAndMove(number, maxValue, currentValue, currentX, currentY, currentDirection, stepSize, isSecondTurn)
    End Sub

    Private Sub PlaceValueIntoMatrix(currentX As Integer, currentY As Integer, currentValue As Integer, number As Integer)
        Dim key As String = $"{currentY},{currentX}"
        Spiral(key) = currentValue
        If currentValue > number Then
            Spiral(key) = -1
        End If
    End Sub

    Public Function GetTupleFromSpiralKey(key As String) As (Integer, Integer)
        Dim parts = key.Split(","c)
        Dim y = Integer.Parse(parts(0))
        Dim x = Integer.Parse(parts(1))
        Return (y, x)
    End Function

    Private Function SortSpiralDictionary() As Dictionary(Of String, Integer)
        Return Spiral.OrderBy(Function(kvp) GetTupleFromSpiralKey(kvp.Key)).ToDictionary(Function(kvp) kvp.Key, Function(kvp) kvp.Value)
    End Function

    Private Function GetNewDirection(currentDirection As SpiralDirection) As SpiralDirection
        Return CType((CInt(currentDirection) + 1) Mod 4, SpiralDirection)
    End Function

    Private Function IncreaseStepSizeIfNeeded(isSecondTurn As Boolean) As Integer
        If isSecondTurn Then
            Return 1
        End If
        Return 0
    End Function

    Private Function SetCurrentY(currentY As Integer, direction As SpiralDirection) As Integer
        If direction = SpiralDirection.Up Then
            Return currentY - 1
        End If
        If direction = SpiralDirection.Down Then
            Return currentY + 1
        End If
        Return currentY
    End Function

    Private Function SetCurrentX(currentX As Integer, direction As SpiralDirection) As Integer
        If direction = SpiralDirection.Left Then
            Return currentX - 1
        End If
        If direction = SpiralDirection.Right Then
            Return currentX + 1
        End If
        Return currentX
    End Function

    Public Enum SpiralDirection
        Up = 0
        Right = 1
        Down = 2
        Left = 3
    End Enum
End Class
