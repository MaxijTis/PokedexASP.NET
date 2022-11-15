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
    public partial class Miperfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                //Escrbir img
                TraineeNegocio negocio = new TraineeNegocio();  
                string ruta = Server.MapPath("./Images/");
                Trainee user = (Trainee)Session["trainee"];
                txtImagen.PostedFile.SaveAs(ruta + "perfil-" + user.Id + ".jpg");

                user.ImagenPerfil = "perfil-" + user.Id + ".jpg";
                negocio.actualizar(user);

                //Leer img
                Image img = (Image)Master.FindControl("imgAvatar");
                img.ImageUrl ="~/images/" + user.ImagenPerfil;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }
    }
}