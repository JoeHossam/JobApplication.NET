<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditJob.aspx.cs" Inherits="MisPrjoect3.EditJob" %>

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
    <form id="form1" runat="server">
      <div style="width: 80%; margin:auto; margin-top: 5vh; margin-bottom: 5vh; border: 1px solid #00B4DA; border-radius: 1em; padding: 2%;">
        <div id=left style="width: 10%; padding: 2%; float: left; display: inline">
          <div style="width:100%; margin: auto; text-align: center;">Fields</div>
          <br />
          <asp:Label style="font-size: 0.8rem;" ID="Label1" runat="server" Text="Job Title"></asp:Label>
            <br />
          <br />
          <asp:Label style="font-size: 0.8rem;" ID="Label2" runat="server" Text="Salary"></asp:Label>
            <br />
          <br />
          <asp:Label style="font-size: 0.8rem;" ID="Label3" runat="server" Text="Description"></asp:Label>
        </div>
        <div id=middle style="width: 44%; padding-left: 2%; padding-right: 2%; float: left; display: inline; border-right: 1px solid #008eaa; border-left: 1px solid #008eaa;">
          <div style="width:100%; margin: auto; text-align: center;">Enter New Values</div>
          <br />
          <asp:TextBox style="width: 100%;" ID="titleTextBox" runat="server" BorderStyle="Solid"></asp:TextBox>
            <br />
          <br />
          <asp:TextBox style="width: 100%;" ID="salaryTextBox" runat="server" BorderStyle="Solid"></asp:TextBox>
            <br />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="salaryTextBox" ErrorMessage="Must be a Number." ForeColor="Red" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
          <br />
          <asp:TextBox style="resize:none; overflow:auto; width:100%;" TextMode="Multiline" ID="descTextBox" runat="server" BorderStyle="Solid"></asp:TextBox>
        </div>
        <div id=right style="width: 44%; padding: 2%; float: left; display: inline;">
          <div style="width:100%; margin: auto; text-align: center;">Old Values</div>
          <br />
          <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            <br />
          <br />
          <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
            <br />
          <br />
          <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
          <br />
          <br />
        </div>
            
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update" style="background-color: #00B4DA; border:none; color:white; border-radius: 0.8em; padding: 5px; width:20%; cursor: pointer;" />
        </div>
    </form>
</body>
</html>
