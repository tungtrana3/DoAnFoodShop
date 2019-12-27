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
    public partial class DanhSachSanPham : System.Web.UI.Page
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
                sQuery = "Select * from food";
                DataTable dt = DataProvider.getDataTable(sQuery);
                rpt_food.DataSource = dt;
                rpt_food.DataBind();
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("DanhSachSanPham.aspx?key=" + txtkey.Text);
        }

        protected void rpt_food_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName.ToLower().Equals("sua"))
            {
                int id = Convert.ToInt32(e.CommandArgument);
                Response.Redirect("Food.aspx?update=" + id);
            }
            else if (e.CommandName.ToLower().Equals("xoa"))
            {
                SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-77KDDKP;Initial Catalog =WEB_DB;Integrated Security = True");
                conn.Open();
                int id = Convert.ToInt32(e.CommandArgument);
                string query = "UPDATE  food SET status = 0 WHERE id = " + id;
                SqlCommand cmd = new SqlCommand(query, conn);
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                if (count != null)
                {
                    txtResult.InnerHtml = "Xóa thành công";
                    Response.Redirect("DanhSachSanPham.aspx");
                }
            }
        }
    }
}