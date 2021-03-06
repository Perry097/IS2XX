<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Hjemmeside</title>
    <link rel="stylesheet" href="test.css"/>
</head>
<body>
<ul>
    <li><form action="${pageContext.request.contextPath}/LoggUt" method="post">
        <input type="submit" value="Logg ut" /></form></li>
    <li><a href="AddBruker.jsp">Legg til medlem</a></li>
    <li><a href="addKlubb.jsp">Legg til klubb</a></li>
    <li><a href="AddTestgruppe.jsp">Legg til testgruppe</a></li>
    <li><a href="Test�r.jsp">Legg til test�r og -uke</a></li>
    <li><a href="Registrering.jsp">Legg til trener/Admin</a></li>
    <li><a href="Klubboversikt.jsp">Klubboversikt</a></li>
</ul>
<%
    //allow access only if session exists
    String Bruker = null;
    if(session.getAttribute("Bruker") == null){
        response.sendRedirect("Login.jsp");
    }else Bruker = (String) session.getAttribute("Bruker");
    String bruker = null;
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    if(cookies !=null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("Bruker")) bruker = cookie.getValue();
            if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
        }
    }
%>
<br>
<br>
<br>
<div class="Introduksjon">
    <h3>Hei <%=bruker %>, din sesjonsid er <%=sessionID %></h3>
</div>
<br>
User=<%=Bruker %>
<br>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AdminSide</title>
<div class="Introduksjon">
    <h1> Velkommen til Trenersiden <b> (${Bruker})</b>, du er n� logget inn som trener!</h1>
    <!-- knapp med henvisning til servletten "LoggUt" som avslutter den innloggede brukerens sesjon. -->
    <br>
    <form action="${pageContext.request.contextPath}/VisUtoevereiKlubb" method="post">
        <input type="submit" value="Vis ut�vere i klubben" />
    </form>
</div>
<br>
<!-- Sesjonsinformasjon ved servelet "SessionTest". -->
<form action="${pageContext.request.contextPath}/SesjonsTest" method="post">
    <input type="submit" value="SesjonsTest" />
</form>
</body>
</html>