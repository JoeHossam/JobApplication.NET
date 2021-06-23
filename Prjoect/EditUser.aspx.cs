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
    public partial class EditUser : System.Web.UI.Page
    {
        string jobID;
        OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            jobID = Request.QueryString["userID"];
            if(jobID == null) { Response.Redirect("Login.aspx"); }

            string logout = Request.QueryString["logout"];
            if (logout == "true")
            {
                Session.Clear();
                Response.Redirect("Home.aspx");
            }

            if (Session["userID"] == null && Session["Manager"] == null)
            {
                Response.Redirect("Login.aspx");
                registerHyperLink.Visible = true;
                loginHyperLink.Visible = true;
            }
            else
            {
                profileHyperLink.Visible = true;
                logoutHyperLink.Visible = true;
            }

            if (Session["Manager"] != null)
            {
                profileHyperLink.Visible = false;
                logoutHyperLink.Visible = false;
                registerHyperLink.Visible = false;
                loginHyperLink.Visible = false;
                postJobHyperLink.Visible = false;
                homeHyperLink.NavigateUrl = "ManagerHome.aspx";
            }

            //queries
            OleDbCommand title = new OleDbCommand("select [uName] from [user] where [ID]=" + jobID, connection);
            OleDbCommand desc = new OleDbCommand("select [pass] from [user] where [ID]=" + jobID, connection);
            OleDbCommand salary = new OleDbCommand("select [mail] from [user] where [ID]=" + jobID, connection);

            connection.Open();

            Label4.Text = title.ExecuteScalar().ToString();
            Label5.Text = salary.ExecuteScalar().ToString();
            Label6.Text = desc.ExecuteScalar().ToString();

            //connection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s1 = string.IsNullOrEmpty(titleTextBox.Text) ? Label4.Text : titleTextBox.Text;
            string s2 = string.IsNullOrEmpty(salaryTextBox.Text) ? Label5.Text : salaryTextBox.Text;
            string s3 = string.IsNullOrEmpty(descTextBox.Text) ? Label6.Text : descTextBox.Text;
            OleDbCommand query = new OleDbCommand("update [user] set [uName] = '" + s1 + "' where [ID]=" + jobID, connection);
            OleDbCommand query2 = new OleDbCommand("update [user] set [pass] = '" + s3 + "' where [ID]=" + jobID, connection);
            OleDbCommand query3 = new OleDbCommand("update [user] set [mail] = '" + s2 + "' where [ID]=" + jobID, connection);

            //connection.Open();
            query.ExecuteNonQuery();
            query2.ExecuteNonQuery();
            query3.ExecuteNonQuery();
            Response.Redirect(Request.RawUrl);
            connection.Close();
        }
    }
}
