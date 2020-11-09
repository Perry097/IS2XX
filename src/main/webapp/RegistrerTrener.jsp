
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="tools.DbTool" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<form action="TrenerServlet" method="POST">
    <label for='br'>Brukernavn:</label>
    <input type='text' name='br'/>
    <br>
    <label for='ps'>Passord:</label>
    <input type='text' name='ps'/>
    <input type='submit' name="action" value="Registrer trener"/>

    <label for="klobb">Klubber:</label>
    <select id="klobb  " name="klobb">
        <option value=""> Velg klubb </option>
        <%
            PrintWriter p = new PrintWriter(out);
            Connection db = null;
            PreparedStatement dropDown = null;
            try {
                db = DbTool.getINSTANCE().dbLoggIn(p);
                ResultSet rs = null;
                String query = "SELECT * FROM klubb";
                dropDown = db.prepareStatement(query);
                rs = dropDown.executeQuery();
                while (rs.next())
                {
        %>
        <option value="<%=rs.getInt("klubb_id") %>"><%=rs.getString("klubbnavn")%>
        </option>
        <%
                }
            } catch (SQLException e ) {
                e.printStackTrace();
            }
        %>
    </select>
</form>

</body>
</html>
