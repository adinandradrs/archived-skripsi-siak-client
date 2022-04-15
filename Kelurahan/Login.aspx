<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" style="">
<head id="Head1" runat="server">
	<meta id="IECompatibilityMeta" http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0" />
    <meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="robots" content="noindex, nofollow" />
    <title>SIAK - Kelurahan</title>
    <link type="text/css" rel="stylesheet" href="Styles/Styles.css" />
    <link id="PortraitStyleLink" runat="server" type="text/css" rel="stylesheet" media="all and (orientation:portrait)" href="Styles/Portrait.css" />
    <link id="LandscapeStyleLink" runat="server" type="text/css" rel="stylesheet" media="all and (orientation:landscape)" href="Styles/Landscape.css" />
    <script src="Scripts/Script.js" type="text/javascript"></script>
</head>
<body style="padding:0;margin:0;">
    <form id="form1" runat="server">
        <div style="width:100%;">
            <center>
                <div style="font-size:25pt; font-weight:bold;color:Orange;margin-top:70pt;">
                    <span>T</span>a<span>b</span>l<span>e</span>t S<span>I</span>A<span>K</span> - <span>K</span>e<span>l</span>u<span>r</span>a<span>h</span>a<span>n</span>
                </div>
            </center>
            <table style="margin:70px auto 0 auto;">
                <tr>
                    <td style="font-weight:bolder;font-size:12pt;">Username</td>
                    <td>
                        <dx:ASPxTextBox runat="server" ID="UserNameTextBox">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td style="font-weight:bolder;font-size:12pt;">Sandi</td>
                    <td>
                        <dx:ASPxTextBox runat="server" ID="SandiTextBox" Password="true">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <dx:ASPxButton runat="server" ID="LoginButton" Text="Login" 
                            onclick="LoginButton_Click">
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </div>    
        <div style="margin-top:40px">
            <center>
                Developed by FTI :: UKSW &copy; 2012
            </center>
        </div>
    </form>
</body>
</html>
