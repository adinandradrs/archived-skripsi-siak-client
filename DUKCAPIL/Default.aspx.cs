using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DUKCAPIL
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            string username = usernameTextBox.Text;
            string sandi = sandiTextBox.Text;
            asus_a43sj.SIAKServiceService ws = new asus_a43sj.SIAKServiceService();
            object check = ws.authKota(username, sandi);
            if (check != null)
            {
                Pengguna p = new Pengguna();
                p.namaKota = ws.authKota(username, sandi).namaKota;
                p.kotaID = ws.authKota(username, sandi).kotaID;
                p.username = ws.authKota(username, sandi).username;
                Session["kotaID"] = p.kotaID;
                Session["namaKota"] = p.namaKota;
                Response.Redirect("Main.aspx");
            }
        }
    }
}