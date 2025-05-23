package suggestion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import JDBCConnection.ConnectionFactory;

/**
 * Servlet implementation class submitSuggestion
 */
@MultipartConfig
public class submitSuggestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String imageDirectory="C:/Users/Acer/Desktop/Assignment/onlinespareparts/src/main/webapp/feedback/";   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public submitSuggestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String suggestionType=request.getParameter("suggestionType");
		String feedback=request.getParameter("feedback");
		String email=request.getParameter("email");
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
               PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO suggestion (suggestiontype, feedback, image, email, username) VALUES (?, ?, ?,?,?)")) {

              preparedStatement.setString(1, suggestionType);
              preparedStatement.setString(2, feedback);
              preparedStatement.setString(3, imageFileName);
              preparedStatement.setString(4, email);
              preparedStatement.setString(5, username);
              
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
