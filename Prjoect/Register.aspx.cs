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
    public partial class Register : System.Web.UI.Page
    {
        OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            OleDbCommand query = new OleDbCommand(
                "insert into [user] " +
                "([uName],[pass],[mail]) " +
                "values ('" + name.Text + "','" + TextBox2.Text + "','" + TextBox1.Text + "')"
                , connection);

            OleDbCommand query2 = new OleDbCommand("SELECT @@IDENTITY", connection);

            connection.Open();
            query.ExecuteNonQuery();
            Session["userID"] = query2.ExecuteScalar().ToString();
            Response.Redirect("Home.aspx");

            connection.Close();
        }
    }
}