package homeServlat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

import homeServlat.productDetails.Product;
import JDBCConnection.ConnectionFactory;
/**
 * Servlet implementation class homeservlat
 */
public class homeservlat extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public homeservlat() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
    	Random rand=new Random();
    	int value;
    	ArrayList<Product> productList = new ArrayList<>();
		String username = request.getParameter("id");
		System.out.println(username);
		if (username == null || username.isEmpty()) {
			request.setAttribute("error", "productid is missing.");
			request.getRequestDispatcher("/home.jsp").forward(request, response);
			return;
		}

	
		

		// Connect to the database and execute the query
		String selectQuery = "SELECT idproduct,pname, producttype, price, quantity, description, image FROM product";
		try (Connection con =ConnectionFactory.getConnection();PreparedStatement ps = con.prepareStatement(selectQuery)) {
					
					try (ResultSet rs = ps.executeQuery()) {
						while (rs.next()) {
							// Retrieve user details
							int idproduct = rs.getInt("idproduct");
							System.out.println(idproduct);
							String name = rs.getString("pname");
							System.out.println(name);
							String producttype = rs.getString("producttype");
							String price = rs.getString("price");
							String quantity = rs.getString("quantity");
							String description = rs.getString("description");
							String image = rs.getString("image");
							double Price=Double.parseDouble(price);
							int Quantity=Integer.parseInt(quantity);
							System.out.println(idproduct);
							// Set attributes and forward to profile page
							productList.add(new Product(idproduct, name, producttype,Price, Quantity,description,image));
							
						} 
						request.setAttribute("productList", productList);
						request.getRequestDispatcher("/productAll.jsp").forward(request, response);
					}
					catch (SQLException e) {
						e.printStackTrace();
						request.setAttribute("norecord", "Database error: " + e.getMessage());
			            request.getRequestDispatcher("/register.jsp").forward(request, response);
					}
				}
				catch (SQLException e) {
					e.printStackTrace();
					request.setAttribute("norecord", "Database error: " + e.getMessage());
		            request.getRequestDispatcher("/register.jsp").forward(request, response);
				} catch (ClassNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			
			
		
	}
	public class Product {
        private int idproduct;
        private String pname;
        private String producttype;
        
        private double price;
        private int quantity;
        private String decription;
        
        private String image;

		public Product(int idproduct, String pname, String producttype, double price, int quantity, String decription,
				String image) {
			super();
			this.idproduct = idproduct;
			this.pname = pname;
			this.producttype = producttype;
			this.price = price;
			this.quantity = quantity;
			this.decription = decription;
			this.image = image;
		}

		public int getIdproduct() {
			return idproduct;
		}

		public String getPname() {
			return pname;
		}

		public String getProducttype() {
			return producttype;
		}

		public double getPrice() {
			return price;
		}

		public int getQuantity() {
			return quantity;
		}

		public String getDecription() {
			return decription;
		}

		public String getImage() {
			return image;
		}
        
       
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	
}
