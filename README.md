# 🏠 Evussin Decoration - İç Mimarlık & Dekorasyon CMS Platformu

[![.NET Framework](https://img.shields.io/badge/.NET%20Framework-4.7.2-512BD4?logo=dotnet&logoColor=white)](https://dotnet.microsoft.com/)
[![ASP.NET](https://img.shields.io/badge/ASP.NET-Web%20Forms-blue?logo=windows)](https://dotnet.microsoft.com/apps/aspnet)
[![C#](https://img.shields.io/badge/Language-C%23-239120?logo=csharp&logoColor=white)](https://docs.microsoft.com/en-us/dotnet/csharp/)
[![Database](https://img.shields.io/badge/Database-MSSQL%20%7C%20LocalDB-CC292B?logo=microsoftsqlserver&logoColor=white)](https://www.microsoft.com/sql-server)
[![Bootstrap](https://img.shields.io/badge/UI-Bootstrap%205-7952B3?logo=bootstrap&logoColor=white)](https://getbootstrap.com/)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

**Evussin Decoration**, modern iç mimarlık, boya ve dekorasyon hizmetleri sunan işletmeler için tasarlanmış; hem ziyaretçilere yönelik dinamik bir vitrin hem de işletme sahiplerine yönelik güçlü bir **İçerik Yönetim Sistemi (CMS)** sunan kurumsal web uygulamasıdır.

---

## 🚀 Öne Çıkan Özellikler

### 🌐 Ziyaretçi Arayüzü (Public Web)
* **Dinamik Vitrin (Ana Sayfa):** Veritabanından yönetilen öne çıkan hizmetler, referanslar ve kurumsal bloklar.
* **Hizmet Kataloğu & Detay Sayfaları:** Zengin metin (HTML), galeri resimleri ve detay açıklamalarıyla zenginleştirilmiş dinamik hizmet sayfaları (`HizmetDetay.aspx?id=X`).
* **İletişim & Talep Formu:** Ziyaretçilerin doğrudan panel yöneticisine mesaj ve teklif talebi iletebildiği, veritabanı kayıtlı dinamik iletişim altyapısı.
* **Modern & Mobil Uyumlu Tasarım:** Bootstrap 5 ve özel CSS bileşenleri ile tüm cihazlarda kusursuz çalışan responsive arayüz.

### 🛡️ Yönetim Paneli (Admin CMS)
* **Yetkilendirme & Güvenlik:** Güvenli oturum (Session) kontrolü ve korumalı admin rotaları.
* **Hizmet Yönetimi (Full CRUD):**
  * Yeni hizmet ekleme, düzenleme, silme ve aktif/pasif durum geçişi.
  * **Zengin Metin Editörü:** Summernote WYSIWYG entegrasyonu ile zengin içerik biçimlendirme.
  * **Akıllı Dosya/Görsel Yükleme:** Benzersiz GUID dosya isimlendirmesi ve uzantı filtrelemeli görsel yönetim motoru.
* **Mesaj Yönetim Merkezi:** Gelen müşteri mesajlarını listeleme, detay modalı ile okuma, okundu işaretleme ve silme.

---

## 🏗️ Mimari ve Tasarım Desenleri

Proje, kurumsal yazılım standartlarına uygun **3 Katmanlı (N-Tier)** ve **Nesne Yönelimli Programlama (OOP)** mimarisiyle geliştirilmiştir:

```text
EvussinDecoration/
├── App_Code/
│   ├── Model/                 # Varlık (Entity / DTO) Modelleri
│   │   ├── Hizmet.cs          # Encapsulation & Hizmet veri modeli
│   │   ├── Kullanici.cs       # Yönetici kullanıcı modeli
│   │   └── Mesaj.cs           # Ziyaretçi mesaj modeli
│   ├── Veri/                  # Veri Erişim Katmanı (DAL - Data Access Layer)
│   │   ├── Db.cs              # Merkezi veritabanı bağlantı yönetimi
│   │   ├── HizmetIslemleri.cs # Parametrik SQL ile güvenli Hizmet CRUD
│   │   ├── KullaniciIslemleri.cs # Giriş ve kimlik doğrulama işlemleri
│   │   └── MesajIslemleri.cs  # Mesaj listeleme, silme, okundu operasyonları
│   └── Yardimci/              # Yardımcı Fonksiyonlar & Güvenlik
│       ├── AdminGuvenlik.cs   # Session & Giriş kontrol motoru
│       └── DosyaYukleme.cs    # Güvenli görsel yükleme servisi
├── Admin/                     # Yönetim Paneli Sayfaları ve Admin.master
├── App_Data/                  # SQL Veritabanı Scripti (EvussinDB.sql) & LocalDB
├── resimler/                  # Yüklenen içerik ve hizmet görselleri
├── Default.aspx               # Ana Sayfa
├── Hizmetler.aspx             # Tüm Hizmetler Kataloğu
├── HizmetDetay.aspx           # Dinamik Hizmet Detayı
├── Iletisim.aspx              # İletişim & Mesaj Formu
├── Site.master                # Ortak Master Page Şablonu
└── Web.config                 # Uygulama ve Bağlantı Ayarları
```

### 🔒 Güvenlik Yaklaşımı
* **SQL Injection Koruması:** Tüm veritabanı sorguları `SqlCommand` ve `SqlParameter` kullanılarak parametrik şekilde çalıştırılır.
* **XSS ve Giriş Doğrulaması:** Giriş alanlarında XSS saldırılarına karşı HTML Encoding ve sanitization uygulanmıştır.
* **Oturum İzolasyonu:** `AdminGuvenlik.GirisGerekli()` metoduyla her admin sayfası yüklenişinde yetki doğrulaması yapılır.

---

## 💾 Veritabanı Şeması

```sql
-- Kullanıcı Tablosu
Tbl_Kullanici (KullaniciId, KullaniciAdi, Sifre)

-- Hizmet Tablosu
Tbl_Hizmet (HizmetId, HizmetBaslik, HizmetOzet, HizmetDetay, HizmetResim, AktifMi)

-- İletişim Mesajları Tablosu
Tbl_Mesaj (MesajId, AdSoyad, Email, MesajMetni, Tarih, OkunduMu)
```

---

## ⚙️ Kurulum ve Çalıştırma Adımları

Projeyi yerel ortamınızda çalıştırmak için aşağıdaki adımları izleyebilirsiniz:

### Gereksinimler
* [Visual Studio](https://visualstudio.microsoft.com/) (2019, 2022 veya güncel sürüm)
* .NET Framework 4.7.2 veya üzeri
* MSSQL LocalDB veya Microsoft SQL Server

### Adım Adım Kurulum:
1. **Repoyu Klonlayın:**
   ```bash
   git clone https://github.com/harunkml/EvussinDecorationCms.git
   ```
2. **Visual Studio ile Açın:**
   * Visual Studio'yu açın.
   * `File -> Open -> Web Site...` menüsünden `EvussinDecoration` klasörünü seçin.
3. **Veritabanını Hazırlayın:**
   * **Seçenek A (LocalDB - Önerilen):** 
     * Solution Explorer'da `App_Data` klasörüne sağ tıklayıp `Add -> New Item -> SQL Server Database` seçerek `EvussinProjectDB.mdf` dosyasını oluşturun.
     * `App_Data/EvussinDB.sql` dosyasını açıp veritabanı üzerinde çalıştırın (`Execute`).
   * **Seçenek B (SQL Server / SQLEXPRESS):**
     * SQL Server Management Studio (SSMS) üzerinde `EvussinDB` adında bir veritabanı oluşturun ve `EvussinDB.sql` scriptini çalıştırın.
     * `Web.config` dosyasındaki `connectionStrings` bölümünü kendi SQL Server instance adınıza göre düzenleyin.
4. **Çalıştırın:**
   * `F5` veya `Ctrl + F5` tuşuna basarak IIS Express üzerinde projeyi başlatın.

### 🔑 Varsayılan Yönetici Giriş Bilgileri
* **Giriş URL'i:** `/Admin/Login.aspx`
* **Kullanıcı Adı:** `admin`
* **Şifre:** `123456`

---

## 🛠️ Kullanılan Teknolojiler & Kütüphaneler

| Teknoloji / Kütüphane | Kullanım Amacı |
|---|---|
| **C# (.NET Framework 4.7.2)** | Backend iş mantığı ve nesne yönelimli mimari |
| **ASP.NET Web Forms** | Sunucu taraflı sayfa ve bileşen yaşam döngüsü |
| **MSSQL (LocalDB / T-SQL)** | İlişkisel veritabanı ve veri kalıcılığı |
| **ADO.NET** | Yüksek performanslı ve parametrik veri erişimi |
| **Bootstrap 5** | Responsive ve modern UI grid yapısı |
| **Bootstrap Icons** | Vektörel arayüz ikonları |
| **Summernote** | Admin paneli için WYSIWYG HTML zengin metin editörü |
| **jQuery** | DOM manipülasyonu ve modal yönetimi |

---

## 📄 Lisans

Bu proje [MIT](LICENSE) lisansı altında sunulmaktadır.
