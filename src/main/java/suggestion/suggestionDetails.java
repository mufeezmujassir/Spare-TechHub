package suggestion;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import JDBCConnection.ConnectionFactory;
import Seller.OrderedDetails.Orderrs;

/**
 * Servlet implementation class suggestionDetails
 */
public class suggestionDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public suggestionDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		ArrayList<suggestion> suggestions = new ArrayList<>();
		
		System.out.println(username);
		try(Connection connection=ConnectionFactory.getConnection();){
			try(PreparedStatement preparedStatement = connection.prepareStatement("SELECT suggestionid, suggestiontype, feedback, image, email, username, reply from suggestion where username=?")){
				preparedStatement.setString(1, username);
				 try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                 while (resultSet.next()) {
	                	 int suggestionid=resultSet.getInt("suggestionid");
	                	 System.out.println(suggestionid);
	                     String suggestiontype=resultSet.getString("suggestiontype");
	                     String feedback=resultSet.getString("feedback");
	                     String image=resultSet.getString("image");
	                     String email=resultSet.getString("email");
	                     String Username=resultSet.getString("username");
	                     String reply=resultSet.getString("reply");
	                     suggestions.add(new suggestion(suggestionid, suggestiontype, feedback,image, email,Username,reply));
	                     
	                 } 
	                 request.setAttribute("suggestions", suggestions);
					request.getRequestDispatcher("/suggest.jsp").forward(request, response);
				
	             }
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			System.out.println();
		
	}
	public class suggestion {
        private int suggestid;
        private String suggestiontype;
        private String feedback;
        private String image;
        private String email;
        private String username;
        private String reply;
		public int getSuggestid() {
			return suggestid;
		}
		public String getSuggestiontype() {
			return suggestiontype;
		}
		public String getFeedback() {
			return feedback;
		}
		public String getImage() {
			return image;
		}
		public String getEmail() {
			return email;
		}
		public String getUsername() {
			return username;
		}
		public String getReply() {
			return reply;
		}
		public suggestion(int suggestid, String suggestiontype, String feedback, String image, String email,
				String username, String reply) {
			super();
			this.suggestid = suggestid;
			this.suggestiontype = suggestiontype;
			this.feedback = feedback;
			this.image = image;
			this.email = email;
			this.username = username;
			this.reply = reply;
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
