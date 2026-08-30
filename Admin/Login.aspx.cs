using System;

public partial class Admin_Login : System.Web.UI.Page
{
    private KullaniciIslemleri kullaniciIslemleri = new KullaniciIslemleri();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack && AdminGuvenlik.GirisYapildiMi())
        {
            Response.Redirect("HizmetYonetimi.aspx");
        }
    }

    protected void btnGiris_Click(object sender, EventArgs e)
    {
        Kullanici kullanici = kullaniciIslemleri.GirisKontrol(txtKullaniciAdi.Text.Trim(), txtSifre.Text);

        if (kullanici == null)
        {
            pnlHata.Visible = true;
            ltrHata.Text = "Kullanıcı adı veya şifre hatalı!";
            return;
        }

        Session["AdminKullanici"] = kullanici.KullaniciAdi;
        Response.Redirect("HizmetYonetimi.aspx");
    }
}
