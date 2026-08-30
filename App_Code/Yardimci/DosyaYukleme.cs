using System;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

public static class DosyaYukleme
{
    public static string ResimYukle(FileUpload fileUpload, string klasorYolu)
    {
        if (!fileUpload.HasFile)
            return null;

        string dosyaUzantisi = Path.GetExtension(fileUpload.FileName).ToLower();
        string[] gecerliUzantiListesi = { ".jpg", ".jpeg", ".png", ".gif" };

        if (Array.IndexOf(gecerliUzantiListesi, dosyaUzantisi) == -1)
            return null;

        string yeniDosyaAdi = Guid.NewGuid().ToString() + dosyaUzantisi;
        string tamYol = HttpContext.Current.Server.MapPath("~/" + klasorYolu + "/" + yeniDosyaAdi);

        try
        {
            fileUpload.SaveAs(tamYol);
            return klasorYolu + "/" + yeniDosyaAdi;
        }
        catch
        {
            return null;
        }
    }
}
