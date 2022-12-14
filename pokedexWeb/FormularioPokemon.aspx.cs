using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace pokedexWeb
{
    public partial class FormularioPokemon : System.Web.UI.Page
    {
        public bool ConfirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;
            ConfirmaEliminacion = false;

            //configuracion inicial
            try
            {
                if (!IsPostBack)
                {
                    ElementoNegocio negocio = new ElementoNegocio();
                    List<Elemento> lista = negocio.listar();

                    ddlTipo.DataSource = lista;
                    ddlTipo.DataValueField = "Id";
                    ddlTipo.DataTextField = "Descripcion";
                    ddlTipo.DataBind();

                    ddlDebilidad.DataValueField = "Id";
                    ddlDebilidad.DataSource = lista;
                    ddlDebilidad.DataTextField = "Descripcion";
                    ddlDebilidad.DataBind();
                }

                //configuracion si estamos modificando

                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    PokemonNegocio negocio = new PokemonNegocio();
                    //List<Pokemon> lista = negocio.listar(id);
                    //Pokemon seleccionado = lista[0];
                    Pokemon seleccionado = (negocio.listar(id))[0];

                    //guardo pokemon seleccionado en session
                    Session.Add("pokeseleccionado", seleccionado);

                    //precargar todos los campos
                    txtId.Text = id;
                    txtNombre.Text = seleccionado.Nombre;
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtImagenUrl.Text = seleccionado.UrlImagen;
                    txtNumero.Text = (seleccionado.Numero).ToString();

                    ddlTipo.SelectedValue = seleccionado.Tipo.Id.ToString();
                    ddlDebilidad.SelectedValue = seleccionado.Debilidad.Id.ToString();
                    txtImagenUrl_TextChanged(sender, e);

                    //configurar Acciones
                    if (!seleccionado.Activo)
                    {
                        btnInactivar.Text = "Reactivar";
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
                //redireccion a pantalla de error
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Pokemon nuevo = new Pokemon();
                PokemonNegocio negocio = new PokemonNegocio();

                nuevo.Numero = int.Parse(txtNumero.Text);
                nuevo.Nombre = txtNombre.Text;
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.UrlImagen = txtImagenUrl.Text;

                nuevo.Tipo = new Elemento();
                nuevo.Tipo.Id = int.Parse(ddlTipo.SelectedValue);
                nuevo.Debilidad = new Elemento();
                nuevo.Debilidad.Id = int.Parse(ddlDebilidad.SelectedValue);

                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(txtId.Text);
                    negocio.modificarConSP(nuevo);
                }
                else 
                {
                    negocio.agregarConSP(nuevo);
                }
                Response.Redirect("pokemonsLista.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex);
            }

        }

        protected void txtImagenUrl_TextChanged(object sender, EventArgs e)
        {
            imgPokemons.ImageUrl = txtImagenUrl.Text;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true;
        }

        protected void btnConfirmaEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkConfirmaEliminacion.Checked) 
                { 
                PokemonNegocio negocio = new PokemonNegocio();
                negocio.eliminar(int.Parse(txtId.Text));
                Response.Redirect("pokemonsLista.aspx");
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }

        protected void btnInactivar_Click(object sender, EventArgs e)
        {
            try
            {
                PokemonNegocio negocio = new PokemonNegocio();
                Pokemon seleccionado = (Pokemon)Session["pokeseleccionado"];
                negocio.eliminarLogico(seleccionado.Id, !seleccionado.Activo);
                Response.Redirect("pokemonsLista.aspx");
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
            }
        }
    }
}