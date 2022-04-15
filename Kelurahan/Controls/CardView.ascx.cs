using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

    public partial class CardView : System.Web.UI.UserControl {
        protected void Page_Load(object sender, EventArgs e) {
			ASPxRoundPanel1.HeaderStyle.Paddings.PaddingTop = 3;
	        ASPxRoundPanel1.HeaderStyle.Paddings.PaddingBottom = 6;
	        ASPxRoundPanel1.ContentPaddings.Padding = 0;
			ASPxRoundPanel1.ContentPaddings.PaddingBottom = 6;
            ASPxRoundPanel2.HeaderStyle.Paddings.PaddingTop = 3;
            ASPxRoundPanel2.HeaderStyle.Paddings.PaddingBottom = 6;
            ASPxRoundPanel2.ContentPaddings.Padding = 0;
            ASPxRoundPanel2.ContentPaddings.PaddingBottom = 6;

            asus_a43sj.SIAKServiceService ws = new asus_a43sj.SIAKServiceService();
            
            int kelurahanID = int.Parse(Session["kelurahanID"].ToString());
            
            this.gvCardHomes.DataSource = ws.infoKTPKelurahan(kelurahanID);
            this.gvCardHomes.DataBind();

            this.cardGVHomesSpecial.DataSource = ws.infoBiodataKelurahan(kelurahanID);
            this.cardGVHomesSpecial.DataBind();
        }
    }