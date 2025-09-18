<%@ Page Title="VB.Net Web Forms JQuery exercises: Palindrome" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Palindrome.aspx.vb" Inherits="WebApp.Palindrome" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="CardHeader" runat="server">
    <h1>Literal exercise</h1>
</asp:Content>
<asp:Content ID="ImageContent" ContentPlaceHolderID="CardImage" runat="server">
    <img src="../Content/Images/taco-cat.jpeg" data-behavior="rotate-images" data-sentence="Taco cat"/>
    <img src="../Content/Images/bus.jpeg" data-behavior="rotate-images" data-sentence="Socorram-me! subi no ônibus em Marrocos!" />
    <img src="../Content/Images/number.jpeg" data-behavior="rotate-images" data-sentence="159878951"/>
    <img src="../Content/Images/nut-tuna-can.jpeg" data-behavior="rotate-images" data-sentence="A nut for a jar of tuna" />
    <img src="../Content/Images/cat-car.jpeg" data-behavior="rotate-images" data-sentence="Was it a car or a cat I saw?"/>
    <img src="../Content/Images/amore-roma.jpeg" data-behavior="rotate-images" data-sentence="Amore! Roma!"/>
    <i data-behavior="set-interval" data-arg="5"></i>
</asp:Content>
<asp:Content ID="CardBodyContent" ContentPlaceHolderID="CardBody" runat="server">
    <h3>The exercise</h3>
    <p>Please implement a function that checks whether a positive number is a palindrome or not.</p>
    <p>For instance, 121 is a palindrome, but 123 is not..</p>
    <p class="fw-bold">Disclaimer:</p>
    <p>Having to check only for palindrome numbers is too easy, so I'm also enabling the possibility to check for palindrome strings.</p>
    <p>You can add or remove the check for spaces and any other non alpha-numeric characters to see the difference.</p>
</asp:Content>
    
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblInput" runat="server" CssClass="h4 text-success" Text="What's the subject to verification?"></asp:Label>
    <div class="row">
        <div class="col-6">
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" name="switchNumeric" id="switchNumeric" checked="checked"
                    data-behavior="switch-non-numeric" data-target="#text-options" />
                <label class="form-check-label" for="switchNumeric">Only numbers</label>
            </div>
            <div class="form-check form-switch d-none" id="text-options">
                <input class="form-check-input" type="checkbox" role="switch" name="switchRemoveChars" id="switchRemoveChars"
                    data-behavior="switch-non-alpha" />
                <label class="form-check-label" for="switchCheckDefault">Remove white-space and non alpha-numeric characters</label>
            </div>
        </div>
        <div class="col-6">
            <div class="input-group">
                <input id="TxtSubject" class="form-control" placeholder="Enter subject" type="text" data-behavior="palindrome-input" />
                <button id="BtnConvert" class="btn btn-outline-secondary" data-behavior="check-palindrome" type="button">Convert</button>
            </div>
        </div>
    </div>
    <hr />
    <p íd="LblResult" class="text-info" data-behavior="display-result"></p>
        <asp:Panel ID="PnlError" runat="server" CssClass="row" Visible="false">
            <div class="col">
                <h3><i class="fa-solid fa-face-frown-open"></i>Something went wrong! Hope we didn't lose all your money.</h3>
                <p><asp:Label ID="LblErrorTrace" runat="server"></asp:Label></p>
            </div>
        </asp:Panel>
</asp:Content>
