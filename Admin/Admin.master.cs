using System;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["AdminKullanici"] != null)
            {
                lblKullanici.Text = Session["AdminKullanici"].ToString();
            }
        }
    }

    protected void lnkCikis_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}
