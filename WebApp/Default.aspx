<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row" aria-labelledby="exercisesTitle">
            <h1 id="exercisesTitle">Programming Exercises</h1>
            <p class="lead">Explore the exercises in the `/Pages` folder.</p>
        </section>

        <div class="row">
            <section class="col-md-4" aria-labelledby="literalsExerciseTitle">
                <h2 id="literalsExerciseTitle">Literals Exercise</h2>
                <p>
                    This exercise focuses on converting numeric amounts into their literal string representations.
                </p>
                <p>
                    Example: Convert `2523.04` to `"Two thousand five hundred twenty-three and 04/100 dollars"`.
                </p>
                <p>It executes through a backend component, writen in VB.Net, which encapsulates the functionality.</p>
                <p>
                    <a class="btn btn-primary" href="Pages/Literals.aspx">Go to Literals Exercise &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="spiralExerciseTitle">
                <h2 id="spiralExerciseTitle">Spiral Matrix Exercise</h2>
                <p>
                    This exercise involves generating a spiral matrix for a given number and displaying it dynamically.
                </p>
                <p>
                    Example: Generate a spiral matrix for the number `24`.
                </p>
                <p>It executes through a backend component, writen in VB.Net, which encapsulates the functionality.</p>
                <p>It also has some front-end manipulation through JQuery, just to demonstrate ability with JQuery and JavaScript.</p>
                <p>
                    <a class="btn btn-primary" href="Pages/Spiral.aspx">Go to Spiral Exercise &raquo;</a>
                </p>
            </section>
            <section class="col-md-4" aria-labelledby="palindromeExerciseTitle">
                <h2 id="palindromeExerciseTitle">Palindrome Checker</h2>
                <p>
                    This exercise allows you to check if a given string is a palindrome, with options to ignore non-numeric characters.
                </p>
                <p>
                    Example: Check if `madam` or `12321` is a palindrome.
                </p>
                <p>This one is pure JQuery (and JavaScript logic) purely to demonstrate the handle uppon the language itself.</p>
                <p>
                    <a class="btn btn-primary" href="Pages/Palindrome.aspx">Go to Palindrome Exercise &raquo;</a>
                </p>
            </section>
        </div>
    </main>

</asp:Content>
