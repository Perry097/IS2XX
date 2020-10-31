package servlets;

import org.w3c.dom.ls.LSOutput;
import tools.DbTool;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Controller2 extends AbstractAppServlet {


    @Override
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String _username = request.getParameter("vcbrukernavn");
            String _password = request.getParameter("vcpassord");

            Connection db = null;
            PreparedStatement pwm = null;

            try {

                String nesteSide = "Login.jsp";
                String melding = "Invalid email/password";
                if (_username != null) {

                    db = DbTool.getINSTANCE().dbLoggIn(out);
                    String Query = "Select * from Roprosjekt.Brukerinfo where Email=? and Passord=?";
                    pwm = db.prepareStatement(Query);
                    pwm.setString(1, _username);
                    pwm.setString(2, _password);

                    ResultSet rs = pwm.executeQuery();
                    if (rs.next()) {

                     HttpSession session = request.getSession();
                     session.setAttribute("_username", _username);
                     nesteSide = "AdminSide.jsp";

                    } else
                        request.setAttribute("message", melding);

                } else {
                    System.out.println("Eriks Error");

                }
                RequestDispatcher dispatcher = request.getRequestDispatcher(nesteSide);
                dispatcher.forward(request, response);

            } catch (Exception ex) {
                out.println("Exception :" + ex.getMessage());
                ex.printStackTrace();
            }
        }

    }

    @Override
    protected void writeBody(HttpServletRequest req, PrintWriter out) {

    }
}
