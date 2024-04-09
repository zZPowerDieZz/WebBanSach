<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemSach.aspx.cs" Inherits="WebBanSach.ThemSach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
 <h2>TRANG THÊM SÁCH MỚI</h2>
    <hr />
    <asp:ValidationSummary ID="vsLoi" runat="server" ForeColor="Red" />
    <div class="form-group">
        <label>Tên sách</label>
        <asp:TextBox ID="txtTen" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvTen" runat="server" ControlToValidate="txtTen" Text="(*)" ForeColor="#ff0000"
        ErrorMessage="Tên sách không được bỏ trống"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label>Giá bán</label>
        <asp:TextBox ID="txtDongia" runat="server" CssClass="form-control"></asp:TextBox>
         <asp:RequiredFieldValidator ID="rfvDongia" runat="server" ControlToValidate="txtDongia" Text="(*)" ForeColor="#ff0000"
        ErrorMessage="Đơn giá không được bỏ trống"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvDongia" ControlToValidate="txtDongia" ValueToCompare="0" Type="Double" ForeColor="#ff0000" Operator="GreaterThanEqual" runat="server" 
            ErrorMessage="Đơn giá không hợp lệ (phải >= 0)"></asp:CompareValidator>
    </div>
    <div class="form-group">
        <label>Ảnh bìa</label>
        <asp:FileUpload ID="FHinh" runat="server" />
    </div>
    <div class="form-group">
        <label>Chủ đề</label>
        <asp:DropDownList ID="ddlChuDe" runat="server" CssClass="form-control" 
            DataSourceID="dsChuDe" DataTextField="TenCD" DataValueField="MaCD"></asp:DropDownList>    </div>
    <div class="form-group">
        <label>Xuất bản</label>
            <asp:DropDownList ID="ddlNXB" runat="server" CssClass="form-control" 
                DataSourceID="dsNXB" DataTextField="TenNXB" DataValueField="MaNXB"></asp:DropDownList>    </div>
    <div class="form-group">
        <label>Ngày cập nhật</label>
        <asp:TextBox ID="txtNgayCapNhat" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
    </div>
    <asp:Button ID="btnThem" runat="server" Text="Thêm" CssClass="btn btn-primary" OnClick="btnThem_Click" />
    <a href="QTSach.aspx">Go To List</a>

    <asp:SqlDataSource ID="dsNXB" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [NhaXuatBan]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsChuDe" runat="server" ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" 
        SelectCommand="SELECT * FROM [ChuDe]"></asp:SqlDataSource>
</asp:Content>
