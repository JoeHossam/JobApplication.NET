<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MisPrjoect3.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="bootstrap.css"/>
    <link rel="stylesheet" href="styles.css"/>
    <link rel="stylesheet" href="home.css"/>
    <title>Home</title>
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
        
        <h1 style="text-align:center; margin-top:3vh;">Available Jobs</h1>
        <br />
        
        <div id="HomeList">
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="AccessDataSource1">
            <AlternatingItemTemplate>
                <li style="background-color: #83c8c972; border: 2px solid #008A8C; border-radius: 0.8em; padding: 2%;">
                    <div style="text-align: center;"><asp:Label style="font-size: 1.3rem;" ID="jobNameLabel" runat="server" Text='<%# Eval("jobName") %>' /></div>
                    Salary
                    <asp:Label style="font-size: 12; color: rgb(72, 72, 72); font-size: 0.8rem;" ID="jobDescLabel" runat="server" Text='<%# Eval("salary") %>' />
                    <br />
                    Description<br>
                    <asp:Label style="padding: 20px; overflow:hidden; width: 60%; color: rgb(72, 72, 72); font-size: 0.8rem;" ID="salaryLabel" runat="server" Text='<%# Eval("jobDesc") %>' />
                    <br />
                    <a style="float: right; padding: 5px; margin-right: 3%; margin-top: -3%; border: 2px solid #00B4DA; border-radius: 4%; color: white; background-color: #00B4DA; text-decoration: none;" href="JobDescription.aspx?jobID=<%# Eval("ID") %>"<p>View More</p></a>
                    <br />
                </li>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <li style="background-color: white; border: 2px solid #008A8C; border-radius: 0.8em; padding: 2%;">
                    <asp:TextBox Style="padding: 20px;" ID="jobNameTextBox" runat="server" Text='<%# Bind("jobName") %>' />
                    <br />
                    Salary
                    <asp:TextBox Style="padding: 20px;" ID="jobDescTextBox" runat="server" Text='<%# Bind("salary") %>' />
                    <br />
                    Description<br>
                    <asp:TextBox ID="salaryTextBox" runat="server" Text='<%# Bind("jobDesc") %>' />
                    <br />
                    <a style="float: right; padding: 5px; margin-right: 3%; margin-top: -3%; border: 2px solid #00B4DA; border-radius: 4%; color: white; background-color: #00B4DA; text-decoration: none;" href="JobDescription.aspx?jobID=<%# Eval("ID") %>"<p>View More</p></a>
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                </li>
            </EditItemTemplate>
            <EmptyDataTemplate>
                No data was returned.
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <li style="">
                    <asp:TextBobackground-color: white; border: 2px solid #008A8C; border-radius: 0.8em; padding: 2%;">
                    <br />Salary
                    <asp:TextBox Style="padding: 20px;" ID="jobDescTextBox" runat="server" Text='<%# Bind("salary") %>' />
                    <br />Description<br>
                    <asp:TextBox ID="salaryTextBox" runat="server" Text='<%# Bind("jobDesc") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                </li>
            </InsertItemTemplate>
            <ItemSeparatorTemplate>
<br />
            </ItemSeparatorTemplate>
            <ItemTemplate>
                <li style="background-color: #83c8c972; border: 2px solid #008A8C; border-radius: 0.8em; padding: 2%;">
                    <div style="text-align: center;"><asp:Label style="font-size: 1.3rem;" ID="jobNameLabel" runat="server" Text='<%# Eval("jobName") %>' /></div>
                    Salary
                    <asp:Label style="font-size: 12; color: rgb(72, 72, 72); font-size: 0.8rem;" ID="jobDescLabel" runat="server" Text='<%# Eval("salary") %>' />
                    <br />
                    Description<br>
                    <asp:Label style="padding: 20px; overflow:hidden; width: 60%; color: rgb(72, 72, 72); font-size: 0.8rem;" ID="salaryLabel" runat="server" Text='<%# Eval("jobDesc") %>' />
                    <br />
                    <a style="float: right; padding: 5px; margin-right: 3%; margin-top: -3%; border: 2px solid #00B4DA; border-radius: 4%; color: white; background-color: #00B4DA; text-decoration: none;" href="JobDescription.aspx?jobID=<%# Eval("ID") %>"<p>View More</p></a>
                    <br />
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <li runat="server" id="itemPlaceholder" />
                </ul>
                <div style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                    <asp:DataPager ID="DataPager1" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <li style="background-color: white; border: 2px solid #008A8C; border-radius: 0.8em; padding: 2%;">
                    <div style="text-align: center;"><asp:Label style="font-size: 1.3rem;" ID="jobNameLabel" runat="server" Text='<%# Eval("jobName") %>' /></div>
                    Salary
                    <asp:Label style="font-size: 12; color: rgb(72, 72, 72); font-size: 0.8rem; padding-left:10%;" ID="salaryLabel" runat="server" Text='<%# Eval("salary") %>' />
                    <br />
                    Description<br>
                    <asp:Label style="font-size: 12; color: rgb(72, 72, 72); font-size: 0.8rem; padding-left:10%;" ID="jobDescLabel" runat="server" Text='<%# Eval("jobDesc") %>' />
                    
                    <br />
                    <a style="float: right; padding: 5px; margin-right: 3%; margin-top: -3%; border: 2px solid #00B4DA; border-radius: 4%; color: white; background-color: #00B4DA; text-decoration: none;" href="JobDescription.aspx?jobID=<%# Eval("ID") %>"<p>View More</p></a>
                    <br />
                </li>
            </SelectedItemTemplate>
        </asp:ListView>
        </div>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="D:\College\MisPrjoect3_1-1\MisPrjoect3\Database1.mdb" SelectCommand="SELECT [jobName], [jobDesc], [salary], [ID] FROM [current_jobs]"></asp:AccessDataSource>


    </form>
</body>
</html>
