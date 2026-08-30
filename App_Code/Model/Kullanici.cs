public class Kullanici
{
    public int KullaniciId { get; set; }
    public string KullaniciAdi { get; set; }
    public string Sifre { get; set; }

    public Kullanici() { }

    public Kullanici(int kullaniciId, string kullaniciAdi, string sifre)
    {
        KullaniciId = kullaniciId;
        KullaniciAdi = kullaniciAdi;
        Sifre = sifre;
    }
}
