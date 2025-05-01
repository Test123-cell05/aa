package item;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.logging.Level;
import java.util.logging.Logger;

public class addItemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try{
        itemDA itDA = new itemDA();
        //obtain the parameter value from the html form
        String id = request.getParameter("id");
        String name = request.getParameter("name");      
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        
        Item i = new Item (id,name,category,price,stock);
        itDA.addRecord(i);
        out.println("<script type='text/javascript'>");
        out.println("alert('Item \"" + id + "\" has been added successfully.');");
        out.println("window.location = 'addItem.html';");
        out.println("</script>");

        } catch (Exception ex){
            out.println(ex);
        }
        
    }
}
