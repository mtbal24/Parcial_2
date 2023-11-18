using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Parcial_2
{
    public partial class Registracion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("password", Password.Text);
            cookie.Expires = DateTime.Now.AddSeconds(10);
            Response.Cookies.Add(cookie);
            this.Session["username"] = Username.Text;
            Response.Redirect("GestionArchivos.aspx");
        }
    }
}