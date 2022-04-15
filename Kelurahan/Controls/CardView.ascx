<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CardView.ascx.cs" Inherits="CardView" %>


<dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Height="650px" Width="0px" HeaderText="Daftar KTP" ClientInstanceName="rp1" CssClass="portraitInvisible rpLeft">
    <PanelCollection>
        <dx:PanelContent ID="PanelContent1" runat="server">
            <dx:ASPxGridView ID="gvCardHomes" runat="server" ClientInstanceName="gvCardHomes" EnableRowsCache="false"
                Width="482px" CssClass="cardViewGrid" Border-BorderStyle="None" style="margin-top:0;" KeyFieldName="nik">
                <Templates>
                    <DataRow>
                        <div class="gvItem">
                            <div class="gvItemLPanel">
                                <dx:ASPxBinaryImage runat="server" ID="FotoBinaryImage" Height="150px" Width="150px"  value='<%# Eval("foto")%>'>
                                </dx:ASPxBinaryImage>
                                <br />
                            </div>
                            <div class="gvItemRPanel">
                                <p><dx:ASPxLabel ID="Address" runat="server" CssClass="address" Text='<%# Eval("nik") %>' /></p>
                                <p class="spacer">&nbsp;</p>
                                <span class="cardProperties">
                                    <p><span class="label">Nama:</span>
                                    <dx:ASPxLabel ID="Beds" runat="server" CssClass="beds" Text='<%# Eval("nama") %>' />

                                    <p><span class="label">Alamat:</span>
                                    <dx:ASPxLabel ID="Baths" runat="server" CssClass="baths" Text='<%# Eval("alamat") %>' />

                                    <p><span class="label">Tanggal Lahir:</span>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" CssClass="yearBuilt" Text='<%# Eval("tanggalLahir") %>' /></p>

                                    <p><span class="label">Pekerjaan:</span>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" CssClass="yearBuilt" Text='<%# Eval("pekerjaan") %>' /></p>

                                    <p><span class="label">Jenis Kelamin:</span>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="yearBuilt" Text='<%# Eval("jenisKelamin") %>' /></p>

                                    <p><span class="label">Expired:</span>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" CssClass="yearBuilt" Text='<%# Eval("expiredKTP") %>' /></p>
                                </span>
                            </div>
                        </div>
                    </DataRow>
                </Templates>
                <SettingsPager Visible="false"/>
                <Settings ShowVerticalScrollBar="True" ShowColumnHeaders="false"/>
                <ClientSideEvents 
                    Init="function(){ hr.CardView_AdjustLPanel(); }" 
                    RowClick="function(s, e){ ShowGVDetailsPage(s, e.visibleIndex); }" />
				<Border BorderStyle="None"></Border>
            </dx:ASPxGridView>
        </dx:PanelContent>
    </PanelCollection>
    <HeaderStyle ForeColor="White" HorizontalAlign="Center" >
        <BackgroundImage ImageUrl="../Images/rpHeaderBack.png" />
        <Border BorderColor="#505153" BorderStyle="Solid" BorderWidth="1px"/>
    </HeaderStyle>
</dx:ASPxRoundPanel>

<dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" Height="0px" Width="0px" HeaderText="Daftar Penduduk" ClientInstanceName="rp2">
    <PanelCollection>
        <dx:PanelContent ID="PanelContent2" runat="server">
			<%-- DXCOMMENT: Configure ASPxGridView to display special offers in a card view format --%>
            <dx:ASPxGridView ID="cardGVHomesSpecial" runat="server" ClientInstanceName="cardGVHomesSpecial" EnableRowsCache="false"
                Width="482px" CssClass="cardViewGrid" Border-BorderStyle="None" KeyFieldName="nik">
                <Templates>
					<%-- DXCOMMENT: Configure the grid's DataRow template in accordance with data source fields --%>
                    <DataRow>
                        <div class="gvItem">
                            <div class="gvItemLPanel">
                                <dx:ASPxBinaryImage runat="server" ID="FotoBinaryImage" Height="150px" Width="150px"  value='<%# Eval("foto")%>'>
                                </dx:ASPxBinaryImage>
                                <br />
                            </div>
                            <div class="gvItemRPanel">
                                <p><dx:ASPxLabel ID="Address" runat="server" CssClass="address" Text='<%# Eval("nik") %>' /></p>
                                <p class="spacer">&nbsp;</p>
                                <span class="cardProperties">
                                    <p><span class="label">Nama:</span>
                                    <dx:ASPxLabel ID="Beds" runat="server" CssClass="beds" Text='<%# Eval("nama") %>' />

                                    <p><span class="label">Alamat:</span>
                                    <dx:ASPxLabel ID="Baths" runat="server" CssClass="baths" Text='<%# Eval("alamat") %>' />

                                    <p><span class="label">Tanggal Lahir:</span>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" CssClass="yearBuilt" Text='<%# Eval("tanggalLahir") %>' /></p>

                                    <p><span class="label">Pekerjaan:</span>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" CssClass="yearBuilt" Text='<%# Eval("pekerjaan") %>' /></p>

                                    <p><span class="label">Pendidikan:</span>
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" CssClass="yearBuilt" Text='<%# Eval("pendidikan") %>' /></p>

                                    <p><span class="label">Jenis Kelamin:</span>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssClass="yearBuilt" Text='<%# Eval("jenisKelamin") %>' /></p>

                                </span>
                            </div>
                        </div>
                    </DataRow>
                </Templates>
                <SettingsPager Visible="false" PageSize="1000"/>
                <Settings ShowVerticalScrollBar="True" ShowColumnHeaders="false"/>
                <ClientSideEvents 
                    Init="function(){ hr.CardView_AdjustRPanel(); }" 
                    RowClick="function(s, e){ ShowGVDetailsPage(s, e.visibleIndex); }" />
				<Border BorderStyle="None"></Border>
            </dx:ASPxGridView>
        </dx:PanelContent>
    </PanelCollection>
    <HeaderStyle ForeColor="White" HorizontalAlign="Center" >
        <BackgroundImage ImageUrl="../Images/rpHeaderBack.png" />
        <Border BorderColor="#505153" BorderStyle="Solid" BorderWidth="1px"/>
    </HeaderStyle>
</dx:ASPxRoundPanel>