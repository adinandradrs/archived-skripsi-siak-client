<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register TagPrefix="uc" TagName="CardView" Src="~/Controls/CardView.ascx" %>
<%@ Register TagPrefix="uc" TagName="DetailsContainer" Src="~/Controls/DetailsContainer.ascx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta id="IECompatibilityMeta" http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="robots" content="noindex, nofollow" />
    <title>Home Realtor</title>
    <link type="text/css" rel="stylesheet" href="Styles/Styles.css" />
    <link id="PortraitStyleLink" runat="server" type="text/css" rel="stylesheet" media="all and (orientation:portrait)" href="Styles/Portrait.css" />
    <link id="LandscapeStyleLink" runat="server" type="text/css" rel="stylesheet" media="all and (orientation:landscape)" href="Styles/Landscape.css" />
    <script src="Scripts/Script.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <dx:ASPxPageControl ID="TabBar" runat="server" ClientInstanceName="TabBar" 
        SkinID="TabBar" ActiveTabIndex="0" EnableCallBacks="true">
        <TabPages>
            <dx:TabPage Name="CardView" Text="">
                <ActiveTabImage Url="~/Images/CardViewPressed.png" Height="42px" Width="79px">
                </ActiveTabImage>
                <TabImage Url="~/Images/CardView.png" Height="42px" Width="79px">
                </TabImage>
                <ContentCollection>
                    <dx:ContentControl>
                        <uc:CardView ID="CardView" runat="server" />
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="DetailsContainer" Text="">
                <TabTemplate></TabTemplate>
                <ActiveTabTemplate></ActiveTabTemplate>
                <ContentCollection>
                    <dx:ContentControl>
                        <uc:DetailsContainer ID="DetailsContainer" runat="server" />
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Name="StartupScreen" Text="">
                <TabTemplate></TabTemplate>
                <ActiveTabTemplate></ActiveTabTemplate>
                <ContentCollection>
<dx:ContentControl runat="server" SupportsDisabledAttribute="True"></dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
        <ClientSideEvents Init="OnTabBarInit" ActiveTabChanged="OnActiveTabChanged" EndCallback="OnTabBarEndCallback"/>
    </dx:ASPxPageControl>

    <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
        <ClientSideEvents ControlsInitialized="function(){ hr.Adjust(); }" />
    </dx:ASPxGlobalEvents>
	
	<%-- DXCOMMENT: Configure data sources as your application logic dictates --%>
    <asp:XmlDataSource ID="XmlHomes" runat="server" DataFile="~/App_Data/Homes.xml" XPath="//dsHomes/Homes"></asp:XmlDataSource>
    <asp:XmlDataSource ID="XmlHomesSpecial" runat="server" DataFile="~/App_Data/Homes.xml" XPath="//dsHomes/Homes[@Price<350000]"></asp:XmlDataSource>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="infoBiodataKelurahan" 
        TypeName="asus_a43sj.SIAKServiceService">
        <SelectParameters>
            <asp:Parameter DefaultValue="16" Name="kelurahanID" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    </form>
</body>
</html>