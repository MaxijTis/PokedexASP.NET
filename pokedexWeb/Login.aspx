<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="pokedexWeb.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="row">
        <div class="col-4">
            <h2>Login</h2>
            <div class="mb-3">
                <asp:Label ID="Email" runat="server" Text="Email"></asp:Label>
                <asp:TextBox Id=txtEmail CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Label ID="Pass" runat="server" Text="Password"></asp:Label>
                <asp:TextBox Id=txtPass CssClass="form-control" TextMode="Password" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Button Id=btnLogin Text="Ingresar" Onclick="btnLogin_Click" CssClass="btn btn-primary" runat="server" />
                <a href="/">Cancelar</a>
            </div>
        </div>
    </div>
</asp:Content>
