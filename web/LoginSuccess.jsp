<%--
  Created by IntelliJ IDEA.
  User: parsa
  Date: 1/17/19
  Time: 10:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
    <title>Login Success Page</title>
</head>
<body>
<%
    //allow access only if session exists
    String user = null;
    if (session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
    } else user = (String) session.getAttribute("user");
    String userName = null;
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("user")) userName = cookie.getValue();
            if (cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
        }
    } else {
        sessionID = session.getId();
    }
%>
<h3>Hi <%=userName %>, Login successful. Your Session ID=<%=sessionID %>
</h3>
<br>
User=<%=user %>
<br>
<!-- need to encode all the URLs where we want session information to be passed -->
<a href="<%=response.encodeURL("CheckoutPage.jsp") %>">Checkout Page</a>
<form action="<%=response.encodeURL("LogoutServlet") %>" method="post">
    <input type="submit" value="Logout">
</form>
</body>
</html>
