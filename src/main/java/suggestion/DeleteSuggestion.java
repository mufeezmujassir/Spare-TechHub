package suggestion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import JDBCConnection.ConnectionFactory;

/**
 * Servlet implementation class DeleteSuggestion
 */
public class DeleteSuggestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private static final String IMAGE_DIRECTORY = "C:/Users/Acer/Desktop/Assignment/onlinespareparts/src/main/webapp/feedback/";   
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSuggestion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id=request.getParameter("id");
		int idproduct=Integer.parseInt(id);
        if (id == null || id.isEmpty()) {
            response.getWriter().println("Product ID is required.");
            return;
        }

        try (Connection connection = ConnectionFactory.getConnection()) {
            // Step 1: Retrieve the image file name from the database using the product ID
            String selectSQL = "SELECT image FROM suggestion WHERE suggestionid = ?";
            String imageFileName = null;

            try (PreparedStatement selectStatement = connection.prepareStatement(selectSQL)) {
                selectStatement.setInt(1, idproduct);
                try (ResultSet resultSet = selectStatement.executeQuery()) {
                    if (resultSet.next()) {
                        imageFileName = resultSet.getString("image");
                    } else {
                        response.getWriter().println("Product not found.");
                        return;
                    }
                }
            }

            // Step 2: Delete the product from the database
            String deleteSQL = "DELETE FROM suggestion WHERE suggestionid = ?";
            try (PreparedStatement deleteStatement = connection.prepareStatement(deleteSQL)) {
                deleteStatement.setInt(1, idproduct);
                int rowsAffected = deleteStatement.executeUpdate();

                if (rowsAffected > 0) {
                    
                    if (imageFileName != null) {
                        File imageFile = new File(IMAGE_DIRECTORY + imageFileName);
                        if (imageFile.exists()) {
                            if (imageFile.delete()) {
                                response.getWriter().println("Product and image file deleted successfully.");
                                request.getRequestDispatcher("/message.jsp").forward(request, response);
                            } else {
                                response.getWriter().println("Product deleted but failed to delete the image file.");
                            }
                        } else {
                            response.getWriter().println("Product deleted but image file not found.");
                        }
                    }
                } else {
                    response.getWriter().println("Failed to delete product.");
                }
            }
        } catch (SQLException sqlEx) {
            sqlEx.printStackTrace();
            response.getWriter().println("SQL error: " + sqlEx.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
