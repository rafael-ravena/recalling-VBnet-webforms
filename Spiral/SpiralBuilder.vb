Public Class SpiralBuilder
    Public ReadOnly Property MaxSupportedSize As Integer = 324
    Public ReadOnly Property MinSupportedSize As Integer = 1
    Public Function GetSpiralMatrix(number As Integer, direction As Direction) As Dictionary(Of Integer, Dictionary(Of Integer, Integer))

        Dim spiral As New Dictionary(Of Integer, Dictionary(Of Integer, Integer))()

        Dim directions As (Integer, Integer)() = {(-1, 0), (0, 1), (1, 0), (0, -1)} ' up, right, down, left just like th CSS convention
        Dim directionIndex As Integer = CInt(direction) ' we'll start with up
        directionIndex = 0 'I can't get to make it work starting from other direction than up

        Dim size As Integer = Math.Ceiling(Math.Sqrt(number + 1)) 'shoot! we have to increase the size of the matrix for when it is equal to a perfect square
        Dim limitNumber As Integer = size * size

        Dim currentXPosition As Integer = size \ 2
        Dim currentYPosition As Integer = size \ 2

        Dim currentNumber As Integer = 0

        Dim turns As Integer = 0
        Dim stepsBeforeNextTurn As Integer = 1
        Dim currentSteps = 0

        While currentNumber <= limitNumber
            If currentNumber >= limitNumber AndAlso currentNumber > number Then Exit While

            If Not spiral.ContainsKey(currentXPosition) Then
                spiral(currentXPosition) = New Dictionary(Of Integer, Integer)()
            End If

            If currentNumber > number Then
                spiral(currentXPosition)(currentYPosition) = -1
            Else
                spiral(currentXPosition)(currentYPosition) = currentNumber
            End If
            currentNumber += 1

            currentXPosition += directions(directionIndex).Item1
            currentYPosition += directions(directionIndex).Item2

            currentSteps += 1

            If currentSteps = stepsBeforeNextTurn Then
                currentSteps = 0
                directionIndex = (directionIndex + 1) Mod directions.Length

                If directionIndex = 0 OrElse directionIndex = 2 Then
                    stepsBeforeNextTurn += 1
                End If
            End If

        End While

        Return spiral.
            OrderBy(Function(x) x.Key).
               ToDictionary(Function(x) x.Key,
                            Function(x) x.Value.OrderBy(Function(y) y.Key).
                                               ToDictionary(Function(y) y.Key, Function(y) y.Value))

    End Function

    Public Enum Direction
        Up = 0
        Right = 1
        Down = 2
        Left = 3
    End Enum
End Class
