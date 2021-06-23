<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MisPrjoect3.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="bootstrap.css"/>
    <link rel="stylesheet" href="styles.css"/>
    <title>Register</title>
</head>
<body>
    <form id="form1" runat="server" class="container-login100">
        <div class="wrap-register100 p-b-50">
            <span class="login100-form-title p-b-51">
                Register
            </span>
            <div class="form-group">
                <asp:TextBox class="form-control input100" aria-describedby="emailHelp" placeholder="Name" ID="name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="requiredError" runat="server" ControlToValidate="name" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:TextBox class="form-control input100" aria-describedby="emailHelp" placeholder="Email" ID="TextBox1" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="requiredError" runat="server" ControlToValidate="TextBox1" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" class="requiredError f-right" runat="server" ControlToValidate="TextBox1" ErrorMessage="Please enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <asp:TextBox type="Password" class="form-control input100" placeholder="Password" ID="TextBox2" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" class="requiredError" runat="server" ControlToValidate="TextBox2" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:TextBox type="Password" class="form-control input100" placeholder="Confirm Password" ID="cpass" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" class="requiredError" runat="server" ControlToValidate="cpass" ErrorMessage="Field is required"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" class="requiredError f-right" runat="server" ControlToCompare="TextBox2" ControlToValidate="cpass" ErrorMessage="Password does not match"></asp:CompareValidator>
            </div>
            <div class="container-login100-form-btn m-t-17">
                <asp:Button ID="Button1" runat="server" class="login100-form-btn" Text="Register" OnClick="Button1_Click" />
            </div>
            
        </div>
    </form>
</body>
</html>
