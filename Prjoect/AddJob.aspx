<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddJob.aspx.cs" Inherits="MisPrjoect3.AddJob" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="bootstrap.css"/>
    <link rel="stylesheet" href="styles.css"/>
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
        <asp:HyperLink class="nav-link" ID="postJobHyperLink" runat="server" NavigateUrl="AddJob.aspx" Visible="True">Post a Job</asp:HyperLink>
      </li>
    </ul>
      <ul id="navbar-left" class="nav navbar-nav ml-auto">
          <li><asp:HyperLink ID="registerHyperLink" runat="server" NavigateUrl="Register.aspx" Visible="False">Register</asp:HyperLink></li>
          <li><asp:HyperLink ID="loginHyperLink" runat="server" NavigateUrl="Login.aspx" Visible="False">Login</asp:HyperLink></li>
          <li><asp:HyperLink ID="profileHyperLink" runat="server" Visible="False" NavigateUrl="UserProfile.aspx">Profile</asp:HyperLink></li>
          <li><asp:HyperLink ID="logoutHyperLink" runat="server" Visible="False" NavigateUrl="Home.aspx?logout=true">Log Out</asp:HyperLink></li>
            </ul>
  </div>
</nav>
    <form id="form1" runat="server" method="get">
        <div style="width: 60%; margin: auto; margin-top: 5vh; border: 1px solid #00B4DA; border-radius: 1em; padding:2%">
            <asp:Label ID="Label1" runat="server" Text="Job Title"></asp:Label>
            <br />
            <asp:TextBox style="width: 100%;" ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Field required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Salary"></asp:Label>
            <br />
            <asp:TextBox style="width: 100%;" ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Field required." ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Must be a Number." ForeColor="Red" ControlToValidate="TextBox2" Type="Integer" Operator="DataTypeCheck"></asp:CompareValidator>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>
            <asp:TextBox TextMode="Multiline" style="resize:none; overflow:auto; width:100%; margin-bottom: 20px;" ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Field required." ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Post" style="float: right; background-color: #00B4DA; border:none; color:white; border-radius: 0.8em; padding: 5px; width:20%; margin-top:-5px" />
            <br />
            <asp:Label ID="Label4" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
