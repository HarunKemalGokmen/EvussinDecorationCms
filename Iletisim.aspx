<%@ Page Title="İletişim | Evussin Decoration" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Iletisim.aspx.cs" Inherits="Iletisim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    İletişim | Evussin Decoration
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-light py-5 mb-5 border-bottom">
        <div class="container text-center">
            <h1 class="text-primary-custom fw-bold">İletişim</h1>
            <p class="lead text-muted">Projeleriniz için fiyat teklifi alın veya sorularınızı bize iletin.</p>
        </div>
    </div>

    <div class="container mb-5">
        <div class="row">
            <div class="col-md-5 mb-4">
                <div class="bg-white p-4 rounded shadow-sm h-100 border">
                    <h3 class="text-accent mb-4 fw-bold">Bize Ulaşın</h3>
                    <ul class="list-unstyled fs-5 mb-4 text-muted">
                        <li class="mb-3"><strong>Adres:</strong><br />Alkent 2000 Mah. Yiğittürk Bulvarı No:5,<br />34500 Büyükçekmece / İstanbul</li>
                        <li class="mb-3"><strong>Telefon:</strong><br />0555 555 55 55</li>
                        <li class="mb-3"><strong>E-Posta:</strong><br />info@evussindecoration.com</li>
                    </ul>
                    
                    <div class="ratio ratio-4x3 mt-4">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3007.0109781080464!2d28.618085876183564!3d41.0906067713392!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14b55900b555b9c7%3A0x9dd3c3dad71874fa!2zxLBzdGFuYnVsIMOcbml2ZXJzaXRlc2ktQ2VycmFocGHFn2EgQsO8ecO8a8OnZWttZWNlIFllcmxlxZ9rZXNp!5e0!3m2!1str!2str!4v1781775314114!5m2!1str!2str" 
                            style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" class="rounded w-100 h-100"></iframe>
                    </div>
                </div>
            </div>

            <div class="col-md-7 mb-4">
                <div class="bg-white p-4 rounded shadow-sm h-100 border">
                    <h3 class="text-primary-custom mb-4 fw-bold">Mesaj Gönderin</h3>
                    
                    <asp:Panel ID="pnlBasarili" runat="server" Visible="false" CssClass="alert alert-success d-flex align-items-center">
                        <div>Mesajınız başarıyla iletildi. En kısa sürede sizinle iletişime geçeceğiz.</div>
                    </asp:Panel>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Ad Soyad</label>
                        <asp:TextBox ID="txtAdSoyad" runat="server" CssClass="form-control form-control-lg" required="required"></asp:TextBox>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">E-Posta Adresiniz</label>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control form-control-lg" required="required"></asp:TextBox>
                    </div>
                    
                    <div class="mb-4">
                        <label class="form-label fw-bold">Mesajınız</label>
                        <asp:TextBox ID="txtMesajMetni" runat="server" TextMode="MultiLine" Rows="6" CssClass="form-control form-control-lg" required="required"></asp:TextBox>
                    </div>
                    
                    <div class="d-grid">
                        <asp:Button ID="btnGonder" runat="server" Text="Mesajı Gönder" CssClass="btn btn-accent btn-lg" OnClick="btnGonder_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
