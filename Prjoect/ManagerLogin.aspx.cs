using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;

namespace MisPrjoect3
{
    public partial class ManagerLogin : System.Web.UI.Page
    {
        OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            string logout = Request.QueryString["logout"];
            if (logout == "true")
            {
                Session.Clear();
                Response.Redirect("ManagerLogin.aspx");
            }
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            label3.Visible = false;
            label4.Visible = false;
            OleDbCommand cmd = new OleDbCommand("select count(*) from [manager] where [managerName]='" + TextBox1.Text + "'", connection);
            connection.Open();
            int x = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            if (x == 1)
            {
                OleDbCommand cmd2 = new OleDbCommand("select [managerPass] from [manager] where [managerName]='" + TextBox1.Text + "'", connection);
                string pass = cmd2.ExecuteScalar().ToString();
                if (TextBox2.Text == pass)
                {
                    Session["Manager"] = true;
                    Response.Redirect("ManagerHome.aspx");
                }
                else
                {
                    label4.Visible = true;
                }
            }
            else
            {
                label3.Visible = true;
            }
            connection.Close();
        }
    }
}