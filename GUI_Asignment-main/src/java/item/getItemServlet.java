package item;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class getItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
            itemDA itDA = new itemDA();
            String id = request.getParameter("id"); 
            Item editList = itDA.getRecord(id);
            if (editList == null) {
                // If item not found, show styled error (not alert)
                out.println("<script type='text/javascript'>");
                out.println("alert('No user with that ID found!');");
                out.println("window.location = 'editItem.jsp';");
                out.println("</script>");                
                return;
            }
                        
            request.setAttribute("editItem", editList); // set attribute
            RequestDispatcher dispatcher = request.getRequestDispatcher("editItem.jsp");
            dispatcher.forward(request, response);
        } catch (Exception ex){
            out.println(ex);
        }
        
    }

}
