using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MisPrjoect3
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string logout = Request.QueryString["logout"];
            if(logout == "true")
            {
                Session.Clear();
                Response.Redirect("Home.aspx");
            }

            if(Session["userID"] == null)
            {
                registerHyperLink.Visible = true;
                loginHyperLink.Visible = true;
            }
            else
            {
                profileHyperLink.Visible = true;
                logoutHyperLink.Visible = true;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("ManagerHome.aspx");
        }
    }
}