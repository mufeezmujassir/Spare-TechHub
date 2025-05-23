package userServlat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;
import JDBCConnection.ConnectionFactory;
/**
 * Servlet implementation class addproduct
 */
@MultipartConfig
public class addproduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
     
    private static final String imageDirectory="C:/Users/Acer/Desktop/Assignment/onlinespareparts/src/main/webapp/image/";

    public addproduct() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Optional: implement or redirect to a different page
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pname = request.getParameter("pname");
        String producttype = request.getParameter("producttype");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String description = request.getParameter("description");
        String id=request.getParameter("id");
        System.out.println(id);
        Part imagePart = request.getPart("image");
        String imageFileName=imagePart.getSubmittedFileName();
        System.out.println("Selected image name is "+imageFileName);
        String uploadpath=imageDirectory+imageFileName;
       try {
    	   FileOutputStream fos=new FileOutputStream(uploadpath);
           InputStream is=imagePart.getInputStream();
           byte[] data=new byte[is.available()];
           is.read(data);
           fos.write(data);
           fos.close();
           
       }catch(Exception e) {
    	   e.printStackTrace();
       }
        
        
        
        
        
       

        try (Connection connection = ConnectionFactory.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO product (pname, producttype, price, quantity, description,image,usrname) VALUES (?, ?, ?,?,?,?,?)")) {

            preparedStatement.setString(1, pname);
            preparedStatement.setString(2, producttype);
            preparedStatement.setString(3, price);
            preparedStatement.setString(4, quantity);
            preparedStatement.setString(5, description);
            preparedStatement.setString(6, imageFileName); 
            preparedStatement.setString(7, id); 
            int row = preparedStatement.executeUpdate();
            if (row > 0) {
                //response.getWriter().print("Product added successfully!");
                
                request.getRequestDispatcher("/home.jsp").forward(request, response);
            }
        } catch (SQLException sqlEx) {
            sqlEx.printStackTrace();
            response.getWriter().print("SQL error: " + sqlEx.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error adding product: " + e.getMessage());
        }
    }


}
