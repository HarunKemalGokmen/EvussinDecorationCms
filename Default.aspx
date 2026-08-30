<%@ Page Title="Ana Sayfa | Evussin Decoration" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Ana Sayfa | Evussin Decoration
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-primary-custom text-white text-center py-5 mb-5">
        <div class="container py-5">
            <h1 class="display-4 fw-bold">Hayalinizdeki Mekanları Tasarlıyoruz</h1>
            <p class="lead mb-4">Boya, tadilat ve iç mimarlıkta yılların tecrübesiyle yaşam alanlarınızı yeniliyoruz.</p>
            <a href="Hizmetler.aspx" class="btn btn-accent btn-lg px-4">Hizmetlerimizi İnceleyin</a>
        </div>
    </div>

    <div class="container mb-5">
        <div class="row text-center">
            <div class="col-md-4 mb-4">
                <div class="p-4 border rounded shadow-sm h-100">
                    <h3 class="text-primary-custom">Uzman Ekip</h3>
                    <p>Alanında uzman iç mimar ve ustalarımızla en kaliteli hizmeti sunuyoruz.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="p-4 border rounded shadow-sm h-100 bg-light">
                    <h3 class="text-accent">Zamanında Teslim</h3>
                    <p>Projelerinizi söz verdiğimiz tarihte, eksiksiz olarak teslim ediyoruz.</p>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="p-4 border rounded shadow-sm h-100">
                    <h3 class="text-primary-custom">Kaliteli Malzeme</h3>
                    <p>Projelerimizde her zaman birinci sınıf kalite malzemeler kullanıyoruz.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <h2 class="text-center text-primary-custom mb-4">Öne Çıkan Hizmetlerimiz</h2>
        <div class="row">
            <asp:Repeater ID="rptHizmetler" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 shadow-sm border-0 bg-light">
                            <img src='<%# string.IsNullOrEmpty(Eval("HizmetResim").ToString()) ? "https://via.placeholder.com/400x250?text=Evussin+Decoration" : Eval("HizmetResim") %>' class="card-img-top" alt="Hizmet">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title text-primary-custom fw-bold"><%# Eval("HizmetBaslik") %></h5>
                                <p class="card-text flex-grow-1"><%# Eval("HizmetOzet") %></p>
                                <a href='HizmetDetay.aspx?id=<%# Eval("HizmetId") %>' class="btn btn-outline-secondary mt-auto">Detayları Gör</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="text-center mt-3">
            <a href="Hizmetler.aspx" class="btn btn-primary bg-primary-custom border-0">Tüm Hizmetleri Gör</a>
        </div>
    </div>
</asp:Content>
