using DoAnVegeFoody.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnVegeFoody.admin
{
    public partial class DanhSachLoaiSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LOGIN"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            if (!IsPostBack)
            {
                string sQuery = "";
                sQuery = "Select * from food_type";
                DataTable dt = DataProvider.getDataTable(sQuery);
                Repeater_Foodtype.DataSource = dt;
                Repeater_Foodtype.DataBind();
            }
        }

        protected void Repeater_Foodtype_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Equals("sua"))
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Foodtype.aspx?update=" + id);
            }
            else if (e.CommandName.ToLower().Equals("xoa"))
            {
                SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-77KDDKP;Initial Catalog =WEB_DB;Integrated Security = True");
                conn.Open();
                int id = Convert.ToInt32(e.CommandArgument);
                string query = "UPDATE  food_type SET status = 0 WHERE type_id = " + id;
                SqlCommand cmd = new SqlCommand(query, conn);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count != null)
                {
                    txtResult.InnerHtml = "Xóa thành công";
                    Response.Redirect("DanhSachLoaiSanPham.aspx");
                }
            }
        }
    }
}