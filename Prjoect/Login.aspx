<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MisPrjoect3.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="bootstrap.css">
    <link rel="stylesheet" href="styles.css">
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server" class="container-login100">
        <div class="wrap-login100 p-t-50 p-b-50 p-l-20 p-r-20">
            <span class="login100-form-title p-b-51">
                Login
            </span>
            <div class="form-group">
                <asp:TextBox class="form-control input100" aria-describedby="emailHelp" placeholder="Email" ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="requiredError" runat="server" ControlToValidate="TextBox1" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                <asp:Label ID="label3" runat="server" ForeColor="Red" Text="Email not found." Visible="False"></asp:Label>
            </div>
            <div class="form-group">
                <asp:TextBox type="Password" class="form-control input100" placeholder="Password" ID="TextBox2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="requiredError" runat="server" ControlToValidate="TextBox2" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
                <asp:Label ID="label4" runat="server" ForeColor="Red" Text="Wrong password" Visible="False"></asp:Label>
            </div>
            <div class="container-login100-form-btn m-t-17">
                <asp:Button ID="loginButton" runat="server" Text="Login" class="login100-form-btn" OnClick="loginButton_Click"/>
            </div>
            
        </div>
    </form>

    
</body>
</html>
