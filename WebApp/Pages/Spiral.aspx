<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Spiral.aspx.vb" Inherits="WebApp.Spiral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">

        <h1>Spiral exercise</h1>
        <hr />
        <div class="row">
            <div class="col-3">
                <div class="card">
                    <div class="card-body">
                        <div class="card-image">
                            <img src="../Content/Images/spiral.jpg" />
                        </div>
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
                    </div>
                </div>
            </div>
            <div class="col">
                <asp:Label ID="LblSize" runat="server" CssClass="h4 text-success" Text="What's the spiral size?"></asp:Label>
                <div class="input-group">
                    <asp:TextBox ID="TxtSize" runat="server" CssClass="form-control" placeholder="Enter Amount"></asp:TextBox>
                    <select class="form-select" aria-label="Select direction" data-behavior="display-alert" data-message="modal-message" data-title="All paths leads to Rome... I mean, up!">
                        <option value="1" selected>Up</option>
                        <option value="UP">Up</option>
                        <option value="dir-up">Up</option>
                        <option value="direction-up">Up</option>
                    </select>
                    <asp:Button ID="BtnGenerate" runat="server" CssClass="btn btn-outline-secondary" Text="Generate spiral" OnClick="Generate" />
                </div>
                <hr />
                <asp:Literal ID="LblResult" runat="server" Text=""></asp:Literal>
            </div>
        </div>
        <asp:Panel ID="PnlError" runat="server" CssClass="row" Visible="false">
            <div class="col">
                <h3><i class="fa-solid fa-face-frown-open"></i>Something went wrong! Hope we didn't lose all your money.</h3>
                <p><asp:Label ID="LblErrorTrace" runat="server"></asp:Label></p>
            </div>
        </asp:Panel>
    </div>
    <div id="modal-message" class="visually-hidden">
        <p>Yeap! We can only start moving up.</p>
        <p>I've heard the engineer burnt several hours on this issue until PO refused to approve extra budget.</p>
        <p>The whole team kept telling him to move on, but he kept saying:</p>
        <p><span class="fw-bold text-danger">I ain't moving on... I'm moving up!</span></p>
        <p>So, yeah... up it is.</p>
    </div>
</asp:Content>
