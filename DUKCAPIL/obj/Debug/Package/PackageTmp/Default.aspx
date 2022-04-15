<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="DUKCAPIL.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="margin:125px auto 0 auto;">
        <tr>
            <td>
                Username
            </td>
            <td>
                <dxe:ASPxTextBox runat="server" ID="usernameTextBox">
                </dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                Sandi
            </td>
            <td>
                <dxe:ASPxTextBox runat="server" ID="sandiTextBox" Password="true">
                </dxe:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <dxe:ASPxButton runat="server" ID="loginButton" Text="Login" 
                    onclick="loginButton_Click"></dxe:ASPxButton>
            </td>
        </tr>
    </table>
</asp:Content>
