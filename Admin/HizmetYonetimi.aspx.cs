using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

public partial class Admin_HizmetYonetimi : System.Web.UI.Page
{
    private HizmetIslemleri hizmetIslemleri = new HizmetIslemleri();

    protected void Page_Load(object sender, EventArgs e)
    {
        AdminGuvenlik.GirisGerekli();

        if (!IsPostBack)
        {
            Listele();
        }
    }

    private void Listele()
    {
        List<Hizmet> hizmetler = hizmetIslemleri.TumHizmetleriGetir();
        
        if (hizmetler.Count == 0)
        {
            pnlYok.Visible = true;
            rptHizmetler.Visible = false;
        }
        else
        {
            pnlYok.Visible = false;
            rptHizmetler.Visible = true;
            rptHizmetler.DataSource = hizmetler;
            rptHizmetler.DataBind();
        }
    }

    protected void rptHizmetler_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "Sil")
        {
            int id = Convert.ToInt32(e.CommandArgument);
            hizmetIslemleri.HizmetSil(id);
            Listele();
        }
    }
}
