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
    public partial class WebForm1 : System.Web.UI.Page
    {
        OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            label3.Visible = false;
            label4.Visible = false;
            OleDbCommand cmd = new OleDbCommand("select count(*) from [user] where [mail]='" + TextBox1.Text + "'", connection);
            connection.Open();
            int x = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            if(x == 1)
            {
                OleDbCommand cmd2 = new OleDbCommand("select [pass] from [user] where [mail]='" + TextBox1.Text + "'", connection);
                string pass = cmd2.ExecuteScalar().ToString();
                if (TextBox2.Text == pass)
                {
                    OleDbCommand cmd3 = new OleDbCommand("select [ID] from [user] where [mail]='" + TextBox1.Text + "'", connection);
                    Session["userID"] = cmd3.ExecuteScalar().ToString();
                    Response.Redirect("Home.aspx");
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