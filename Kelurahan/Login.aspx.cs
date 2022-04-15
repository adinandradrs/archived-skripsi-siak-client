using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

public partial class Login : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void LoginButton_Click(object sender, EventArgs e)
    {
        asus_a43sj.SIAKServiceService ws = new asus_a43sj.SIAKServiceService();
        string username = UserNameTextBox.Text;
        string sandi = SandiTextBox.Text;
        IPHostEntry ipEntry = Dns.GetHostByName("localhost");
        IPAddress[] addr = ipEntry.AddressList;
        try
        {
            int kelurahanID = ws.authKelurahan(username, sandi, DateTime.Now.ToString("yyyy-MM-dd"), addr[0].ToString()).kelurahanID;
            Session["kelurahanID"] = kelurahanID;
            Response.Redirect("Default.aspx");
        }
        catch (Exception)
        {
            
        }
    }
}