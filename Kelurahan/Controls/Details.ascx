<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Details.ascx.cs" Inherits="Details" %>

<script type="text/javascript" id="dxss_Detail">
</script>
<dx:ASPxCallbackPanel ID="cpDetails" runat="server" oncallback="cpDetails_Callback" CssClass="cpDetails" HideContentOnCallback="false">
    <PanelCollection>
        <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
			<%-- DXCOMMENT: Configure controls to present offer details --%>
            <div class="leftPanel">
                <div class="image">
                    <img id="Image" runat="server" alt="" />
                </div>
                <dx:ASPxButton ID="Buy" runat="server" CssClass="btnBuy" AutoPostBack="false" Width="123" ClientSideEvents-Click="function(){ Buy(); }" ></dx:ASPxButton>


                <p><span class="label">Beds:</span>
                <dx:ASPxLabel ID="Beds" runat="server" CssClass="beds" />
                <span class="beds">bed</span></p>

                <p><span class="label">Baths:</span>
                <dx:ASPxLabel ID="Baths" runat="server" CssClass="baths" />
                <span class="baths">bath</span></p>

                <p><span class="label">House Size:</span>
                <dx:ASPxLabel ID="HouseSize" runat="server" CssClass="houseSize" />
                <span class="label">sq ft</span></p>

                <p><span class="label">Lot Size:</span>
                <dx:ASPxLabel ID="LotSize" runat="server" CssClass="label" />
                <span class="label">Acres</span></p>

                <p><span class="label">Price/sqf:</span>
                <dx:ASPxLabel ID="Price_sqf" runat="server" CssClass="label" Text='<%# Utils.GetPriceForSqf(Eval("HouseSize"), Eval("Price")) %>' /></p>

                <p><span class="label">Year Built:</span>
                <dx:ASPxLabel ID="YearBuilt" runat="server" CssClass="yearBuilt" /></p>

                <p><span class="label">Property type</span>
                <dx:ASPxLabel ID="PropertyType" runat="server" CssClass="type" /></p>
            </div>
            <div class="rightPanel">
                <dx:ASPxLabel ID="Address" runat="server" CssClass="address" />
                <br />
                <dx:ASPxLabel ID="Address2" runat="server" CssClass="address2" />
                
                <p class="paragraphPF"><span class="labelPF">Property Features</span></p>
                <p class="paragrafFeatures"><dx:ASPxLabel ID="Features" runat="server" CssClass="features" /></p>
            </div>
        </dx:PanelContent>
    </PanelCollection>
    <LoadingPanelStyle BackColor="#CBCED2"></LoadingPanelStyle>
</dx:ASPxCallbackPanel>