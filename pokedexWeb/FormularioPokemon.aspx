<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="FormularioPokemon.aspx.cs" Inherits="pokedexWeb.FormularioPokemon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    
        <div class="row">
            <div class="col-6">
                <div class="mb-3">
                    <label for="txtId" class="form-label">Id</label>
                    <asp:TextBox ID="txtId" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtNombre" class="form-label">Nombre:  </label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtNumero" class="form-label">Numero:  </label>
                    <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="ddlTipo" class="form-label">Tipo:  </label>
                    <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="ddlDebilidad" class="form-label">Debilidad:  </label>
                    <asp:DropDownList ID="ddlDebilidad" runat="server" CssClass="form-control" />
                </div>
                    <div class="mb-3">
                        <asp:Button Text="Aceptar" ID="btnAceptar" CssClass="btn btn-primary" OnClick="btnAceptar_Click" runat="server" />
                        <a href="pokemonsLista.aspx">Cancelar</a>
                    </div>
                </div>
                <div class="col-6">
                    <div class="mb-3">
                        <label for="txtDescripcion" class="form-label">Descripcion:  </label>
                        <asp:TextBox ID="txtDescripcion" TextMode="MultiLine" runat="server" CssClass="form-control" />
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div class="form-group">
                                <div class="mb-3">
                                    <label for="txtImagenUrl" class="form-label">Url Imagen</label>
                                    <asp:TextBox runat="server" ID="txtImagenUrl" CssClass="form-control"
                                    AutoPostBack="true" OnTextChanged="txtImagenUrl_TextChanged" />
                                </div>
                            </div>
                            <asp:Image ImageUrl="http://grupoact.com.ar/wp-content/uploads/2020/04/placeholder.png" runat="server" ID="imgPokemons" Width="60%" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
</asp:Content>
