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
    public partial class EditJob : System.Web.UI.Page
    {
        string jobID;
        OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            jobID = Request.QueryString["jobID"];
            if(jobID == null) { Response.Redirect("Login.aspx"); }

            string logout = Request.QueryString["logout"];
            if (logout == "true")
            {
                Session.Clear();
                Response.Redirect("Home.aspx");
            }

            if (Session["userID"] == null && Session["Manager"] == null)
            {
                registerHyperLink.Visible = true;
                loginHyperLink.Visible = true;
                Response.Redirect("Login.aspx");
            }
            else
            {
                profileHyperLink.Visible = true;
                logoutHyperLink.Visible = true;
            }

            if(Session["Manager"] != null)
            {
                profileHyperLink.Visible = false;
                logoutHyperLink.Visible = false;
                registerHyperLink.Visible = false;
                loginHyperLink.Visible = false;
                postJobHyperLink.Visible = false;
                homeHyperLink.NavigateUrl = "ManagerHome.aspx";
            }

            //queries
            OleDbCommand title = new OleDbCommand("select [jobName] from [current_jobs] where [ID]=" + jobID, connection);
            OleDbCommand desc = new OleDbCommand("select [jobDesc] from [current_jobs] where [ID]=" + jobID, connection);
            OleDbCommand salary = new OleDbCommand("select [salary] from [current_jobs] where [ID]=" + jobID, connection);

            connection.Open();

            Label4.Text = title.ExecuteScalar().ToString();
            Label5.Text = salary.ExecuteScalar().ToString();
            Label6.Text = desc.ExecuteScalar().ToString();

            //connection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            OleDbCommand query = new OleDbCommand("update [current_jobs] set [jobName] = '" + titleTextBox.Text + "' where [ID]=" + jobID, connection);
            OleDbCommand query2 = new OleDbCommand("update [current_jobs] set [jobDesc] = '" + descTextBox.Text + "' where [ID]=" + jobID, connection);
            OleDbCommand query3 = new OleDbCommand("update [current_jobs] set [salary] = '" + salaryTextBox.Text + "' where [ID]=" + jobID, connection);

            //connection.Open();
            query.ExecuteNonQuery();
            query2.ExecuteNonQuery();
            query3.ExecuteNonQuery();           
            Response.Redirect("JobDescription.aspx?jobID=" + jobID);
            connection.Close();
        }
    }
}