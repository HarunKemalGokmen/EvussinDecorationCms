using System;

public class Mesaj
{
    public int MesajId { get; set; }
    public string AdSoyad { get; set; }
    public string Email { get; set; }
    public string MesajMetni { get; set; }
    public DateTime Tarih { get; set; }
    public bool OkunduMu { get; set; }

    public Mesaj() { }

    public Mesaj(int mesajId, string adSoyad, string email, string mesajMetni, DateTime tarih, bool okunduMu)
    {
        MesajId = mesajId;
        AdSoyad = adSoyad;
        Email = email;
        MesajMetni = mesajMetni;
        Tarih = tarih;
        OkunduMu = okunduMu;
    }
}
