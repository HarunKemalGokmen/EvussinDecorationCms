using System;
using System.Collections.Generic;
using System.Data.SqlClient;

public class MesajIslemleri
{
    public int MesajEkle(Mesaj mesaj)
    {
        using (SqlConnection baglanti = new SqlConnection(Db.BaglantiCumlesi))
        using (SqlCommand komut = new SqlCommand(@"INSERT INTO Tbl_Mesaj
                                                  (AdSoyad, Email, MesajMetni, Tarih, OkunduMu)
                                                  VALUES
                                                  (@AdSoyad, @Email, @MesajMetni, @Tarih, @OkunduMu);
                                                  SELECT SCOPE_IDENTITY();", baglanti))
        {
            komut.Parameters.AddWithValue("@AdSoyad", mesaj.AdSoyad);
            komut.Parameters.AddWithValue("@Email", mesaj.Email);
            komut.Parameters.AddWithValue("@MesajMetni", mesaj.MesajMetni);
            komut.Parameters.AddWithValue("@Tarih", mesaj.Tarih == DateTime.MinValue ? DateTime.Now : mesaj.Tarih);
            komut.Parameters.AddWithValue("@OkunduMu", mesaj.OkunduMu);

            baglanti.Open();
            return Convert.ToInt32(komut.ExecuteScalar());
        }
    }

    public List<Mesaj> MesajlariGetir()
    {
        List<Mesaj> mesajlar = new List<Mesaj>();

        using (SqlConnection baglanti = new SqlConnection(Db.BaglantiCumlesi))
        using (SqlCommand komut = new SqlCommand("SELECT MesajId, AdSoyad, Email, MesajMetni, Tarih, OkunduMu FROM Tbl_Mesaj ORDER BY Tarih DESC", baglanti))
        {
            baglanti.Open();

            using (SqlDataReader dr = komut.ExecuteReader())
            {
                while (dr.Read())
                {
                    mesajlar.Add(OkuyucudanMesajOlustur(dr));
                }
            }
        }

        return mesajlar;
    }

    public void MesajiOkunduIsaretle(int id)
    {
        using (SqlConnection baglanti = new SqlConnection(Db.BaglantiCumlesi))
        using (SqlCommand komut = new SqlCommand("UPDATE Tbl_Mesaj SET OkunduMu=1 WHERE MesajId=@MesajId", baglanti))
        {
            komut.Parameters.AddWithValue("@MesajId", id);
            baglanti.Open();
            komut.ExecuteNonQuery();
        }
    }

    public void MesajSil(int id)
    {
        using (SqlConnection baglanti = new SqlConnection(Db.BaglantiCumlesi))
        using (SqlCommand komut = new SqlCommand("DELETE FROM Tbl_Mesaj WHERE MesajId=@MesajId", baglanti))
        {
            komut.Parameters.AddWithValue("@MesajId", id);
            baglanti.Open();
            komut.ExecuteNonQuery();
        }
    }

    private Mesaj OkuyucudanMesajOlustur(SqlDataReader dr)
    {
        return new Mesaj(
            (int)dr["MesajId"],
            dr["AdSoyad"].ToString(),
            dr["Email"].ToString(),
            dr["MesajMetni"].ToString(),
            (DateTime)dr["Tarih"],
            (bool)dr["OkunduMu"]);
    }
}
