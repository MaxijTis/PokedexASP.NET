<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="pokemonsLista.aspx.cs" Inherits="pokedexWeb.pokemonsLista" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Lista de Pokemons</h1>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <asp:Label Text="Filtrar" runat="server" />
                <asp:TextBox runat="server" ID="txtFiltro" autopostback=true CssClass="form-control" OnTextChanged="Filtro_TextChanged" />
            </div>
        </div>
    </div>
        <div class="col-6" style=" display: flex; flex-direccion: column; justify-content: flex-end;"  >
            <div class="mb-3">
                <asp:CheckBox Text="Filtro Avanzado" id="chkFiltroavanzado" runat="server" AutoPostBack="true" OnCheckedChanged="chkFiltroavanzado_CheckedChanged" />
            </div>
        </div>

    <%if (Filtroavanzado)
      { %>
    <div class="row">
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Campo" ID="dllCampo" runat="server" />
                <asp:DropDownList runat="server" CssClass="form-control">
                    <asp:ListItem Text="Nombre" />
                    <asp:ListItem Text="Tipo" />
                    <asp:ListItem Text="Número" />
                </asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Criterio" runat="server" />
                <asp:DropDownList runat="server" id="ddlCriterio" CssClass="form-control" ></asp:DropDownList>
            </div>
        </div>
        <div class="col-3">
            <div class="mb-3">
                <asp:Label Text="Filtro" runat="server" />
                <asp:TextBox ID="txtFiltroAvanzado" cssclass="Form-control" runat="server">
                </asp:TextBox>
            </div>
        </div>
    </div>
    <%} %>
    <asp:GridView ID="dgvPokemons" runat="server" DataKeyNames="Id" 
        AutoGenerateColumns="false" CssClass="table" 
        OnSelectedIndexChanged="dgvPokemons_SelectedIndexChanged" 
        OnPageIndexChanging="dgvPokemons_PageIndexChanging"
        AllowPaging="true" PageSize="5">
        <Columns>
            <asp:BoundField HeaderText="Nombre" DataField="Nombre" />
            <asp:BoundField HeaderText="Numero" DataField="Numero" />
            <asp:Boundfield HeaderText="Tipo" DataField="Tipo.Descripcion" /> 
            <asp:CheckBoxField HeaderText="Activo" DataField="Activo" />
            <asp:CommandField HeaderText="Accion" ShowSelectButton="true" SelectText="✅" />        
        </Columns>
    </asp:GridView>
    <a href="FormularioPokemon.aspx" class="btn btn-primary">Agregar</a>
</asp:Content>
