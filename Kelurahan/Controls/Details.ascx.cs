using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using DevExpress.Web.ASPxCallbackPanel;
using System.ComponentModel;

    public partial class Details : System.Web.UI.UserControl {
	    protected void Page_Load(object sender, EventArgs e) {
	    }

	    protected void cpDetails_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e) {
	        LoadByID(e.Parameter);
	    }
	    public void LoadByID(string ID){
	        XmlDataSource ds = Page.FindControl("XmlHomes") as XmlDataSource;
	        if(ds != null) {
	            XmlDataSource localDS = new XmlDataSource();
	            localDS.DataFile = ds.DataFile;
	            localDS.XPath = string.Format("//dsHomes/Homes[@ID='{0}']", ID);
	            (localDS as IDataSource).GetView("").Select(DataSourceSelectArguments.Empty, new DataSourceViewSelectCallback(OnDataSourceViewSelectCallback));
	        }
	    }
	    protected void OnDataSourceViewSelectCallback(IEnumerable data) {
	        IEnumerator enumerator = data.GetEnumerator();
	        if(enumerator.MoveNext()){
	            object datum = enumerator.Current;
	            PropertyDescriptorCollection props = (datum as ICustomTypeDescriptor).GetProperties();
	            object id = props.Find("ID", false).GetValue(datum);
	            Image.Src = "~/" + Utils.GetImageSrc(id);
	            Buy.Text = Utils.GetPrice(props.Find("Price", false).GetValue(datum));
	            Beds.Text = (string)props.Find("Beds", false).GetValue(datum);
	            Baths.Text = (string)props.Find("Baths", false).GetValue(datum);
	            HouseSize.Text = (string)props.Find("HouseSize", false).GetValue(datum);
	            LotSize.Text = (string)props.Find("LotSize", false).GetValue(datum);
	            Price_sqf.Text = Utils.GetPriceForSqf(props.Find("HouseSize", false).GetValue(datum), props.Find("Price", false).GetValue(datum));
	            
	            YearBuilt.Text = (string)props.Find("YearBuilt", false).GetValue(datum);
	            PropertyType.Text = Utils.GetPropertyType(props.Find("Type", false).GetValue(datum));

	            Address.Text = Utils.ExtractFirstRow(props.Find("Address", false).GetValue(datum));
	            Address2.Text = Utils.ExtractSecondRow(props.Find("Address", false).GetValue(datum));
	            Features.Text = (string)props.Find("Features", false).GetValue(datum);
	        }
	    }
	}