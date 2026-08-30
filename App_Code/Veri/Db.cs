using System.Configuration;

public static class Db
{
    public static string BaglantiCumlesi
    {
        get
        {
            return ConfigurationManager.ConnectionStrings["baglanti"].ConnectionString;
        }
    }
}
