<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="MisPrjoect3.UserProfile" %>

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
    <form id="form1" runat="server">
      <div style="width: 50%; margin:auto; margin-top: 5vh; margin-bottom: 5vh; border: 1px solid #00B4DA; border-radius: 1em; padding: 2%;">
            <asp:Label ID="nameLabel" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Label ID="mailLabel" runat="server" Text="Label"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="float: right; background-color: #00B4DA; border:none; color:white; border-radius: 0.8em; padding: 5px; width:20%; margin-top:-5px; cursor: pointer;" Text="Edit info" />
          <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="float: right; background-color: #00B4DA; border:none; color:white; border-radius: 0.8em; padding: 5px; width:20%; margin-top:-5px; cursor: pointer; margin-right: 5vw;" Text="Delete Profile" />
            <br />
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Posted Jobs"></asp:Label>
            <asp:GridView style="margin:auto; width: 100%;" ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ID" DataSourceID="AccessDataSource1">
                <Columns>
                    <asp:BoundField DataField="jobName" HeaderText="jobName" SortExpression="jobName" />
                    <asp:BoundField DataField="jobDesc" HeaderText="jobDesc" SortExpression="jobDesc" />
                    <asp:BoundField DataField="salary" HeaderText="salary" SortExpression="salary" />
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
            <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="D:\College\MisPrjoect3_1-1\MisPrjoect3\Database1.mdb" SelectCommand="SELECT [jobName], [jobDesc], [salary], [ID] FROM [current_jobs] WHERE ([recruiterID] = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="recruiterID2" SessionField="userID" Type="Int32" />
                </SelectParameters>
            </asp:AccessDataSource>
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Jobs Applied To"></asp:Label>
            <br />
            <asp:GridView style="margin:auto; width: 100%;" ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" >
                <Columns>
                    <asp:BoundField DataField="Link" HeaderText="" SortExpression="userID" />
                    <asp:BoundField DataField="Job Title" HeaderText="Job Title" SortExpression="jobID" />
                    <asp:CommandField HeaderText="View Job" ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
