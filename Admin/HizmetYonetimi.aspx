<%@ Page Title="Hizmet Yönetimi" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="HizmetYonetimi.aspx.cs" Inherits="Admin_HizmetYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="text-primary-custom mb-0">Hizmet Yönetimi</h3>
        <a href="HizmetEkleDuzenle.aspx" class="btn btn-accent"><i class="bi bi-plus-circle me-1"></i> Yeni Hizmet Ekle</a>
    </div>

    <div class="card shadow-sm border-0">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0 align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>Resim</th>
                            <th>Başlık</th>
                            <th>Durum</th>
                            <th class="text-end">İşlemler</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptHizmetler" runat="server" OnItemCommand="rptHizmetler_ItemCommand">
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("HizmetId") %></td>
                                    <td>
                                        <img src='<%# string.IsNullOrEmpty(Eval("HizmetResim").ToString()) ? "https://via.placeholder.com/50" : "../" + Eval("HizmetResim") %>' alt="Resim" class="rounded" style="width:50px; height:50px; object-fit:cover;" />
                                    </td>
                                    <td class="fw-bold"><%# Eval("HizmetBaslik") %></td>
                                    <td>
                                        <%# (bool)Eval("AktifMi") ? "<span class='badge bg-success'>Aktif</span>" : "<span class='badge bg-danger'>Pasif</span>" %>
                                    </td>
                                    <td class="text-end">
                                        <a href='HizmetEkleDuzenle.aspx?id=<%# Eval("HizmetId") %>' class="btn btn-sm btn-outline-primary"><i class="bi bi-pencil"></i> Düzenle</a>
                                        <asp:LinkButton ID="btnSil" runat="server" CommandName="Sil" CommandArgument='<%# Eval("HizmetId") %>' CssClass="btn btn-sm btn-outline-danger ms-1" OnClientClick="return confirm('Bu hizmeti silmek istediğinize emin misiniz?');"><i class="bi bi-trash"></i> Sil</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
            <asp:Panel ID="pnlYok" runat="server" Visible="false" CssClass="p-4 text-center text-muted">
                Kayıtlı hizmet bulunmamaktadır.
            </asp:Panel>
        </div>
    </div>
</asp:Content>
