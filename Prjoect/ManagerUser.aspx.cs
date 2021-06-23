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
    public partial class ManagerUser : System.Web.UI.Page
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

        //Edit
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(GridView1.SelectedRow != null)
                Response.Redirect("EditUser.aspx?userID=" + GridView1.SelectedRow.Cells[1].Text);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        //Delete
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (GridView1.SelectedRow == null) { return; }

            string userID = GridView1.SelectedRow.Cells[1].Text;

            OleDbCommand cmd = new OleDbCommand("delete * from [user] where [ID]=" + userID, connection);
            OleDbCommand cmd2 = new OleDbCommand("delete * from [job_applications] where [userID]=" + userID, connection);
            OleDbCommand cmd3 = new OleDbCommand("delete * from [current_jobs] where [recruiterID]=" + userID, connection);
            OleDbCommand cmd4 = new OleDbCommand("Select [ID] from [current_jobs] where [recruiterID]=" + userID, connection);

            connection.Open();

            OleDbDataReader reader = cmd4.ExecuteReader();
            while (reader.Read())
            {
                OleDbCommand cmd5 = new OleDbCommand("delete * from [job_applications] where [jobID]=" + reader.GetValue(0), connection);
                cmd5.ExecuteNonQuery();
            }

            cmd.ExecuteNonQuery();
            cmd2.ExecuteNonQuery();
            cmd3.ExecuteNonQuery();
            connection.Close();
            Response.Redirect(Request.RawUrl);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagerHome.aspx");
        }
    }
}