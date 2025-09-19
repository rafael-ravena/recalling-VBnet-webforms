# Programming Exercises WebApp
This repository contains a collection of programming exercises implemented in **VB.NET** using **ASP.NET Web Forms** and **Jquery**. The chosen exercises are 1, 3 and 6.

## Table of Contents
- [Overview](#overview)
- [Technologies Used](#technologies-used)
- [How to Start and Run the Project](#how-to-start-and-run-the-project)
- [Literals Exercise](#literals-exercise)
- [Spiral Matrix Exercise](#spiral-matrix-exercise)
- [Palindrome Checker](#palindrome-checker)

---

## Overview
The project is structured as an ASP.NET Web Forms application. Each exercise is implemented as a separate page in the `~/WebApp/Pages` directory.<br/>
The exercises focus on solving specific programming challenges.

---

## Technologies Used

- **Backend**: ASP.NET Web Forms, VB.NET
- **Frontend**: Bootstrap, jQuery, HTML5, CSS3
- **Tools**: Visual Studio

---

## How to Start and Run the Project

### Prerequisites

1. **Visual Studio**: Install [Visual Studio](https://visualstudio.microsoft.com/) (Community, Professional, or Enterprise edition).
2. **.NET Framework**: Ensure you have .NET Framework 4.8 properly installed.
3. **Browser**: Use any modern browser (e.g., Chrome, Edge, Firefox).

---

### Steps to Run the Project
1. **Clone the Repository**:
```bash
git clone https://github.com/rafael-ravena/recalling-VBnet-webforms
cd recalling-VBnet-webforms
```
2. **Open the Solution**:
    - Open WebApp.sln in Visual Studio.
3. **Restore NuGet Packages**:
    - In Visual Studio, go to Tools > NuGet Package Manager > Manage NuGet Packages for Solution.
    - Restore any missing packages.
4. **Build the Solution**:
    - Press Ctrl+Shift+B or go to Build > Build Solution.
5. **Run the Project**:
    - Press F5 or click the **Start Debugging** button in Visual Studio to debug the application.
    - Press ctrl+F5 or click the **Start Without Debugging** button in Visual Studio to start the application detached from the debugger process.
    - The application will open in your default browser.
6. **Navigate to the Exercises**:
    - Literals Exercise: http://localhost:xxxx/Pages/Literals.aspx
    - Spiral Matrix Exercise: http://localhost:xxxx/Pages/Spiral.aspx
    - Palindrome Checker: http://localhost:xxxx/Pages/Palindrome.aspx

---


## Literals Exercise

- **Description**: Converts numeric amounts into their literal string representations.
- **Example**: Convert `2523.04` to `"Two thousand five hundred twenty-three and 04/100 dollars"`.
- **Logic**:
  - The backend uses recursion to break down the number into its multiples of thousands (thousands, millions, billions, etc.).
  - Each 'thousand-part' block behaves the same way semantically.
  - External resources are used to map numbers to their literal equivalents
    - Creates an oportunity to implement for different languages. 
    - Unless it's Latin, French or Danish... then we'd be doomed.
- **Page**: [`~/WebApp/Pages/Literals.aspx`](./WebApp/Pages/Literals.aspx)

---

## Spiral Matrix Exercise

- **Description**: Generates a spiral matrix for a given number and displays it dynamically.
- **Example**: Generating a spiral matrix for the number `24`: 

| &nbsp; | &nbsp; | &nbsp; | &nbsp; | &nbsp; |
|----|----|----|----|----|
| 20 | 21 | 22 | 23 | 24 |
| 19 | 6  | 7  | 8  | 9  |
| 18 | 5  | 0  | 1  | 10 |
| 17 | 4  | 3  | 2  | 11 |
| 16 | 15 | 14 | 13 | 12 |

- **Logic**:
    - The algorithm stores number values in a matrix of square-root the maximum value to be displayed plus one.
    - The matrix is stored in a hash map with a string having *"y index, x index"* as key
        - The hash key accomodates both line and column indexes
        - The string hash key approach enables *"matrix negative indexes"*
        - The position of 0 (zero) set as the origin point (line 0, column 0)
        - The matrix goes horizontaly from **-x** to **x** and **-y** to **y**, displaying numbers from **zero** to **n**
            > x=y; <br/>
            > x² = n+1
    - The backend uses a recursive algorithm to calculate the matrix position values.
    - The matrix is sorted by its keys (row, then column) for proper rendering.
    - Just to show off, user can specify the spiral initial direction (e.g., Up, Right, Down, Left).
    - **Page**: [`~/WebApp/Pages/Spiral.aspx`](./WebApp/Pages/Spiral.aspx)

---

## Palindrome Checker

- **Description**: 
    > Checks if a given input *(subject)* is a palindrome, with options to ignore non-numeric characters. <br/>
    > A palindrome is a sequence of numbers, letters, or even a full sentence that, once read bakwards, equals to the original.<br/>
    > It comes from the greek word *"palindromos"* (*"palin"*: back or again; *"dromos"*: route or road)
- **Examples**:
    - Input: `socorram-me! subi no ônibus em Marrocos` - `a famous portuguese palindrome`
        > → Output: `True` if "remove white space and non aphanumeric characters"<br/>
        > → Output: `false` if not "remove white space and non aphanumeric characters"
    - Input: `12321` → Output: `True`
    - Input: `hello` → Output: `False`
    - Input: `palindrome` → Output: `False`
- **Logic**:
    - The backend processes the string and compares characters from both ends.
    - The user can toggle whether to ignore non-numeric characters.
    - Front-end validation is implemented using exclusively jQuery.
- **Page**: [`~/WebApp/Pages/Palindrome.aspx`](./WebApp/Pages/Palindrome.aspx)


