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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Trainee trainee = new Trainee();
            TraineeNegocio negocio = new TraineeNegocio();
            try
            {
                trainee.Email = txtEmail.Text;
                trainee.Pass = txtPass.Text;
                if (negocio.Login(trainee)) 
                {
                    Session.Add("trainee", trainee);
                    
                    Response.Redirect("Miperfil.aspx", false);


                }
                else 
                {
                    Session.Add("error", "User or Pass incorrectos");
                    Response.Redirect("Error.aspx");
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                Response.Redirect("Error.aspx");

            }
        }
    }
}