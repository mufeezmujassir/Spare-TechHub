package Seller;

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
 * Servlet implementation class OrderedDetails
 */
public class OrderedDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderedDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<Orderrs> productList = new ArrayList<>();
		String username=request.getParameter("id");
		System.out.println(username);
		try(Connection connection=ConnectionFactory.getConnection();){
			try(PreparedStatement preparedStatement = connection.prepareStatement("SELECT productid, pname, price, quantity, address, username, image " +
                    "FROM orders WHERE productid IN (SELECT idproduct FROM product WHERE usrname=?)")){
				preparedStatement.setString(1, username);
				 try (ResultSet resultSet = preparedStatement.executeQuery()) {
	                 while (resultSet.next()) {
	                	 int ID=resultSet.getInt("productid");
	                	 System.out.println(ID);
	                     String pname=resultSet.getString("pname");
	                     double price=resultSet.getDouble("price");
	                     int quantity=resultSet.getInt("quantity");
	                     String address=resultSet.getString("address");
	                     String Username=resultSet.getString("username");
	                     String image=resultSet.getString("image");
	                     productList.add(new Orderrs(ID, pname, price,quantity, address,Username,image));
	                     
	                 } 
	                 request.setAttribute("productList", productList);
					request.getRequestDispatcher("/OrderDetailsforSeller.jsp").forward(request, response);
				
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
	public class Orderrs {
        private int productid;
        private String pname;
        private double Price;
        private int Quantity;
        private String Address;
        private String Username;
        private String Image;
        
       

		

	public Orderrs(int productid, String pname, double price, int quantity, String address, String username,
				String image) {
			super();
			this.productid = productid;
			this.pname = pname;
			Price = price;
			Quantity = quantity;
			Address = address;
			Username = username;
			Image = image;
			
		}



	public int getProductid() {
		return productid;
	}



	public String getPname() {
		return pname;
	}



	public double getPrice() {
		return Price;
	}



	public int getQuantity() {
		return Quantity;
	}



	public String getAddress() {
		return Address;
	}



	public String getUsername() {
		return Username;
	}



	public String getImage() {
		return Image;
	}




	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	}
}
