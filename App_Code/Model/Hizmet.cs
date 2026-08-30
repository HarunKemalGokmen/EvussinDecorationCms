public class Hizmet
{
    public int HizmetId { get; set; }
    public string HizmetBaslik { get; set; }
    public string HizmetOzet { get; set; }
    public string HizmetDetay { get; set; }
    public string HizmetResim { get; set; }
    public bool AktifMi { get; set; }

    public Hizmet() { }

    public Hizmet(int hizmetId, string hizmetBaslik, string hizmetOzet, string hizmetDetay, string hizmetResim, bool aktifMi)
    {
        HizmetId = hizmetId;
        HizmetBaslik = hizmetBaslik;
        HizmetOzet = hizmetOzet;
        HizmetDetay = hizmetDetay;
        HizmetResim = hizmetResim;
        AktifMi = aktifMi;
    }

    public bool ResimVarMi()
    {
        return !string.IsNullOrEmpty(HizmetResim);
    }
}
