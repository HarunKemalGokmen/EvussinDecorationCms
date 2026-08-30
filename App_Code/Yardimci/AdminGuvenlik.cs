using System.Web;

public static class AdminGuvenlik
{
    public static bool GirisYapildiMi()
    {
        return HttpContext.Current.Session["AdminKullanici"] != null;
    }

    public static void GirisGerekli()
    {
        if (!GirisYapildiMi())
        {
            HttpContext.Current.Response.Redirect("Login.aspx");
        }
    }
}
