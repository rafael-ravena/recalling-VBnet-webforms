<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Literals.aspx.vb" Inherits="WebApp.Literals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <h1>Literal exercise</h1>
        <hr />
        <div class="row">
            <div class="col-3">
                <div class="card">
                    <div class="card-image">
                        <img src="../Content/Images/pg-bnk.jpg" />
                    </div>
                    <div class="card-body">
                        <h3>The exercise</h3>
                        <p>Write some code that will accept an amount and convert it to the appropriate string representation.</p>
                        <p>Example:</p>
                        <p>Convert 2523.04 to "Two thousand five hundred twenty-three and 04/100 dollars"</p>
                        <p></p>
                    </div>
                </div>
            </div>
            <div class="col-9">
                <asp:Label ID="LblAmount" runat="server" CssClass="h4 text-success" Text="How much money?"></asp:Label>
                <div class="input-group">
                    <asp:TextBox ID="TxtAmount" runat="server" CssClass="form-control" placeholder="Enter Amount"></asp:TextBox>
                    <asp:Button ID="BtnConvert" runat="server" CssClass="btn btn-outline-secondary" Text="Convert" OnClick="ConvertAmount" />
                </div>
                <hr />
                <asp:Label ID="LblResult" runat="server" CssClass="text-info" Text=""></asp:Label>
            </div>
        </div>
        <asp:Panel ID="PnlError" runat="server" CssClass="row" Visible="false">
            <div class="col">
                <h3><i class="fa-solid fa-face-frown-open"></i>Something went wrong! Hope we didn't lose all your money.</h3>
                <p><asp:Label ID="LblErrorTrace" runat="server"></asp:Label></p>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
