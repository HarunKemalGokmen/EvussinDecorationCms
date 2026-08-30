using System;
using System.Collections.Generic;

public partial class _Default : System.Web.UI.Page
{
    private HizmetIslemleri hizmetIslemleri = new HizmetIslemleri();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HizmetleriGetir();
        }
    }

    private void HizmetleriGetir()
    {
        List<Hizmet> hizmetler = hizmetIslemleri.AktifHizmetleriGetir();
        
        if (hizmetler.Count > 3)
            hizmetler = hizmetler.GetRange(0, 3);
            
        rptHizmetler.DataSource = hizmetler;
        rptHizmetler.DataBind();
    }
}
