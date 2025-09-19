<%@ Page Title="VB.Net Web Forms JQuery exercises: Number literal" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Literals.aspx.vb" Inherits="WebApp.Literals" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="CardHeader" runat="server">
    <h1>Literal exercise</h1>
    <hr />
</asp:Content>
<asp:Content ID="ImageContent" ContentPlaceHolderID="CardImage" runat="server"><img src="../Content/Images/pg-bnk.jpg" /></asp:Content>
<asp:Content ID="CardBodyContent" ContentPlaceHolderID="CardBody" runat="server">
    <h3>The exercise</h3>
    <p>Write some code that will accept an amount and convert it to the appropriate string representation.</p>
    <p>Example:</p>
    <p>Convert 2523.04 to "Two thousand five hundred twenty-three and 04/100 dollars"</p>
    <p></p>
</asp:Content>
    
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblAmount" runat="server" CssClass="h4 text-success" Text="How much money?"></asp:Label>
    <div class="input-group">
        <asp:TextBox ID="TxtAmount" runat="server" CssClass="form-control" placeholder="Enter Amount"></asp:TextBox>
        <asp:Button ID="BtnConvert" runat="server" CssClass="btn btn-outline-secondary" Text="Convert" OnClick="ConvertAmount" />
    </div>
    <hr />
    <p class="text-primary fs-2">
        <asp:TextBox ID="LblResult" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="7" Enabled="false"></asp:TextBox>
    </p>
    <asp:Panel ID="PnlError" runat="server" CssClass="row" Visible="false">
        <div class="col">
            <h3><i class="fa-solid fa-face-frown-open"></i>Something went wrong! Hope we didn't lose all your money.</h3>
            <p><asp:Label ID="LblErrorTrace" runat="server"></asp:Label></p>
        </div>
    </asp:Panel>
</asp:Content>
