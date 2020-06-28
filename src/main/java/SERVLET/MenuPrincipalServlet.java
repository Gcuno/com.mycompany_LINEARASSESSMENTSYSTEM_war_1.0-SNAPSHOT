
package SERVLET;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gabicita
 */
public class MenuPrincipalServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           HttpSession session;
           session = request.getSession();
           response.setContentType("text/html;charset=UTF-8");
           PrintWriter out = response.getWriter();
           String opcad = request.getParameter("op");
           int op = Integer.parseInt(opcad);
         
            if ( session.getAttribute("SESION") == null) {
                out.println("1");
            } else {
                
                try
                {
                switch (op) {
                     case 0: {
                        getServletContext().getRequestDispatcher("/Seguridad/crearUsuario/FrmCrearUsuario.jsp").forward(request, response);
                           
                            break;                      
                    }
                    case 1: {
                        
                        getServletContext().getRequestDispatcher("/Seguridad/crearUsuario/FrmCrearUsuarioDocente.jsp").forward(request, response);
                           
                            break;                      
                    }
                   case 2: {
                        getServletContext().getRequestDispatcher("/Seguridad/crearUsuario/FrmCrearUsuarioAlumno.jsp").forward(request, response);
                           
                            break;                      
                    }
            }
            
        } catch (Exception e) {
           
        }
    }

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
