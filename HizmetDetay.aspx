<%@ Page Title="Hizmet Detayı | Evussin Decoration" Language="C#" MasterPageFile="Site.master" AutoEventWireup="true" CodeFile="HizmetDetay.aspx.cs" Inherits="HizmetDetay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Hizmet Detayı | Evussin Decoration
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-5">
        <asp:Panel ID="pnlHata" runat="server" Visible="false" CssClass="alert alert-danger">
            <asp:Literal ID="ltrHata" runat="server"></asp:Literal>
        </asp:Panel>

        <asp:Panel ID="pnlIcerik" runat="server">
            <div class="row">
                <div class="col-lg-8 mx-auto">
                    <h1 class="text-primary-custom mb-4 fw-bold"><asp:Label ID="lblBaslik" runat="server"></asp:Label></h1>
                    <asp:Image ID="imgHizmet" runat="server" CssClass="img-fluid rounded shadow-sm mb-4 w-100" />
                    <div class="lead mb-4 text-muted border-start border-4 border-warning ps-3">
                        <asp:Label ID="lblOzet" runat="server"></asp:Label>
                    </div>
                    <div class="content-text fs-5">
                        <asp:Literal ID="ltrDetay" runat="server"></asp:Literal>
                    </div>
                    <div class="mt-5 text-center">
                        <a href="Iletisim.aspx" class="btn btn-accent btn-lg">Bu Hizmet İçin Fiyat Alın</a>
                        <a href="Hizmetler.aspx" class="btn btn-outline-secondary btn-lg ms-2">Hizmetlere Dön</a>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
