<%@ Page Title="Hakkımızda | Evussin Decoration" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Hakkimizda.aspx.cs" Inherits="Hakkimizda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Hakkımızda | Evussin Decoration
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-light py-5 mb-5 border-bottom">
        <div class="container text-center">
            <h1 class="text-primary-custom fw-bold">Hakkımızda</h1>
            <p class="lead text-muted">Biz kimiz, neler yapıyoruz ve dekorasyon felsefemiz nedir?</p>
        </div>
    </div>

    <div class="container py-4 mb-5">
        <div class="row align-items-center">
            <div class="col-md-6 mb-4 mb-md-0">
                <img src="resimler/hakkimizda.jpg" alt="Hakkımızda" class="img-fluid rounded shadow" />
            </div>
            <div class="col-md-6 px-md-5">
                <h2 class="text-accent mb-4 fw-bold">Evussin Decoration</h2>
                <p class="fs-5 text-muted mb-4">
                    Yılların verdiği tecrübe ile boya, tadilat ve iç mimarlık sektöründe müşteri memnuniyetini en üst düzeyde tutmayı hedefleyen profesyonel bir ekibiz. Amacımız, sadece mekanlarınızı değil, yaşam kalitenizi de güzelleştirmektir.
                </p>
                <div class="mb-4">
                    <h4 class="text-primary-custom fw-bold"><i class="bi bi-eye text-accent me-2"></i> Vizyonumuz</h4>
                    <p class="text-muted">Sektördeki yenilikleri yakından takip ederek, modern tasarımları en yüksek kalite standartlarında müşterilerimizle buluşturmak ve iç mimarlık denilince akla gelen ilk marka olmak.</p>
                </div>
                <div>
                    <h4 class="text-primary-custom fw-bold"><i class="bi bi-bullseye text-accent me-2"></i> Misyonumuz</h4>
                    <p class="text-muted">Her projeye sanatsal bir bakış açısıyla yaklaşıp, fonksiyonel ve estetik alanlar yaratarak zamanında ve eksiksiz teslimat garantisi sunmak.</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
