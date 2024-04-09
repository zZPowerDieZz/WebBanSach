using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanSach
{
    public partial class ThemSach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            //lấy giá trị chuỗi kết nối trong web.config
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString);
            conn.Open();
            string sql = "INSERT INTO Sach(TenSach,MaCD,MaNXB,Dongia,Hinh,Ngaycapnhat)values(@TenSach,@MaCD,@MaNXB,@Dongia,@Hinh,@Ngaycapnhat)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@TenSach", txtTen.Text);
            cmd.Parameters.AddWithValue("@MaCD", ddlChuDe.SelectedValue);
            cmd.Parameters.AddWithValue("@MaNXB", ddlNXB.SelectedValue);
            cmd.Parameters.AddWithValue("@Dongia", txtDongia.Text);
            cmd.Parameters.AddWithValue("@Ngaycapnhat", txtNgayCapNhat.Text);
            if (FHinh.HasFile)
            {
                //xử lý upload hình
                string path = Server.MapPath("~/bia_sach/") + FHinh.FileName;
                FHinh.SaveAs(path);
                cmd.Parameters.AddWithValue("@Hinh", FHinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@Hinh", "no_image.png");
            }

            if(cmd.ExecuteNonQuery()>0)//thêm thành công
            {
                Response.Write("<script> alert('Đã thêm thành công')</script>");
            }
            else
            {
                Response.Write("<script> alert('Thao tác thêm không thành công')</script>");
            }
        }
    }
}