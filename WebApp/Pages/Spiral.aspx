<%@ Page Title="VB.Net Web Forms JQuery exercises: Spiral" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Spiral.aspx.vb" Inherits="WebApp.Spiral" %>
<asp:Content ID="HeaderContent" ContentPlaceHolderID="CardHeader" runat="server">
        <h1>Spiral exercise</h1>
        <hr />
</asp:Content>
<asp:Content ID="ImageContent" ContentPlaceHolderID="CardImage" runat="server">
    <img src="../Content/Images/spiral.jpg" />
</asp:Content>
<asp:Content ID="CardBodyContent" ContentPlaceHolderID="CardBody" runat="server">
    <h3>The exercise</h3>
    <p>Write some code that accepts an integer and prints the integers from 0 to that input integer in a spiral format.</p>
    <p>For example, if I supplied 24 the output would be:</p>
    <table class="table table-dark table-bordered">
        <tr>
            <td>20</td><td>21</td><td>22</td><td>23</td><td>24</td>
        </tr>
        <tr>
            <td>19</td><td>6</td><td>7</td><td>8</td><td>9</td>
        </tr>
        <tr>
            <td>18</td><td>5</td><td>0</td><td>1</td><td>10</td>
        </tr>
        <tr>
            <td>17</td><td>4</td><td>3</td><td>2</td><td>11</td>
        </tr>
        <tr>
            <td>16</td><td>15</td><td>14</td><td>13</td><td>12</td>
        </tr>
    </table>
    <p></p>
</asp:Content>
    
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="LblSize" runat="server" CssClass="h4 text-success" Text="What's the spiral size?"></asp:Label>
    <div class="input-group">
        <asp:TextBox ID="TxtSize" runat="server" CssClass="form-control" placeholder="Enter Amount"></asp:TextBox>
        <asp:DropDownList ID="SelDirection" runat="server" CssClass="form-select" aria-label="Select direction"></asp:DropDownList>
        <asp:Button ID="BtnGenerate" runat="server" CssClass="btn btn-outline-secondary" Text="Generate spiral" OnClick="Generate" />
    </div>
    <hr />
    <asp:Literal ID="LblResult" runat="server" Text=""></asp:Literal>
</asp:Content>
