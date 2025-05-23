package homeServlat;

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

import homeServlat.homeservlat.Product;
import JDBCConnection.ConnectionFactory;

/**
 * Servlet implementation class productDetails
 */
public class productDetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public productDetails() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Product> productList = new ArrayList<>();
        String productType = request.getParameter("id");  // Renamed 'username' to 'productType'
        System.out.println(productType);

        if (productType == null || productType.isEmpty()) {
            request.setAttribute("error", "Product ID is missing.");
            request.getRequestDispatcher("/home.jsp").forward(request, response);
            return;
        }

        // Query for fetching product details
        String selectQuery = "SELECT idproduct, pname, producttype, price, quantity, description, image FROM product WHERE producttype = ?;";

        try (Connection con = ConnectionFactory.getConnection(); 
             PreparedStatement ps = con.prepareStatement(selectQuery)) {

            ps.setString(1, productType);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    int idproduct = rs.getInt("idproduct");
                    String name = rs.getString("pname");
                    String producttype = rs.getString("producttype");
                    double price = rs.getDouble("price");
                    int quantity = rs.getInt("quantity");
                    String description = rs.getString("description");
                    String image = rs.getString("image");

                    productList.add(new Product(idproduct, name, producttype, price, quantity, description, image));
                }

                request.setAttribute("productList", productList);
                request.getRequestDispatcher("/productAll.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("norecord", "Database error: " + e.getMessage());
                request.getRequestDispatcher("/error.jsp").forward(request, response);  // Forward to a meaningful error page
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("norecord", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } catch (ClassNotFoundException e1) {
            e1.printStackTrace();
            request.setAttribute("norecord", "Class not found error: " + e1.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    // Inner class Product
    public class Product {
        private int idproduct;
        private String pname;
        private String producttype;
        private double price;
        private int quantity;
        private String description;
        private String image;

        public Product(int idproduct, String pname, String producttype, double price, int quantity, String description, String image) {
            this.idproduct = idproduct;
            this.pname = pname;
            this.producttype = producttype;
            this.price = price;
            this.quantity = quantity;
            this.description = description;
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

        public String getDescription() {
            return description;
        }

        public String getImage() {
            return image;
        }
    }
}
