using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MisPrjoect3
{
    public partial class Manager : System.Web.UI.Page
    {
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
            Response.Redirect("ManagerJobs.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManagerUser.aspx");
        }
    }
}