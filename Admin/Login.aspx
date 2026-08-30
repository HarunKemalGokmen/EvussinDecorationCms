<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>
<html lang="tr">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Yönetici Girişi | Evussin Decoration</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { 
            background-color: #f4f6f9; 
            height: 100vh; 
            display: flex; 
            align-items: center; 
            justify-content: center;
        }
        .login-card {
            width: 100%;
            max-width: 400px;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            background: white;
        }
        .brand-text { color: #1a365d; font-weight: bold; }
        .brand-accent { color: #dd6b20; }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="login-card">
        <div class="text-center mb-4">
            <h2 class="brand-text"><span class="brand-accent">Evussin</span> Admin</h2>
            <p class="text-muted">Lütfen giriş bilgilerinizi giriniz.</p>
        </div>

        <asp:Panel ID="pnlHata" runat="server" Visible="false" CssClass="alert alert-danger">
            <asp:Literal ID="ltrHata" runat="server"></asp:Literal>
        </asp:Panel>

        <div class="mb-3">
            <label class="form-label">Kullanıcı Adı</label>
            <asp:TextBox ID="txtKullaniciAdi" runat="server" CssClass="form-control" required="required"></asp:TextBox>
        </div>
        
        <div class="mb-4">
            <label class="form-label">Şifre</label>
            <asp:TextBox ID="txtSifre" runat="server" TextMode="Password" CssClass="form-control" required="required"></asp:TextBox>
        </div>

        <div class="d-grid">
            <asp:Button ID="btnGiris" runat="server" Text="Giriş Yap" CssClass="btn btn-primary" style="background-color: #1a365d; border: none;" OnClick="btnGiris_Click" />
        </div>
    </form>
</body>
</html>
