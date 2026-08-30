using System.Data.SqlClient;

public class KullaniciIslemleri
{
    public Kullanici GirisKontrol(string kullaniciAdi, string sifre)
    {
        using (SqlConnection baglanti = new SqlConnection(Db.BaglantiCumlesi))
        using (SqlCommand komut = new SqlCommand("SELECT KullaniciId, KullaniciAdi, Sifre FROM Tbl_Kullanici WHERE KullaniciAdi=@KullaniciAdi AND Sifre=@Sifre", baglanti))
        {
            komut.Parameters.AddWithValue("@KullaniciAdi", kullaniciAdi);
            komut.Parameters.AddWithValue("@Sifre", sifre);
            baglanti.Open();

            using (SqlDataReader dr = komut.ExecuteReader())
            {
                if (!dr.Read())
                    return null;

                return new Kullanici(
                    (int)dr["KullaniciId"],
                    dr["KullaniciAdi"].ToString(),
                    dr["Sifre"].ToString()
                );
            }
        }
    }
}
