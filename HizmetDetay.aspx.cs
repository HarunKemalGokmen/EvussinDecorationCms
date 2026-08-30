using System;

public partial class HizmetDetay : System.Web.UI.Page
{
    private HizmetIslemleri hizmetIslemleri = new HizmetIslemleri();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HizmetGetir();
        }
    }

    private void HizmetGetir()
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("Hizmetler.aspx");
            return;
        }

        int id;
        if (!int.TryParse(Request.QueryString["id"], out id))
        {
            Response.Redirect("Hizmetler.aspx");
            return;
        }

        Hizmet hizmet = hizmetIslemleri.IdYeGoreHizmetGetir(id);

        if (hizmet == null || !hizmet.AktifMi)
        {
            pnlIcerik.Visible = false;
            pnlHata.Visible = true;
            ltrHata.Text = "Aradığınız hizmet bulunamadı veya yayından kaldırılmış olabilir.";
            return;
        }

        lblBaslik.Text = hizmet.HizmetBaslik;
        lblOzet.Text = hizmet.HizmetOzet;
        ltrDetay.Text = hizmet.HizmetDetay;
        
        imgHizmet.ImageUrl = string.IsNullOrEmpty(hizmet.HizmetResim) 
            ? "https://via.placeholder.com/800x400?text=Evussin+Decoration" 
            : hizmet.HizmetResim;
    }
}
