<%@ Page Title="Hizmetlerimiz | Evussin Decoration" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="Hizmetler.aspx.cs" Inherits="Hizmetler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Hizmetlerimiz | Evussin Decoration
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="bg-light py-5 mb-5 border-bottom">
        <div class="container text-center">
            <h1 class="text-primary-custom fw-bold">Tüm Hizmetlerimiz</h1>
            <p class="lead text-muted">Boya, tadilat ve dekorasyon alanında sunduğumuz profesyonel çözümleri inceleyin.</p>
        </div>
    </div>

    <div class="container mb-5">
        <div class="row">
            <asp:Repeater ID="rptHizmetler" runat="server">
                <ItemTemplate>
                    <div class="col-md-4 mb-4">
                        <div class="card h-100 shadow-sm border-0 bg-light">
                            <img src='<%# string.IsNullOrEmpty(Eval("HizmetResim").ToString()) ? "https://via.placeholder.com/400x250?text=Evussin+Decoration" : Eval("HizmetResim") %>' class="card-img-top" alt="Hizmet">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title text-accent fw-bold"><%# Eval("HizmetBaslik") %></h5>
                                <p class="card-text flex-grow-1"><%# Eval("HizmetOzet") %></p>
                                <a href='HizmetDetay.aspx?id=<%# Eval("HizmetId") %>' class="btn btn-primary bg-primary-custom border-0 mt-auto">Detayları Gör</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
