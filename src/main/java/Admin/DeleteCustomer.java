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
 * Servlet implementation class DeleteCustomer
 */
public class DeleteCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCustomer() {
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
        String username = request.getParameter("username");

       
        if (username == null || username.isEmpty()) {
            request.setAttribute("error", "Username is missing.");
            request.getRequestDispatcher("/home.jsp").forward(request, response);
            return;
        }

        // Load the JDBC driver
        

        // Connect to the database and execute the query
        String deleteQuery = "DELETE FROM user WHERE username = ?;";
        try (Connection con =ConnectionFactory.getConnection();PreparedStatement ps = con.prepareStatement(deleteQuery)) {
           
       
                ps.setString(1, username);
                int rowsAffected = ps.executeUpdate(); // Use executeUpdate for DELETE

                if (rowsAffected > 0) {
                    // Record deleted successfully
                    request.setAttribute("message", "User deleted successfully.");
                    request.getRequestDispatcher("/deleteCustomersorSellers.jsp").forward(request, response);
                } else {
                    // User not found
                    request.setAttribute("error", "Username not found. Please try again!");
                    request.getRequestDispatcher("/home.jsp").forward(request, response);
                }
            } catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	}

}
