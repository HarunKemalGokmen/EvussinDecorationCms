using System;
using System.Collections.Generic;
using System.Data.SqlClient;

public class HizmetIslemleri
{
    public List<Hizmet> AktifHizmetleriGetir()
    {
        return ListeGetir("SELECT HizmetId, HizmetBaslik, HizmetOzet, HizmetDetay, HizmetResim, AktifMi FROM Tbl_Hizmet WHERE AktifMi=1 ORDER BY HizmetId DESC");
    }

    public List<Hizmet> TumHizmetleriGetir()
    {
        return ListeGetir("SELECT HizmetId, HizmetBaslik, HizmetOzet, HizmetDetay, HizmetResim, AktifMi FROM Tbl_Hizmet ORDER BY HizmetId DESC");
    }

    private List<Hizmet> ListeGetir(string sql)
    {
        List<Hizmet> hizmetler = new List<Hizmet>();

        using (SqlConnection baglanti = new SqlConnection(Db.BaglantiCumlesi))
        using (SqlCommand komut = new SqlCommand(sql, baglanti))
        {
            baglanti.Open();

            using (SqlDataReader dr = komut.ExecuteReader())
            {
                while (dr.Read())
                {
                    hizmetler.Add(OkuyucudanHizmetOlustur(dr));
                }
            }
        }

        return hizmetler;
    }

    public Hizmet IdYeGoreHizmetGetir(int id)
    {
        using (SqlConnection baglanti = new SqlConnection(Db.BaglantiCumlesi))
        using (SqlCommand komut = new SqlCommand("SELECT HizmetId, HizmetBaslik, HizmetOzet, HizmetDetay, HizmetResim, AktifMi FROM Tbl_Hizmet WHERE HizmetId=@HizmetId", baglanti))
        {
            komut.Parameters.AddWithValue("@HizmetId", id);
            baglanti.Open();

            using (SqlDataReader dr = komut.ExecuteReader())
            {
                if (!dr.Read())
                    return null;

                return OkuyucudanHizmetOlustur(dr);
            }
        }
    }

    public int HizmetEkle(Hizmet hizmet)
    {
        using (SqlConnection baglanti = new SqlConnection(Db.BaglantiCumlesi))
        using (SqlCommand komut = new SqlCommand(@"INSERT INTO Tbl_Hizmet
                                                  (HizmetBaslik, HizmetOzet, HizmetDetay, HizmetResim, AktifMi)
                                                  VALUES
                                                  (@HizmetBaslik, @HizmetOzet, @HizmetDetay, @HizmetResim, @AktifMi);
                                                  SELECT SCOPE_IDENTITY();", baglanti))
        {
            ParametreleriEkle(komut, hizmet);
            baglanti.Open();
            return Convert.ToInt32(komut.ExecuteScalar());
        }
    }

    public void HizmetGuncelle(Hizmet hizmet)
    {
        using (SqlConnection baglanti = new SqlConnection(Db.BaglantiCumlesi))
        using (SqlCommand komut = new SqlCommand(@"UPDATE Tbl_Hizmet
                                                  SET HizmetBaslik=@HizmetBaslik,
                                                      HizmetOzet=@HizmetOzet,
                                                      HizmetDetay=@HizmetDetay,
                                                      HizmetResim=@HizmetResim,
                                                      AktifMi=@AktifMi
                                                  WHERE HizmetId=@HizmetId", baglanti))
        {
            ParametreleriEkle(komut, hizmet);
            komut.Parameters.AddWithValue("@HizmetId", hizmet.HizmetId);

            baglanti.Open();
            komut.ExecuteNonQuery();
        }
    }

    public void HizmetSil(int id)
    {
        using (SqlConnection baglanti = new SqlConnection(Db.BaglantiCumlesi))
        using (SqlCommand komut = new SqlCommand("DELETE FROM Tbl_Hizmet WHERE HizmetId=@HizmetId", baglanti))
        {
            komut.Parameters.AddWithValue("@HizmetId", id);
            baglanti.Open();
            komut.ExecuteNonQuery();
        }
    }

    private void ParametreleriEkle(SqlCommand komut, Hizmet hizmet)
    {
        komut.Parameters.AddWithValue("@HizmetBaslik", hizmet.HizmetBaslik);
        komut.Parameters.AddWithValue("@HizmetOzet", hizmet.HizmetOzet);
        komut.Parameters.AddWithValue("@HizmetDetay", hizmet.HizmetDetay);
        komut.Parameters.AddWithValue("@HizmetResim", hizmet.HizmetResim ?? (object)DBNull.Value);
        komut.Parameters.AddWithValue("@AktifMi", hizmet.AktifMi);
    }

    private Hizmet OkuyucudanHizmetOlustur(SqlDataReader dr)
    {
        return new Hizmet(
            (int)dr["HizmetId"],
            dr["HizmetBaslik"].ToString(),
            dr["HizmetOzet"].ToString(),
            dr["HizmetDetay"].ToString(),
            dr["HizmetResim"] != DBNull.Value ? dr["HizmetResim"].ToString() : "",
            (bool)dr["AktifMi"]);
    }
}
