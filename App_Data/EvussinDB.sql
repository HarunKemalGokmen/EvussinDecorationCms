CREATE TABLE Tbl_Kullanici (
    KullaniciId INT IDENTITY(1,1) PRIMARY KEY,
    KullaniciAdi NVARCHAR(50) NOT NULL,
    Sifre NVARCHAR(50) NOT NULL
);

CREATE TABLE Tbl_Hizmet (
    HizmetId INT IDENTITY(1,1) PRIMARY KEY,
    HizmetBaslik NVARCHAR(200) NOT NULL,
    HizmetOzet NVARCHAR(500) NOT NULL,
    HizmetDetay NVARCHAR(MAX) NOT NULL,
    HizmetResim NVARCHAR(250),
    AktifMi BIT NOT NULL DEFAULT 1
);

CREATE TABLE Tbl_Mesaj (
    MesajId INT IDENTITY(1,1) PRIMARY KEY,
    AdSoyad NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    MesajMetni NVARCHAR(MAX) NOT NULL,
    Tarih DATETIME NOT NULL DEFAULT GETDATE(),
    OkunduMu BIT NOT NULL DEFAULT 0
);

INSERT INTO Tbl_Kullanici (KullaniciAdi, Sifre) VALUES ('admin', '123456');

INSERT INTO Tbl_Hizmet (HizmetBaslik, HizmetOzet, HizmetDetay, HizmetResim, AktifMi) VALUES (N'Salon Duvar Kağıdı ve Boya Uygulaması', N'Salonlarınıza yeni bir karakter kazandırmak için profesyonel boya ve duvar kağıdı uygulamaları gerçekleştiriyoruz.', N'<p>Salon dekorasyonunda renk seçimi, yüzey hazırlığı, kaliteli boya uygulamaları ve modern duvar kağıdı çözümleri sunuyoruz. Mekânın ışık yapısına ve dekorasyon tarzına uygun öneriler geliştirerek daha ferah, şık ve davetkâr yaşam alanları oluşturuyoruz. Kusursuz işçilik anlayışımızla duvarlarınızı estetik bir görünüme kavuşturuyoruz.</p>', N'resimler/e59351f2-9429-44d5-94fc-2d6e686e0720.png', 1);
INSERT INTO Tbl_Hizmet (HizmetBaslik, HizmetOzet, HizmetDetay, HizmetResim, AktifMi) VALUES (N'Komple Mutfak Yenileme ve Tadilat', N'Mutfaklarınızı modern, ergonomik ve estetik çözümlerle baştan sona yenileyerek yaşam alanlarınıza değer katıyoruz.', N'<p>Dolap değişiminden tezgâh uygulamalarına, seramik döşemelerden tesisat düzenlemelerine kadar mutfağınızın tüm yenileme süreçlerini profesyonel olarak yönetiyoruz. Kullanım alışkanlıklarınızı dikkate alarak hem şık hem de işlevsel mutfaklar tasarlıyor, kaliteli malzemeler ve titiz işçilikle projelerinizi zamanında teslim ediyoruz.</p>', N'resimler/49fac21c-4ffd-4f50-a920-204463c4f962.png', 1);
INSERT INTO Tbl_Hizmet (HizmetBaslik, HizmetOzet, HizmetDetay, HizmetResim, AktifMi) VALUES (N'Banyo Fayans ve Dekorasyon Çözümleri', N'Modern tasarım anlayışı ve kaliteli işçilikle banyolarınızı daha şık, kullanışlı ve konforlu yaşam alanlarına dönüştürüyoruz.', N'<p data-start="241" data-end="624">Banyo yenileme projelerinde fayans döşeme, duş alanı düzenlemeleri, lavabo ve dolap montajları, aydınlatma çözümleri ve dekoratif uygulamalar sunuyoruz. Mekânın ölçülerine ve ihtiyaçlarınıza uygun tasarımlar geliştirerek estetik ve fonksiyonelliği bir araya getiriyoruz. Suya ve neme dayanıklı malzemeler kullanarak uzun ömürlü ve modern banyolar oluşturuyoruz</p><p><br></p>', N'resimler/d916cdb1-cb1d-47c8-9fec-75254b787034.png', 1);

INSERT INTO Tbl_Mesaj (AdSoyad, Email, MesajMetni, Tarih, OkunduMu) VALUES (N'Arda Yılmaz', N'ardayilmaz@gmail.com', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In cursus odio magna, sit amet tempus ante rutrum sit amet. Aenean risus purus, ultricies et risus eget, fermentum mattis turpis. Pellentesque mattis, dolor bibendum gravida dapibus, massa ex vulputate arcu, sit amet vestibulum lorem eros sed odio. Quisque consequat justo nec.', '2026-06-18 15:43:24', 0);
