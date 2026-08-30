using System;
using System.Collections.Generic;
using System.Web.UI.WebControls;

public partial class Admin_MesajYonetimi : System.Web.UI.Page
{
    private MesajIslemleri mesajIslemleri = new MesajIslemleri();

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
        List<Mesaj> mesajlar = mesajIslemleri.MesajlariGetir();
        
        if (mesajlar.Count == 0)
        {
            pnlYok.Visible = true;
            rptMesajlar.Visible = false;
        }
        else
        {
            pnlYok.Visible = false;
            rptMesajlar.Visible = true;
            rptMesajlar.DataSource = mesajlar;
            rptMesajlar.DataBind();
        }
    }

    protected void rptMesajlar_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument);

        if (e.CommandName == "Okundu")
        {
            mesajIslemleri.MesajiOkunduIsaretle(id);
            Listele();
        }
        else if (e.CommandName == "Sil")
        {
            mesajIslemleri.MesajSil(id);
            Listele();
        }
    }
}
