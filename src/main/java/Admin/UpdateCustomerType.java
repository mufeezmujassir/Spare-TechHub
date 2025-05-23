package Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import JDBCConnection.ConnectionFactory;

/**
 * Servlet implementation class UpdateCustomerType
 */
public class UpdateCustomerType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomerType() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
        String type=request.getParameter("type");
        
        String updateQuery = null ;
      
        
        	updateQuery = "UPDATE user SET type=? WHERE username=?;";
        	
       
        try (Connection con = ConnectionFactory.getConnection();PreparedStatement ps = con.prepareStatement(updateQuery)) {
          
            
                ps.setString(1, type);
                ps.setString(2, username);
               

                int rowsUpdated = ps.executeUpdate();
                if (rowsUpdated > 0) {
                   
                    request.getRequestDispatcher("/convertCustomersorSellers.jsp").forward(request, response);
                } else {
                    // User not found
                    
                    
                    request.getRequestDispatcher("/convertCustomersorSellers.jsp").forward(request, response);
                }
            } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
