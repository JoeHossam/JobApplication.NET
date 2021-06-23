<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobDescription.aspx.cs" Inherits="MisPrjoect3.JobDesc" %>

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
        <div style="width: 40%; margin:auto; margin-top: 5vh; ">
          <div style="border: 1px solid #00B4DA; border-radius: 1em; padding: 2%;">
            <asp:TextBox style="border: none; font-size: 1.4em;" ID="TextBox1" runat="server" ReadOnly="True"></asp:TextBox>
            <br /><br />
            <asp:Label style="font-size: 1.2em;" ID="Label2" runat="server" Text="Salary"></asp:Label>
            <br />
            <asp:TextBox style="border: none;" ID="TextBox2" runat="server" ReadOnly="True"></asp:TextBox>
            <br /><br />
            <asp:Label style="font-size: 1.2em;" ID="Label3" runat="server" Text="Description"></asp:Label>
            <br />
            <asp:TextBox TextMode="Multiline" style="border:none; resize:none; overflow:auto; width:100%; height:15vh" ID="TextBox3" runat="server" ReadOnly="True"></asp:TextBox>
            <br />
            <asp:Button style="float: right; background-color: #00B4DA; border:none; color:white; border-radius: 0.8em; padding: 5px; width:20%; margin-top:-5px" ID="Button1" runat="server" OnClick="Button1_Click" Text="Edit" Visible="False" />
        &nbsp;<asp:Button style="float: right; background-color: #00B4DA; border:none; color:white; border-radius: 0.8em; padding: 5px; width:20%; margin-top:-5px" ID="Button2" runat="server" Text="Apply" Visible="False" OnClick="Button2_Click" />
        &nbsp;<asp:Button style="float: right; background-color: #00B4DA; border:none; color:white; border-radius: 0.8em; padding: 5px; width:20%; margin-top:-5px" ID="Button3" runat="server" Text="Delete" Visible="False" OnClick="Button3_Click" />
              <asp:Label style="float: right; font-size:1.2rem;" ID="Label6" runat="server" Text="You have to login to apply." Visible="False"></asp:Label>
          </div>
            <br />
            <asp:Label ID="Label5" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="People applied for the Job" Visible="False"></asp:Label>
            <asp:GridView style="margin:auto; width: 100%;" ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Visible="False">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="userID" />
                    <asp:BoundField DataField="E-mail" HeaderText="Mail" SortExpression="jobID" />
                </Columns>
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                <SortedDescendingHeaderStyle BackColor="#002876" />
            </asp:GridView>
            <br />
        </div>
    </form>
</body>
</html>
