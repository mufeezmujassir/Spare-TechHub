package Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import orderproduct.OrdersProduct.Orderrs;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import JDBCConnection.ConnectionFactory;

/**
 * Servlet implementation class selectUser
 */
public class selectUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<user> users = new ArrayList<>();
		String username=request.getParameter("username");
		try(Connection connection=ConnectionFactory.getConnection();){
			try(PreparedStatement preparedStatement = connection.prepareStatement("select username,name,address,dob, gender, email, phone,type from user")){
				
				 try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                 while (resultSet.next()) {
	                	 String Username=resultSet.getString("username");
	                	 System.out.println(Username);
	                	 String Name=resultSet.getString("name");
	                	 String Address=resultSet.getString("address");
	                	 String Dob=resultSet.getString("dob");
	                	 String Gender=resultSet.getString("gender");
	                	 String Email=resultSet.getString("email");
	                	 String Phone=resultSet.getString("phone");
	                	 String Type=resultSet.getString("type");
	                	 users.add(new user(Username, Name, Address,Dob, Gender,Email,Phone,Type));
	                     
	                 } 
	                 request.setAttribute("userList", users);
					request.getRequestDispatcher("/adminDashboard.jsp").forward(request, response);
				
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
	public class user {
        private String username;
        private String name;
        private String address;
        private String dob;
        private String gender;
        private String email;
        private String phone;
        private String type;
        
       

		

	

	public String getUsername() {
			return username;
		}







		public String getName() {
			return name;
		}







		public String getAddress() {
			return address;
		}







		public String getDob() {
			return dob;
		}







		public String getGender() {
			return gender;
		}







		public String getEmail() {
			return email;
		}







		public String getPhone() {
			return phone;
		}







		public String getType() {
			return type;
		}







	public user(String username, String name, String address, String dob, String gender, String email, String phone,
				String type) {
			super();
			this.username = username;
			this.name = name;
			this.address = address;
			this.dob = dob;
			this.gender = gender;
			this.email = email;
			this.phone = phone;
			this.type = type;
		}







	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}}
