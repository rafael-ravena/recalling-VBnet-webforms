<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Palindrome.aspx.vb" Inherits="WebApp.Palindrome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <h1>Literal exercise</h1>
        <hr />
        <div class="row">
            <div class="col-3">
                <div class="card">
                    <div class="card-image">
                        <img src="../Content/Images/taco-cat.jpeg" data-behavior="rotate-images" />
                        <img src="../Content/Images/bus.jpeg" data-behavior="rotate-images" />
                    </div>
                    <div class="card-body">
                        <h3>The exercise</h3>
                        <p>Please implement a function that checks whether a positive number is a palindrome or not.</p>
                        <p>For instance, 121 is a palindrome, but 123 is not..</p>
                        <p class="fw-bold">Disclaimer:</p>
                        <p>Having to check only for palindrome numbers is too easy, so I'm also enabling the possibility to check for palindrome strings.</p>
                        <p>You can add or remove the check for spaces and any other non alpha-numeric characters to see the difference.</p>
                    </div>
                </div>
            </div>
            <div class="col-9">
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
                    <input id="TxtAmount" class="form-control" placeholder="Enter subject" type="text" data-behavior="palindrome-input" />
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
            </div>
        </div>
    </div>
</asp:Content>
