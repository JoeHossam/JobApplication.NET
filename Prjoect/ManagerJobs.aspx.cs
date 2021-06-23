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
    public partial class ManagerJobs : System.Web.UI.Page
    {
        OleDbConnection connection = new OleDbConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Manager"] != null)
            {
                profileHyperLink.Visible = false;
                logoutHyperLink.Visible = true;
                registerHyperLink.Visible = false;
                loginHyperLink.Visible = false;
                postJobHyperLink.Visible = false;
                homeHyperLink.NavigateUrl = "ManagerHome.aspx";
            }
            else
            {
                Response.Redirect("ManagerLogin.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(GridView1.SelectedRow != null)
                Response.Redirect("EditJob.aspx?jobID=" + GridView1.SelectedRow.Cells[1].Text);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null) { return; }

            string jobID = GridView1.SelectedRow.Cells[1].Text;

            //delete the selected job from the jobs table and the job_applications table
            OleDbCommand cmd = new OleDbCommand("delete * from [current_jobs] where [ID]=" + jobID, connection);
            OleDbCommand cmd2 = new OleDbCommand("delete * from [job_applications] where [jobID]=" + jobID, connection);
            connection.Open();
            cmd.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            connection.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagerHome.aspx");
        }
    }
}