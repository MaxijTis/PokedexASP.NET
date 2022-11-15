using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class EmailService
    {
            private MailMessage email;
            private SmtpClient server;
        
            public EmailService()
            {
                server = new SmtpClient();
                server.Credentials = new NetworkCredential("d49c7f5d3d3d8a", "9811ff10939850");
                server.EnableSsl = true;
                server.Port = 2525;
                server.Host = "smtp.mailtrap.io";
;
        }

            public void armarCorreo(string emailDestino, string asunto, string cuerpo)
            {
                email = new MailMessage();
                email.From = new MailAddress("noresponder@pokedexweb.com");
                email.To.Add(emailDestino);
                email.Subject = asunto;
                email.IsBodyHtml = true;
                //email.Body = "<h1>Reporte de materias a las que se ha inscripto</h1> <br>Hola, te inscribiste.... bla bla";
                email.Body = cuerpo;

            }

            public void enviarEmail()
            {
                try
                {
                    server.Send(email);
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

        
    }
}
