﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="pokedexWeb.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Hola!!</h1>
    <p>Legaste  al Pokedex web, tu lugar Pokemon...</p>

    <div class="row row-cols-1 row-cols-md-3 g-4">

            <%--<% foreach (Dominio.Pokemon poke in ListaPokemon)
               {
            %>
                <div class="col">
                    <div class="card">
                        <img src="<%: poke.UrlImagen%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%: poke.Nombre%></h5>
                            <p class="card-text"><%: poke.Descripcion %></p>
                            <a href="DetallePokemon.aspx?id=<%: poke.Id%>">Ver Detalle</a> 
                        </div>
                    </div>
                </div>
            <% } %>--%>

        <asp:Repeater ID="repRepetidor" runat="server">
            <ItemTemplate>
                <div class="col">
                    <div class="card">
                        <img src="<%#Eval("UrlImagen")%>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%#Eval ("Nombre")%></h5>
                            <p class="card-text"><%#Eval("Descripcion")%></p>
                            <a href="DetallePokemon.aspx?id=<%#Eval("Id")%>">Ver Detalle</a> 
                            <asp:Button Text="Ejemplo" CssClass="btn btn-primary" runat="server" Id="btnEjemplo" CommandArgument='<%#Eval("Id") %>' CommandName="PokemonId" OnClick="btnEjemplo_Click" />
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
</asp:Content>
