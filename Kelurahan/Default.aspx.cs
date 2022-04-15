using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.ComponentModel;
using DevExpress.Web.ASPxClasses.Internal;
using DevExpress.Web.ASPxCallbackPanel;

    public partial class _Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
			// Allows using portrait and landscape css files depending on the browser window width on a desktop
			if(!RenderUtils.Browser.Platform.IsTouchUI) {
				PortraitStyleLink.Attributes["media"] = "all and (max-width: 800px)";
				LandscapeStyleLink.Attributes["media"] = "all and (min-width: 800px)";
			}
	    }
    }