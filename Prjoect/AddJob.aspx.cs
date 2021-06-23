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
    public partial class AddJob : System.Web.UI.Page
    {
        OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            string logout = Request.QueryString["logout"];
            if (logout == "true")
            {
                Session.Clear();
                Response.Redirect("Home.aspx");
            }

            if (Session["userID"] == null)
            {
                registerHyperLink.Visible = true;
                loginHyperLink.Visible = true;
            }
            else
            {
                profileHyperLink.Visible = true;
                logoutHyperLink.Visible = true;
            }

            if(Session["userID"] == null)
            {
                Button1.Enabled = false;
                Label4.Text = "You have to login to post a job.";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            OleDbCommand query = new OleDbCommand("insert into [current_jobs]" +
                "([jobName],[recruiterID],[salary],[jobDesc])" +
                "values" +
                "('" + TextBox1.Text + "','" + Session["userID"].ToString() + "','" + TextBox2.Text + "','" + TextBox3.Text + "')", connection);

            OleDbCommand query2 = new OleDbCommand("SELECT @@IDENTITY", connection);

            connection.Open();
            query.ExecuteNonQuery();
            string jobID = query2.ExecuteScalar().ToString();
            Response.Redirect("JobDescription.aspx?jobID=" + jobID);
            connection.Close();
        }
    }
}