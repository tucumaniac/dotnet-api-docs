<!-- <Snippet1> -->
<%@ page language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    ' This custom login control overloads the OnAuthenticate method
    ' to call a site-specific authentication method.
    Class CustomLogin
        Inherits Login
        
        Private Function SiteSpecificAuthenticationMethod(ByVal UserName As String, ByVal Password As String) As Boolean
            ' Insert code that implements a site-specific custom 
            ' authentication method here.
            '
            ' This example implementation always returns false.
            Return False
        End Function
    
        Overloads Sub OnAuthenticate(ByVal e As AuthenticateEventArgs)
            Dim Authenticated As Boolean
            Authenticated = SiteSpecificAuthenticationMethod(UserName, Password)

            e.Authenticated = Authenticated
        End Sub
    End Class
    
    ' Add the custom login control to the page.
    Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        Dim loginControl As New CustomLogin

        loginControl.ID = "loginControl"

        PlaceHolder1.Controls.Add(loginControl)
    End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ASP.NET Example</title>
</head>
<body>
<form id="form1" runat="server">
    <asp:placeholder id="PlaceHolder1" runat="server"></asp:placeholder>

</form>
</body>
</html>
<!-- </Snippet1> -->
