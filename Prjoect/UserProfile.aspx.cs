using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;
using System.Data;

namespace MisPrjoect3
{
    public partial class UserProfile : System.Web.UI.Page
    {
        List<string> results = new List<string>();
        List<string> results2 = new List<string>();
        OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userID"] == null) { Response.Redirect("Login.aspx"); }
            string userID = Session["userID"].ToString();

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

            OleDbCommand cmd = new OleDbCommand("select [jobID] from [job_applications] where [userID]=" + userID, connection);
            OleDbCommand query = new OleDbCommand("select [uName] from [user] where [ID]=" + userID, connection);
            OleDbCommand query2 = new OleDbCommand("select [mail] from [user] where [ID]=" + userID, connection);

            connection.Open();

            
            nameLabel.Text = "Name: " + query.ExecuteScalar().ToString();
            mailLabel.Text = "Email: " + query2.ExecuteScalar().ToString();

            OleDbDataReader reader = cmd.ExecuteReader();

            //int counter = 0;
            while (reader.Read())
            {
                int jobID = Convert.ToInt32(reader.GetValue(0).ToString());
                OleDbCommand cmd2 = new OleDbCommand("select [jobName] from [current_jobs] where [ID]=" + jobID, connection);
                results.Add(cmd2.ExecuteScalar().ToString());
                results2.Add(jobID.ToString());
            }

            DataTable dt = new DataTable();
            DataColumn[] columns = {
                new DataColumn("Job Title", System.Type.GetType("System.String")),
                new DataColumn("Link", System.Type.GetType("System.String")),
                new DataColumn("view More")
            };

            dt.Columns.AddRange(columns);
            DataRow dr;
            for (int i = 0; i < results.Count; i++)
            {
                dr = dt.NewRow();
                dr[0] = results[i];
                dr[1] = results2[i];
                HyperLink link = new HyperLink();
                link.NavigateUrl = "jobDescription.aspx?=" + results2[i];
                dr[2] = link;
                dt.Rows.Add(dr);
            }
            GridView2.DataSource = dt;
            GridView2.DataBind();

            connection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userID = Session["userID"].ToString();
            Response.Redirect("EditUser.aspx?userID=" + userID);
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("JobDescription.aspx?jobID=" + GridView2.SelectedRow.Cells[0].Text);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string userID = Session["userID"].ToString();

            OleDbCommand cmd = new OleDbCommand("delete * from [user] where [ID]=" + userID, connection);
            OleDbCommand cmd2 = new OleDbCommand("delete * from [job_applications] where [userID]=" + userID, connection);
            OleDbCommand cmd3 = new OleDbCommand("delete * from [current_jobs] where [recruiterID]=" + userID, connection);
            OleDbCommand cmd4 = new OleDbCommand("Select [ID] from [current_jobs] where [recruiterID]=" + userID, connection);

            connection.Open();

            OleDbDataReader reader = cmd4.ExecuteReader();
            while(reader.Read())
            {
                OleDbCommand cmd5 = new OleDbCommand("delete * from [job_applications] where [jobID]=" + reader.GetValue(0), connection);
                cmd5.ExecuteNonQuery();
            }

            cmd.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            cmd3.ExecuteNonQuery();
            connection.Close();
            Session.Clear();
            Response.Redirect("Home.aspx");
        }
    }
}