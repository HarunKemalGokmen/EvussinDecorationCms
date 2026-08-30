<%@ Page Title="Hizmet Formu" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="HizmetEkleDuzenle.aspx.cs" Inherits="Admin_HizmetEkleDuzenle" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- Summernote Lite CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="text-primary-custom mb-0"><asp:Literal ID="ltrSayfaBaslik" runat="server">Yeni Hizmet Ekle</asp:Literal></h3>
        <a href="HizmetYonetimi.aspx" class="btn btn-outline-secondary"><i class="bi bi-arrow-left"></i> Listeye Dön</a>
    </div>

    <asp:Panel ID="pnlBilgi" runat="server" Visible="false" CssClass="alert alert-success mb-4 shadow-sm">
        İşlem başarıyla tamamlandı.
    </asp:Panel>

    <div class="row g-4">
        <!-- Sol Sütun: Form Alanları -->
        <div class="col-md-8">
            <div class="card shadow-sm border-0 h-100">
                <div class="card-body p-4">
                    <h5 class="card-title text-accent border-bottom pb-2 mb-4">Hizmet Detayları</h5>
                    
                    <div class="mb-4">
                        <label class="form-label fw-bold">Hizmet Başlığı</label>
                        <asp:TextBox ID="txtBaslik" runat="server" CssClass="form-control form-control-lg" required="required" placeholder="Örn: İç Mimarlık ve Dekorasyon"></asp:TextBox>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold">Kısa Özet</label>
                        <asp:TextBox ID="txtOzet" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" required="required" placeholder="Hizmetin vitrinde görünecek kısa özeti..."></asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Detaylı İçerik</label>
                        <asp:TextBox ID="txtDetay" runat="server" TextMode="MultiLine" Rows="10" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sağ Sütun: Ayarlar ve Resim -->
        <div class="col-md-4">
            <!-- Durum Kartı -->
            <div class="card shadow-sm border-0 mb-4">
                <div class="card-body p-4">
                    <h5 class="card-title text-accent border-bottom pb-2 mb-4">Yayın Durumu</h5>
                    <div class="form-check form-switch fs-5">
                        <input type="checkbox" id="chkAktif" runat="server" class="form-check-input" role="switch" checked="checked" />
                        <label class="form-check-label" for="chkAktif">Sitede Yayınla (Aktif)</label>
                    </div>
                    <div class="form-text mt-2">Bu hizmet ziyaretçiler tarafından görülebilsin mi?</div>
                </div>
            </div>

            <!-- Resim Kartı -->
            <div class="card shadow-sm border-0 mb-4">
                <div class="card-body p-4">
                    <h5 class="card-title text-accent border-bottom pb-2 mb-4">Hizmet Resmi</h5>
                    
                    <asp:Panel ID="pnlMevcutResim" runat="server" Visible="false" CssClass="mb-4 text-center">
                        <div class="small fw-bold text-muted mb-2">Mevcut Resim:</div>
                        <asp:Image ID="imgMevcut" runat="server" CssClass="img-fluid rounded border shadow-sm" style="max-height: 200px; object-fit: cover;" />
                    </asp:Panel>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold small text-muted">Yeni Resim Seç</label>
                        <asp:FileUpload ID="fuResim" runat="server" CssClass="form-control" />
                        <div class="form-text">JPG, PNG veya GIF. (Yeni resim seçilmezse eski resim korunur)</div>
                    </div>
                </div>
            </div>

            <div class="d-grid mt-4">
                <asp:Button ID="btnKaydet" runat="server" Text="Değişiklikleri Kaydet" CssClass="btn btn-accent btn-lg shadow" OnClick="btnKaydet_Click" />
            </div>
        </div>
    </div>

    <!-- Summernote Initialization -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#<%= txtDetay.ClientID %>').summernote({
                height: 300,
                placeholder: 'Buraya hizmetinizle ilgili detayları yazabilirsiniz...',
                toolbar: [
                    ['style', ['style']],
                    ['font', ['bold', 'italic', 'underline', 'clear']],
                    ['para', ['ul', 'ol', 'paragraph']],
                    ['insert', ['link']],
                    ['view', ['fullscreen', 'codeview']]
                ]
            });
        });
    </script>
</asp:Content>
