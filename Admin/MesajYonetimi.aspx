<%@ Page Title="Gelen Mesajlar" Language="C#" MasterPageFile="Admin.master" AutoEventWireup="true" CodeFile="MesajYonetimi.aspx.cs" Inherits="Admin_MesajYonetimi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .mesaj-okunmadi {
            font-weight: bold;
            background-color: #fff3cd !important;
        }
        .mesaj-okundu {
            color: #6c757d;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="text-primary-custom mb-0">Gelen Mesajlar</h3>
    </div>

    <div class="card shadow-sm border-0">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0 align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Tarih</th>
                            <th>Gönderen</th>
                            <th>E-Posta</th>
                            <th>Mesaj</th>
                            <th class="text-end">İşlemler</th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptMesajlar" runat="server" OnItemCommand="rptMesajlar_ItemCommand">
                            <ItemTemplate>
                                <tr class='<%# (bool)Eval("OkunduMu") ? "mesaj-okundu" : "mesaj-okunmadi" %>'>
                                    <td style="white-space:nowrap;"><%# Eval("Tarih", "{0:dd.MM.yyyy HH:mm}") %></td>
                                    <td><%# Eval("AdSoyad") %></td>
                                    <td><a href='mailto:<%# Eval("Email") %>' class="text-decoration-none"><%# Eval("Email") %></a></td>
                                    <td><%# Eval("MesajMetni").ToString().Length > 50 ? Eval("MesajMetni").ToString().Substring(0, 50) + "..." : Eval("MesajMetni") %></td>
                                    <td class="text-end" style="white-space:nowrap;">
                                        <button type="button" class="btn btn-sm btn-outline-info me-1" 
                                            data-bs-toggle="modal" 
                                            data-bs-target="#mesajModal" 
                                            data-gonderen='<%# Eval("AdSoyad") %>' 
                                            data-email='<%# Eval("Email") %>' 
                                            data-tarih='<%# Eval("Tarih", "{0:dd.MM.yyyy HH:mm}") %>' 
                                            data-mesaj='<%# HttpUtility.HtmlEncode(Eval("MesajMetni").ToString()) %>' 
                                            onclick="mesajGoster(this)">
                                            <i class="bi bi-eye"></i> Oku
                                        </button>
                                        <asp:LinkButton ID="btnOkundu" runat="server" CommandName="Okundu" CommandArgument='<%# Eval("MesajId") %>' CssClass="btn btn-sm btn-outline-success" Visible='<%# !(bool)Eval("OkunduMu") %>'><i class="bi bi-check2-all"></i> Okundu</asp:LinkButton>
                                        <asp:LinkButton ID="btnSil" runat="server" CommandName="Sil" CommandArgument='<%# Eval("MesajId") %>' CssClass="btn btn-sm btn-outline-danger ms-1" OnClientClick="return confirm('Bu mesajı kalıcı olarak silmek istediğinize emin misiniz?');"><i class="bi bi-trash"></i> Sil</asp:LinkButton>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
            <asp:Panel ID="pnlYok" runat="server" Visible="false" CssClass="p-4 text-center text-muted">
                Kayıtlı mesaj bulunmamaktadır.
            </asp:Panel>
        </div>
    </div>

    <!-- Mesaj Detay Modal -->
    <div class="modal fade" id="mesajModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content border-0 shadow">
                <div class="modal-header text-white" style="background-color: #1a365d;">
                    <h5 class="modal-title"><i class="bi bi-envelope-open me-2 text-accent"></i>Mesaj Detayı</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Kapat"></button>
                </div>
                <div class="modal-body p-4">
                    <div class="mb-3 p-3 bg-light rounded border">
                        <div class="row mb-2">
                            <div class="col-4 fw-bold text-muted">Gönderen:</div>
                            <div class="col-8 text-dark" id="modalGonderen"></div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-4 fw-bold text-muted">E-Posta:</div>
                            <div class="col-8 text-primary"><a href="#" id="modalEmailLink"><span id="modalEmail"></span></a></div>
                        </div>
                        <div class="row">
                            <div class="col-4 fw-bold text-muted">Tarih:</div>
                            <div class="col-8 text-dark" id="modalTarih"></div>
                        </div>
                    </div>
                    <h6 class="fw-bold text-accent mb-2">Mesaj Metni:</h6>
                    <div id="modalMesajMetni" class="p-3 border rounded" style="white-space: pre-wrap; background-color: #fcfcfc;"></div>
                </div>
                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Kapat</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function mesajGoster(btn) {
            document.getElementById('modalGonderen').innerText = btn.getAttribute('data-gonderen');
            document.getElementById('modalEmail').innerText = btn.getAttribute('data-email');
            document.getElementById('modalEmailLink').href = 'mailto:' + btn.getAttribute('data-email');
            document.getElementById('modalTarih').innerText = btn.getAttribute('data-tarih');
            
            // Encode edilmiş metni güvenli şekilde çözüp ekrana basma
            var text = btn.getAttribute('data-mesaj');
            var txt = document.createElement("textarea");
            txt.innerHTML = text;
            document.getElementById('modalMesajMetni').innerText = txt.value;
        }
    </script>
</asp:Content>
