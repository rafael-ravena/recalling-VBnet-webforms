<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid text-primary-emphasis bg-primary bg-gradient" style="--bs-bg-opacity: .6">
        <section class="row" aria-labelledby="exercisesTitle">
            <div class="col">
                <h1 id="exercisesTitle">Programming Exercises</h1>
                <p class="lead">
                    From here we can explore the excercises done in the 
                    <span class="fw-bold"><i class="fa-brands fa-microsoft"></i> VB.Net</span> 
                    with <span class="fw-bold"><i class="fa-solid fa-globe"></i>Asp.Net Web Forms</span> 
                    and <span class="fw-bold"><i class="fa-notdog fa-solid fa-wifi fa-rotate-by" style="--fa-rotate-angle: 225deg;"></i>JQuery</span> Take Away assessment.</p>
            </div>
        </section>
    </div>
    <p>&nbsp;</p>
    <div class="container-fluid">
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <section class="col-md-4" aria-labelledby="spiralExerciseTitle">
                <div class="card h-100 image-to-bg">
                    <img src="Content/Images/number-text-cover.jpeg" class="card-img-top" alt="image of some numbers on a paper with the text form from them right next to it, reading '1435 plus 978 equals one thousand four hundred thirteen'" />
                    <div class="card-body">
                        <h3 id="literalsExerciseTitle">Literals Exercise</h3>
                        <hr />
                        <p>This exercise focuses on converting numeric amounts into their literal string representations.</p>
                        <p>Example: Convert `2523.04` to `"Two thousand five hundred twenty-three and 04/100 dollars"`.</p>
                        <p>It executes through a backend component, writen in VB.Net, which encapsulates the functionality.</p>
                        <hr />
                        <p class="fw-lighter fst-italic">VB.Net, Clean Code, SOLID, Componentization, Recursion, External resources, Bootstrap, CSS</p>
                    </div>
                    <div class="card-footer"><a class="btn btn-outline-primary float-end" href="Pages/Literals.aspx">Go to Literals Exercise &raquo;</a></div>
                </div>
            </section>
            <section class="col-md-4" aria-labelledby="spiralExerciseTitle">
                <div class="card h-100 image-to-bg">
                    <img src="Content/Images/spiral-cover.jpeg" class="card-img-top" alt="image of some numbers on a paper with the text form from them right next to it, reading '1435 plus 978 equals one thousand four hundred thirteen'" />
                    <div class="card-body">
                        <h3 id="spiralExerciseTitle">Spiral Matrix Exercise</h3>
                        <hr />
                        <p>This exercise involves generating a spiral matrix for a given number and displaying it dynamically.</p>
                        <p>Example: Generate a spiral matrix for the number `24`.</p>
                        <p>It executes through a backend component, writen in VB.Net, which encapsulates the functionality.</p>
                        <p>It also has some front-end manipulation through JQuery, just to demonstrate ability with JQuery and JavaScript.</p>
                        <hr />
                        <p class="fw-lighter fst-italic">VB.Net, Clean Code, SOLID, Componentization, Recursion, Code optimization, Code readability, Bootstrap, CSS</p>
                    </div>
                    <div class="card-footer"><a class="btn btn-outline-primary float-end" href="Pages/Spiral.aspx">Go to Spiral Exercise &raquo;</a></div>
                </div>
            </section>
            <section class="col-md-4" aria-labelledby="palindromeExerciseTitle">
                <div class="card h-100 image-to-bg">
                    <img src="Content/Images/palindrome-cover.jpeg" class="card-img-top" alt="image of some numbers on a paper with the text form from them right next to it, reading '1435 plus 978 equals one thousand four hundred thirteen'" />
                    <div class="card-body">
                        <h3 id="spiralExerciseTitle">Palindrome Checker Exercise</h3>
                        <hr />
                        <p>This exercise allows you to check if a given string is a palindrome, with options to ignore non-numeric characters.</p>
                        <p>Example: Check if `madam` or `12321` is a palindrome.</p>
                        <p>This one is pure JQuery (and JavaScript logic) purely to demonstrate the handle uppon the language itself.</p>
                        <hr />
                        <p class="fw-lighter fst-italic">JQuery, Recursion, Code optimization, Code readability, Bootstrap, CSS</p>
                    </div>
                    <div class="card-footer"><a class="btn btn-outline-primary float-end" href="Pages/Palindrome.aspx">Go to Palindrome Exercise &raquo;</a></div>
                </div>
            </section>
        </div>
        </div>

</asp:Content>
