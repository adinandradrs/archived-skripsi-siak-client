<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="DUKCAPIL.WebForm2" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            SelectMethod="infoKota" TypeName="DUKCAPIL.asus_a43sj.SIAKServiceService">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="kotaID" SessionField="kotaID" 
                    Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <dxwgv:ASPxGridView runat="server" ID="pendudukGrid" 
        AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" KeyFieldName="nik" Width="800px" 
            CssClass="content">
            <Templates>
                <DetailRow>
                    <table>
                        <tr>
                            <td>
                                <dxe:ASPxBinaryImage runat="server" ID="fotoBinaryImage" value='<%# Eval("foto") %>' Height="200px" Width="200px"></dxe:ASPxBinaryImage>
                            </td>
                            <td valign="top">
                                <b>Jenis Kelamin : </b><dxe:ASPxLabel runat="server" ID="jenisKelaminLabel" value='<%# Eval("jenisKelamin") %>'></dxe:ASPxLabel><br />
                                <b>No Telepon : </b><dxe:ASPxLabel runat="server" ID="noTeleponLabel" value='<%# Eval("noTelepon") %>'></dxe:ASPxLabel><br />
                                <b>Tanggal Lahir : </b><dxe:ASPxLabel runat="server" ID="tanggalLahirLabel" value='<%# Eval("tanggalLahir") %>'></dxe:ASPxLabel><br />
                                <b>Tanggal Pengajuan : </b><dxe:ASPxLabel runat="server" ID="tanggalPengajuan" value='<%# Eval("tanggalPengajuan") %>'></dxe:ASPxLabel><br />
                            </td>
                        </tr>
                    </table>
                </DetailRow>
            </Templates>
            <Columns>
                <dxwgv:GridViewDataTextColumn FieldName="agama" VisibleIndex="0">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="alamat" VisibleIndex="1">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="jenisKelamin" VisibleIndex="2">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="nama" VisibleIndex="3">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="nik" VisibleIndex="4">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="noTelepon" VisibleIndex="5">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="pekerjaan" VisibleIndex="6">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="pendidikan" VisibleIndex="7">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="tanggalLahir" VisibleIndex="8">
                </dxwgv:GridViewDataTextColumn>
                <dxwgv:GridViewDataTextColumn FieldName="tanggalPengajuan" VisibleIndex="9">
                </dxwgv:GridViewDataTextColumn>
            </Columns>
            <Settings ShowGroupPanel="True" ShowPreview=true  />
            <SettingsDetail ShowDetailRow="true" AllowOnlyOneMasterRowExpanded="true" />
        </dxwgv:ASPxGridView>
    </div>
    <center><b><% Response.Write(Session["namaKota"]); %></b></center>
</asp:Content>
