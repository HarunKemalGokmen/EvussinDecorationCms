using System;
using System.Collections.Generic;

public partial class Hizmetler : System.Web.UI.Page
{
    private HizmetIslemleri hizmetIslemleri = new HizmetIslemleri();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<Hizmet> hizmetler = hizmetIslemleri.AktifHizmetleriGetir();
            rptHizmetler.DataSource = hizmetler;
            rptHizmetler.DataBind();
        }
    }
}
