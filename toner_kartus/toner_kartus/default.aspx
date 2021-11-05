<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="toner_kartus._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap-5.0.0-beta1-dist/bootstrap-5.0.0-beta1-dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap-5.0.0-beta1-dist/bootstrap-5.0.0-beta1-dist/css/bootstrap.css" rel="stylesheet" />
    <link href="style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <h3 style="text-align:center"> Toner/Kartuş Uygulaması</h3>
    <div class="container">
  <div class="row">
    <div class="col-sm">
          <h4 style="text-align:center">Satıcı Kayıt Girişi</h4>
   <asp:Panel ID="Panel1" runat="server" BorderColor="#FF6600" BorderStyle="Solid">
       <br />
       <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="saticiadLabel" runat="server" Width="150px" Height="22px"  Text="Adı"></asp:Label></div>
       <div ><asp:TextBox ID="saticiAdTextbox" CssClass="text" AutoCompleteType="Disabled" runat="server"  OnTextChanged="saticiAdTextbox_TextChanged" AutoPostBack="true"></asp:TextBox></div>
           </div>
       <br />
       <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="saticiSoyadLabel" runat="server" Width="150px" Height="22px"  Text="Soyadı"></asp:Label></div>
       <div ><asp:TextBox ID="SaticiSoyadTextbox" CssClass="text" AutoCompleteType="Disabled" AutoPostBack="true" runat="server" OnTextChanged="SaticiSoyadTextbox_TextChanged"></asp:TextBox></div>
           </div>
       <br />
       <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="saticiTelLabel" runat="server" Width="150px" Height="22px"  Text="Telefon Numarası"></asp:Label></div>
       <div ><asp:TextBox ID="SaticiTelTextbox" CssClass="text" AutoCompleteType="Disabled" runat="server"></asp:TextBox></div>
           <asp:RegularExpressionValidator ID="regvSifre" runat="server" ValidationExpression="^\S{11,11}$"  ErrorMessage="Numarayı eksik ya da fazla girdiniz" ControlToValidate="SaticiTelTextbox" Display="Dynamic" Font-Bold="True" ForeColor="Red"></asp:RegularExpressionValidator>
       
           </div>
       <br />
       <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="sirketLabel" runat="server" Width="150px" Height="22px"  Text=" Şirket Adı"></asp:Label></div>
       <div ><asp:TextBox ID="sirketTextbox" CssClass="text" AutoCompleteType="Disabled" AutoPostBack="true" runat="server" OnTextChanged="sirketTextbox_TextChanged"></asp:TextBox></div>
           </div>
       <br />
       <div style="text-align:center"><asp:Button ID="saticiButon" CssClass="btn btn-success" runat="server" Text="KAYDET" OnClick="saticiButon_Click" /></div>
       <br />
       <asp:Label  ID="Labelsaticiuyari" runat="server"  Font-Bold="True" ForeColor="Red"></asp:Label>
            </asp:Panel>
         </div>
      <br />
      <br />
      <br />
    <div class="col-sm">
          <h4 style="text-align:center">Toner/Kartuş Giriş İşlemleri</h4>
         <asp:Panel ID="Panel2" runat="server" BorderColor="#009933" BorderStyle="Solid">
             <br />
       <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="barkodLabel" runat="server" Width="150px" Height="22px"  Text="Barkod No"></asp:Label></div>
       <div ><asp:TextBox ID="barkodTextbox" CssClass="text" AutoCompleteType="Disabled" AutoPostBack="true" runat="server" OnTextChanged="barkodTextbox_TextChanged"></asp:TextBox></div>
           </div>
             <br />
       <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="markaLabel" runat="server" Width="150px" Height="22px"  Text="Marka"></asp:Label></div>
       <div ><asp:TextBox ID="markaTextbox" CssClass="text" AutoCompleteType="Disabled" AutoPostBack="true" runat="server" OnTextChanged="markaTextbox_TextChanged"></asp:TextBox></div>
           </div>
             <br />
       <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="girisTarihLabel" runat="server" Width="150px" Height="22px"  Text="Giriş Tarihi"></asp:Label></div>
       <div ><asp:TextBox ID="girisTarihTextBox" runat="server" ReadOnly="True"></asp:TextBox></div>
           </div>
             <br />
       <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="saticiSecLabel" runat="server" Width="150px" Height="22px"  Text="Satıcı Seç"></asp:Label></div>
       <div >
           <asp:DropDownList ID="saticiDropDownList" runat="server" AutoPostBack="True"></asp:DropDownList></div>
           </div>
             <br />
             <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="renkLabel" runat="server" Width="150px" Height="22px"  Text="Renk Seç"></asp:Label></div>
       <div >
           <asp:DropDownList ID="renkDropDownList" runat="server">
               <asp:ListItem>SEÇİNİZ</asp:ListItem>
               <asp:ListItem>RENKLİ</asp:ListItem>
               <asp:ListItem Selected="True">SİYAH</asp:ListItem>
           </asp:DropDownList></div>
           </div>
             <br />
             <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="toner_kartusLabel" runat="server" Width="150px" Height="22px"  Text="Toner/Kartuş Seç"></asp:Label></div>
       <div >
           <asp:DropDownList ID="toner_kartusDropDownList" runat="server">
               <asp:ListItem>SEÇİNİZ</asp:ListItem>
               <asp:ListItem>TONER</asp:ListItem>
               <asp:ListItem>KARTUŞ</asp:ListItem>
           </asp:DropDownList></div>
                 <br />
                 <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="tonertozuLabel" runat="server" Width="150px" Height="22px"  Text="Toner Tozu"></asp:Label></div>
       <div ><asp:TextBox ID="tonerTozuTextbox" CssClass="text" AutoCompleteType="Disabled" AutoPostBack="true" runat="server" OnTextChanged="tonerTozuTextbox_TextChanged"></asp:TextBox></div>
           </div>
           </div>
             <br />
       <div style="text-align:center"><asp:Button ID="Button1" CssClass="btn btn-success" runat="server" Text="KAYDET" OnClick="Button1_Click" /></div>
       <br />
             <asp:Label ID="labelgirisuyari" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
 </asp:Panel>
    </div>
      <br />
      <br />
      <br />
      <br />
    <div class="col-sm">
          <h4 style="text-align:center">Toner/Kartuş Çıkış İşlemleri</h4>
         <asp:Panel ID="Panel3" runat="server" BorderColor="Red" BorderStyle="Solid">
             <br />
       <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="islemNoLabel" runat="server" Width="150px" Height="22px"  Text="İşlem No"></asp:Label></div>
       <div ><asp:TextBox ID="islemNoTextBox" runat="server" ReadOnly="True"></asp:TextBox></div>
           </div>
             <br />
       <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="barkodNo2Label" runat="server" Width="150px" Height="22px"  Text="Barkod No"></asp:Label></div>
       <div ><asp:TextBox ID="BarkodCikisTextBox" runat="server" ReadOnly="True"></asp:TextBox></div>
           </div>
             <br />
       <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="ciktiLabel" runat="server" Width="150px" Height="22px"  Text="Çıktı Sayısı"></asp:Label></div>
       <div ><asp:TextBox ID="CiktiTextBox" AutoCompleteType="Disabled" runat="server" TextMode="Number"></asp:TextBox></div>
           </div>
             <br />
       <div style="text-align:center">
         <div style="float:left; width: 150px; height:22px"><asp:Label ID="bitisTarihLabel" runat="server" Width="150px" Height="22px"  Text="Bitiş Tarihi"></asp:Label></div>
       <div ><asp:TextBox ID="bitisTarihTextBox" runat="server" ReadOnly="True"></asp:TextBox></div>
           </div>
             <br />
              <div style="text-align:center"><asp:Button ID="cikisButton" CssClass="btn btn-success" runat="server" Text="KAYDET" OnClick="cikisButton_Click" /></div>
             <br />
             <asp:Label ID="labelcikisuyari" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
             </asp:Panel>
    </div>
  </div>
        </div>
        <div>
            <br />
            <div style="background-color:#D5E7EE">
                <br />
            <h2 style="text-align:center;">Kayıt Sorgulama Alanı</h2>
                <br />
            <div style="height: 29px;text-align:center;margin-left:500px;">
         <div style="float:left; width: 150px; height:22px ; text-align:center"><asp:Label ID="aramaLabel" runat="server" Width="150px" Height="22px" Text="Barkod No " Font-Bold="True"></asp:Label></div>
       <div style="float:left; Width:156px; height: 28px;" ><asp:TextBox ID="aramaTextBox" CssClass="text" AutoCompleteType="Disabled" runat="server" Width="150px" Height="22px" OnTextChanged="aramaTextBox_TextChanged"></asp:TextBox></div>
                </div>
           <br />
            <div style="text-align:center; margin-left:500px; height: 35px;">
                <div style="float:left; width: 150px; height:33px"><asp:Button ID="arabutton" runat="server" CssClass="btn btn-info" Text="Arama Yap" OnClick="arabutton_Click" /></div> 
            <div style="float:left; width: 150px; height:29px"><asp:Button ID="temizlebuton" runat="server" CssClass="btn btn-warning" Text="Aramayı Temizle" OnClick="temizlebuton_Click" /></div>
            </div>
                <br />
                </div>
            <div> <asp:Panel ID="kayıtpanel" runat="server" BorderStyle="Solid" BorderColor="#6600FF" style="margin-top: 0px" HorizontalAlign="Center">
                <asp:GridView  ID="kayıtGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="islemNo" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="kayıtGrid_SelectedIndexChanged" HorizontalAlign="Center" Width="100%">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="islemNo" HeaderText="İşlem No" InsertVisible="False" ReadOnly="True" SortExpression="islemNo" />
                        <asp:BoundField DataField="BarkodNo" HeaderText="Barkod No" SortExpression="BarkodNo" />
                        <asp:BoundField DataField="marka" HeaderText="Marka" SortExpression="marka" />
                        <asp:BoundField DataField="tur" HeaderText="Tür" SortExpression="tur" />
                        <asp:BoundField DataField="renk" HeaderText="Renk" SortExpression="renk" />
                        <asp:BoundField DataField="tonerTozu" HeaderText="Toner Tozu" SortExpression="tonerTozu" />
                        <asp:BoundField DataField="ciktiSayisi" HeaderText="Çıktı Sayısı" SortExpression="ciktiSayisi" />
                        <asp:BoundField DataField="aTarih" HeaderText="Alınma Tarihi" SortExpression="aTarih" />
                        <asp:BoundField DataField="bTarih" HeaderText="Çıkış Tarihi" SortExpression="bTarih" />
                        <asp:BoundField DataField="saticiAd" HeaderText="Satıcı Adı" SortExpression="saticiAd" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:toner-kartusConnectionString %>" SelectCommand="SELECT kartus.islemNo, kartus.BarkodNo, kartus.marka, kartus.tur, kartus.renk, kartus.tonerTozu, kartus.ciktiSayisi, kartus.aTarih, kartus.bTarih, satici.saticiAd FROM kartus INNER JOIN satici ON kartus.saticiID = satici.saticiID ORDER BY islemNo DESC"></asp:SqlDataSource>
                </asp:Panel>
                <asp:Panel ID="aramapanel" runat="server" BorderStyle="Solid" BorderColor="#6600FF">
                     <asp:GridView ID="aramagrid" runat="server" Width="100%" AutoGenerateColumns="False" DataKeyNames="islemNo" DataSourceID="SqlDataSource2" HorizontalAlign="Center">
                         <Columns>
                             <asp:BoundField DataField="islemNo" HeaderText="İşlem No" InsertVisible="False" ReadOnly="True" SortExpression="islemNo" />
                             <asp:BoundField DataField="BarkodNo" HeaderText="Barkod No" SortExpression="BarkodNo" />
                             <asp:BoundField DataField="marka" HeaderText="Marka" SortExpression="marka" />
                             <asp:BoundField DataField="tur" HeaderText="Tür" SortExpression="tur" />
                             <asp:BoundField DataField="renk" HeaderText="Renk" SortExpression="renk" />
                             <asp:BoundField DataField="tonerTozu" HeaderText="Toner Tozu" SortExpression="tonerTozu" />
                             <asp:BoundField DataField="ciktiSayisi" HeaderText="Çıktı Sayısı" SortExpression="ciktiSayisi" />
                             <asp:BoundField DataField="aTarih" HeaderText="Alınma Tarihi" SortExpression="aTarih" />
                             <asp:BoundField DataField="bTarih" HeaderText="Çıkış Tarihi" SortExpression="bTarih" />
                             <asp:BoundField DataField="saticiAd" HeaderText="Satıcı Adı" SortExpression="saticiAd" />
                         </Columns>
                     </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:toner-kartusConnectionString %>" SelectCommand="SELECT kartus.islemNo, kartus.BarkodNo, kartus.marka, kartus.tur, kartus.renk, kartus.tonerTozu, kartus.ciktiSayisi, kartus.aTarih, kartus.bTarih, satici.saticiAd FROM kartus INNER JOIN satici ON kartus.saticiID = satici.saticiID WHERE ([BarkodNo] LIKE '%' + @BarkodNo + '%') ORDER BY islemNo DESC">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="aramaTextBox" Name="BarkodNo" PropertyName="Text" Type="String" />
                        </SelectParameters>
                     </asp:SqlDataSource>
                </asp:Panel>
            </div>

            </div>

    </form>
</body>
</html>
