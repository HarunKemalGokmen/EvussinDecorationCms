using System;

public partial class Iletisim : System.Web.UI.Page
{
    private MesajIslemleri mesajIslemleri = new MesajIslemleri();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnGonder_Click(object sender, EventArgs e)
    {
        Mesaj yeniMesaj = new Mesaj
        {
            AdSoyad = txtAdSoyad.Text.Trim(),
            Email = txtEmail.Text.Trim(),
            MesajMetni = txtMesajMetni.Text.Trim(),
            OkunduMu = false,
            Tarih = DateTime.Now
        };

        int sonuc = mesajIslemleri.MesajEkle(yeniMesaj);

        if (sonuc > 0)
        {
            pnlBasarili.Visible = true;
            
            txtAdSoyad.Text = "";
            txtEmail.Text = "";
            txtMesajMetni.Text = "";
        }
    }
}
