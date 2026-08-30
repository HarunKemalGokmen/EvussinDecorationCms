using System;

public partial class Admin_HizmetEkleDuzenle : System.Web.UI.Page
{
    private HizmetIslemleri hizmetIslemleri = new HizmetIslemleri();
    private int guncellenecekId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        AdminGuvenlik.GirisGerekli();

        if (Request.QueryString["id"] != null)
        {
            int.TryParse(Request.QueryString["id"], out guncellenecekId);
        }

        if (!IsPostBack)
        {
            if (guncellenecekId > 0)
            {
                ltrSayfaBaslik.Text = "Hizmeti Düzenle";
                VerileriDoldur(guncellenecekId);
            }
        }
    }

    private void VerileriDoldur(int id)
    {
        Hizmet hizmet = hizmetIslemleri.IdYeGoreHizmetGetir(id);
        
        if (hizmet != null)
        {
            txtBaslik.Text = hizmet.HizmetBaslik;
            txtOzet.Text = hizmet.HizmetOzet;
            txtDetay.Text = hizmet.HizmetDetay;
            chkAktif.Checked = hizmet.AktifMi;

            if (hizmet.ResimVarMi())
            {
                pnlMevcutResim.Visible = true;
                imgMevcut.ImageUrl = "../" + hizmet.HizmetResim;
                // Mevcut resim yolunu saklamak için ViewState kullanabiliriz
                ViewState["MevcutResimYolu"] = hizmet.HizmetResim;
            }
        }
    }

    protected void btnKaydet_Click(object sender, EventArgs e)
    {
        string resimYolu = "";

        // Eğer yeni resim seçilmişse yükle
        if (fuResim.HasFile)
        {
            resimYolu = DosyaYukleme.ResimYukle(fuResim, "resimler");
        }
        else if (ViewState["MevcutResimYolu"] != null)
        {
            // Yeni resim seçilmediyse eski resmi koru
            resimYolu = ViewState["MevcutResimYolu"].ToString();
        }

        Hizmet hizmet = new Hizmet
        {
            HizmetBaslik = txtBaslik.Text.Trim(),
            HizmetOzet = txtOzet.Text.Trim(),
            HizmetDetay = txtDetay.Text.Trim(),
            AktifMi = chkAktif.Checked,
            HizmetResim = resimYolu
        };

        if (guncellenecekId > 0)
        {
            hizmet.HizmetId = guncellenecekId;
            hizmetIslemleri.HizmetGuncelle(hizmet);
            pnlBilgi.Visible = true;
        }
        else
        {
            int yeniId = hizmetIslemleri.HizmetEkle(hizmet);
            if (yeniId > 0)
            {
                Response.Redirect("HizmetYonetimi.aspx");
            }
        }
    }
}
