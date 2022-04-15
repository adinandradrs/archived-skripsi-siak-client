<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DetailsContainer.ascx.cs" Inherits="DetailsContainer" %>

<%@ Register TagPrefix="uc" TagName="Details" Src="~/Controls/Details.ascx" %>

<script type="text/javascript" id="dxss_DetailsContainer">
</script>

<div class="toolbar">
    <dx:ASPxButton id="btnBack" runat="server" Width="104px" AutoPostBack="false" BackColor="Transparent" class="btnAllOffers">
        <ClientSideEvents Click="function(s, e){ hr.Back(); }" />
        <BackgroundImage ImageUrl="../Images/AllOffers.png" />
        <Border BorderStyle="None" />
        <HoverStyle Border-BorderStyle="None">
        </HoverStyle>
    </dx:ASPxButton>
</div>

<uc:Details ID="details" runat="server" />