<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Registracion.aspx.cs" Inherits="Parcial_2.Registracion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="RegStyle.css" rel="stylesheet" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container panel" align="center">
        
                    <br />
        <asp:Label ID="Label1" runat="server" Text="FORMULARIO DE REGISTRACION" Font-Bold="True"></asp:Label>
        <br />
        <br />

        <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
&nbsp;
        <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Ingrese un correo válido" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Email" ErrorMessage="El campo Email es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Username"></asp:Label>
&nbsp;
        <asp:TextBox ID="Username" runat="server"></asp:TextBox>
        <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Username" ErrorMessage="El Username es requerido" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Edad"></asp:Label>
&nbsp;
        <asp:TextBox ID="Edad" runat="server"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Edad" ErrorMessage="La edad debe ser mayor a 15" ForeColor="Red" MaximumValue="150" MinimumValue="15" Type="Integer"></asp:RangeValidator>
        <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Edad" ErrorMessage="La Edad es requerida" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <asp:Label ID="Label5" runat="server" Text="Contraseña"></asp:Label>
&nbsp;
        <asp:TextBox ID="Password" runat="server"></asp:TextBox>
        &nbsp;<br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Password" ErrorMessage="No ingreso su contraseña" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        Repetir Contraseña&nbsp;&nbsp;
        <asp:TextBox ID="Password2" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Password" ControlToValidate="Password2" ErrorMessage="Las contraseñas ingresadas no coinciden" ForeColor="Red"></asp:CompareValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Password2" ErrorMessage="Repita su contraseña" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Enviar" OnClick="Button1_Click" />
                    <br />
        <br />

        

    </div>
</asp:Content>
