using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Configuration;

namespace MisPrjoect3
{
    public partial class JobDesc : System.Web.UI.Page
    {
        OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);
        
        List<string> results = new List<string>();
        List<string> results2 = new List<string>();
        string jobID;

        protected void Page_Load(object sender, EventArgs e)
        {
            jobID = Request.QueryString["jobID"];
            if (jobID == null) { Response.Redirect("Home.aspx"); }

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

            OleDbCommand cmd = new OleDbCommand("select [userID] from [job_applications] where [jobID]=" + jobID, connection);

            OleDbCommand query = new OleDbCommand("select [jobName] from [current_jobs] where [ID]=" + jobID, connection);
            OleDbCommand query2 = new OleDbCommand("select [salary] from [current_jobs] where [ID]=" + jobID, connection);
            OleDbCommand query3 = new OleDbCommand("select [jobDesc] from [current_jobs] where [ID]=" + jobID, connection);
            OleDbCommand query4 = new OleDbCommand("select [recruiterID] from [current_jobs] where [ID]=" + jobID, connection);

            connection.Open();
            TextBox1.Text = query.ExecuteScalar().ToString();
            TextBox2.Text = query2.ExecuteScalar().ToString();
            TextBox3.Text = query3.ExecuteScalar().ToString();

            //checking if Session exists to prevent null refrence exception error
            if (Session["userID"] != null)
            {
                //checking if the session[userID] is equal to the id of the recruiter who posted the job
                if (Session["userID"].ToString() == query4.ExecuteScalar().ToString())
                {
                    Label4.Visible = true;
                    GridView1.Visible = true;
                    Button1.Visible = true;
                    Button3.Visible = true;
                }
                else
                {
                    Button2.Visible = true;
                }
            }
            else
            {
                Label6.Visible = true;
            }

            OleDbDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {

                int userID = Convert.ToInt32(reader.GetValue(0).ToString());

                OleDbCommand cmd2 = new OleDbCommand("select [uName] from [user] where [ID]=" + userID, connection);
                if(cmd2.ExecuteScalar().ToString() != null)
                    results.Add(cmd2.ExecuteScalar().ToString());

                OleDbCommand cmd3 = new OleDbCommand("select [mail] from [user] where [ID]=" + userID, connection);
                if(cmd3.ExecuteScalar().ToString() != null)
                    results2.Add(cmd3.ExecuteScalar().ToString());
            }

            DataTable dt = new DataTable();
            DataColumn[] columns = {
                new DataColumn("Name", System.Type.GetType("System.String")),
                new DataColumn("E-mail", System.Type.GetType("System.String"))
            };

            dt.Columns.AddRange(columns);
            DataRow dr;
            for (int i = 0; i < results.Count; i++)
            {
                dr = dt.NewRow();
                dr[0] = results[i];
                dr[1] = results2[i];
                dt.Rows.Add(dr);
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();

            connection.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditJob.aspx?jobID=" + jobID);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Session["userID"] != null)
            {
                string userID = Session["userID"].ToString();
                bool hasApplied = false;
                connection.Open();

                OleDbCommand cmd = new OleDbCommand("select [userID] from [job_applications] where [jobID]=" + jobID, connection);
                OleDbDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if(reader.GetValue(0).ToString() == userID)
                    {
                        hasApplied = true;
                        break;
                    }
                }
                if (!hasApplied)
                {
                    OleDbCommand cmd2 = new OleDbCommand("insert into [job_applications] ([jobID], [userID]) values (" + jobID + ", " + userID + ")", connection);
                    if (cmd2.ExecuteNonQuery() != 0)
                    {
                        Label5.Text = "Applied Successfully.";
                        Button2.Enabled = false;
                        Response.AddHeader("REFRESH", "1;URL=UserProfile.aspx");
                    }
                }
                else
                {
                    Label5.Text = "You Have Already Applied For This Job.";
                }
                connection.Close();
            }
            else
            {
                Label5.Text = "Please Login to Apply.";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            OleDbCommand cmd = new OleDbCommand("delete * from [current_jobs] where [ID]=" + jobID, connection);
            OleDbCommand cmd2 = new OleDbCommand("delete * from [job_applications] where [jobID]=" + jobID, connection);
            connection.Open();
            cmd.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            connection.Close();
            Response.Redirect("Home.aspx");
        }
    }
}