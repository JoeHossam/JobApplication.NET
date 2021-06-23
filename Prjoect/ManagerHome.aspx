<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManagerHome.aspx.cs" Inherits="MisPrjoect3.Manager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="bootstrap.css"/>
    <link rel="stylesheet" href="styles.css"/>
    <title></title>
</head>
<body>
    <nav id="main-navbar" class="navbar navbar-expand-lg navbar-light" style="background-color: #00B4DA;">
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <asp:HyperLink class="nav-link" ID="homeHyperLink" runat="server" NavigateUrl="Home.aspx" Visible="True">Home</asp:HyperLink>
      </li>
      <li class="nav-item">
        <asp:HyperLink class="nav-link" ID="postJobHyperLink" runat="server" NavigateUrl="AddJob.aspx" Visible="False">Post a Job</asp:HyperLink>
      </li>
    </ul>
      <ul id="navbar-left" class="nav navbar-nav ml-auto">
          <li><asp:HyperLink ID="registerHyperLink" runat="server" NavigateUrl="Register.aspx" Visible="False">Register</asp:HyperLink></li>
          <li><asp:HyperLink ID="loginHyperLink" runat="server" NavigateUrl="Login.aspx" Visible="False">Login</asp:HyperLink></li>
          <li><asp:HyperLink ID="profileHyperLink" runat="server" Visible="False" NavigateUrl="UserProfile.aspx">Profile</asp:HyperLink></li>
          <li><asp:HyperLink ID="logoutHyperLink" runat="server" Visible="True" NavigateUrl="ManagerLogin.aspx?logout=true">Log Out</asp:HyperLink></li>
            </ul>
  </div>
</nav>
    <form id="form1" runat="server">
        <div style="width: 40%; margin: auto; margin-top: 30vh;">
            <asp:Button style="width: 49%; height: 15vh; font-size: 1.4rem;" ID="Button1" runat="server" OnClick="Button1_Click" Text="View Jobs" />
            <asp:Button style="float: right;width: 49%; height: 15vh; font-size: 1.4rem;" ID="Button2" runat="server" OnClick="Button2_Click" Text="View Users" />
        </div> 
    </form>
</body>
</html>
