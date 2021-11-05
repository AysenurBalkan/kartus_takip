using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace toner_kartus
{
    public partial class _default : System.Web.UI.Page
    {
        SqlConnection baglan = new SqlConnection(@"Data Source=DESKTOP-HN2G937\SQLSERVER; Initial Catalog = toner-kartus; User ID = sa; Password=");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                baglan.Open();
                SqlDataAdapter adptr = new SqlDataAdapter("select*from satici", baglan);
                DataTable dt = new DataTable();
                adptr.Fill(dt);
                saticiDropDownList.DataSource = dt;
                saticiDropDownList.DataTextField = "saticiAd";
                saticiDropDownList.DataValueField = "saticiID";
                saticiDropDownList.DataBind();
                baglan.Close();
            }
       
            girisTarihTextBox.Text= DateTime.Now.ToString();
            bitisTarihTextBox.Text= DateTime.Now.ToString();
            kayıtpanel.Visible = true;
            aramapanel.Visible = false;
            
        }

        protected void saticiButon_Click(object sender, EventArgs e)
        {
            baglan.Open();
            if (saticiAdTextbox.Text == "" || SaticiSoyadTextbox.Text == "" || SaticiTelTextbox.Text == "" || sirketTextbox.Text == "")
                {
                Labelsaticiuyari.Text = "Boş Alan Bırakılamaz.";
            }
            else
            {
                SqlCommand komutekle = new SqlCommand("insert into satici (saticiAd,saticiSoyad,telefon,sirketAdi) values(@a1,@a2,@a3,@a4)", baglan);
                komutekle.Parameters.AddWithValue("@a1", saticiAdTextbox.Text);
                komutekle.Parameters.AddWithValue("@a2", SaticiSoyadTextbox.Text);
                komutekle.Parameters.AddWithValue("@a3", SaticiTelTextbox.Text);
                komutekle.Parameters.AddWithValue("@a4", sirketTextbox.Text);
                komutekle.ExecuteNonQuery();
                baglan.Close();
                Response.Redirect("default.aspx");
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            baglan.Open();
            if(barkodTextbox.Text==""||markaTextbox.Text==""||toner_kartusDropDownList.SelectedIndex==0||renkDropDownList.SelectedIndex==-1||saticiDropDownList.SelectedIndex==-1)
            {
                labelgirisuyari.Text = "Boş Alan Bırakılamaz";
            }
            else
            {
                SqlCommand girisekle = new SqlCommand("insert into kartus (BarkodNo,marka,tur,renk,tonerTozu,saticiID,aTarih) values(@b1,@b2,@b3,@b4,@b5,@b6,@b7)", baglan);
                girisekle.Parameters.AddWithValue("@b1", barkodTextbox.Text);
                girisekle.Parameters.AddWithValue("@b2", markaTextbox.Text);
                girisekle.Parameters.AddWithValue("@b3", toner_kartusDropDownList.SelectedItem.Text);
                girisekle.Parameters.AddWithValue("@b4", renkDropDownList.SelectedItem.Text);
                girisekle.Parameters.AddWithValue("@b5", tonerTozuTextbox.Text);
                girisekle.Parameters.AddWithValue("@b6", saticiDropDownList.SelectedItem.Value);
                girisekle.Parameters.AddWithValue("@b7", Convert.ToDateTime(girisTarihTextBox.Text));
                girisekle.ExecuteNonQuery();
                baglan.Close();
                Response.Redirect("default.aspx");
            }
           
        }

        protected void cikisButton_Click(object sender, EventArgs e)
        {
            if(CiktiTextBox.Text=="")
            {
                labelcikisuyari.Text = "Boş Alan Bırakılamaz";
            }
            else
            {
                baglan.Open();
                SqlCommand cikisekle = new SqlCommand("update kartus set ciktiSayisi=@c1,bTarih=@c2  where islemNo=@c3", baglan);
                cikisekle.Parameters.AddWithValue("@c1", CiktiTextBox.Text);
                cikisekle.Parameters.AddWithValue("@c2", Convert.ToDateTime(girisTarihTextBox.Text));
                cikisekle.Parameters.AddWithValue("@c3", islemNoTextBox.Text);
                cikisekle.ExecuteNonQuery();
                baglan.Close();
                Response.Redirect("default.aspx");
            }
           
        }

        protected void kayıtGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            islemNoTextBox.Text = kayıtGrid.SelectedRow.Cells[1].Text;
            BarkodCikisTextBox.Text = kayıtGrid.SelectedRow.Cells[2].Text;
        }

        protected void aramaTextBox_TextChanged(object sender, EventArgs e)
        {
            System.Globalization.CultureInfo dil;
            dil = new System.Globalization.CultureInfo("tr-TR");
            aramaTextBox.Text = aramaTextBox.Text.ToUpper(dil);

        }

        protected void arabutton_Click(object sender, EventArgs e)
        {
            kayıtpanel.Visible = false;
            aramapanel.Visible = true;
        }

        protected void saticiAdTextbox_TextChanged(object sender, EventArgs e)
        {
            System.Globalization.CultureInfo dil;
            dil = new System.Globalization.CultureInfo("tr-TR");
            saticiAdTextbox.Text = saticiAdTextbox.Text.ToUpper(dil);
        }

        protected void SaticiSoyadTextbox_TextChanged(object sender, EventArgs e)
        {
            System.Globalization.CultureInfo dil;
            dil = new System.Globalization.CultureInfo("tr-TR");
            SaticiSoyadTextbox.Text = SaticiSoyadTextbox.Text.ToUpper(dil);
        }

        protected void sirketTextbox_TextChanged(object sender, EventArgs e)
        {
            System.Globalization.CultureInfo dil;
            dil = new System.Globalization.CultureInfo("tr-TR");
            sirketTextbox.Text = sirketTextbox.Text.ToUpper(dil);
        }

        protected void barkodTextbox_TextChanged(object sender, EventArgs e)
        {
            System.Globalization.CultureInfo dil;
            dil = new System.Globalization.CultureInfo("tr-TR");
            barkodTextbox.Text = barkodTextbox.Text.ToUpper(dil);
        }

        protected void markaTextbox_TextChanged(object sender, EventArgs e)
        {
            System.Globalization.CultureInfo dil;
            dil = new System.Globalization.CultureInfo("tr-TR");
            markaTextbox.Text = markaTextbox.Text.ToUpper(dil);
        }

        protected void tonerTozuTextbox_TextChanged(object sender, EventArgs e)
        {
            System.Globalization.CultureInfo dil;
            dil = new System.Globalization.CultureInfo("tr-TR");
            tonerTozuTextbox.Text = tonerTozuTextbox.Text.ToUpper(dil);
        }

        protected void temizlebuton_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }
    }
}