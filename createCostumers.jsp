<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Customer</title>
   <style>
  body {
    font-family: Arial, sans-serif;
    margin: 20px;
    background-color: #f1f1f1;
    color: #333;
}

h1 {
    color: #333;
    text-align: center;
}

form {
    max-width: 400px;
    margin: 0 auto;
}

label {
    display: block;
    margin-top: 10px;
    color: #333;
}

input[type="text"],
input[type="password"],
input[type="submit"] {
    width: 100%;
    padding: 5px;
    color: #333;
}

input[type="submit"] {
    margin-top: 20px;
    padding: 10px 20px;
    background-color: #333;
    color: #fff;
    border: none;
    cursor: pointer;
}

.error-message {
    color: #dc3545;
    margin-top: 10px;
}

.success-message {
    color: #28a745;
    margin-top: 10px;
}

.read-customers-link {
    display: block;
    text-align: center;
    margin-top: 20px;
    color: #333;
}

    </style>
    
    </head>
    <body>
        <h1>Tambahkan Produk Disini</h1>
        <form action="" method="post">
            <label>nama:
                <input type="text" name="nama">                
            </label>
            <label>harga:
                <input type="text" name="harga">
            </label>
            <label>stok:
                <input type="text" name="stok">
            </label>
            <input type="submit" name="createCustomer" value="Tambah">
            
            <%@ page import="java.sql.*" %>
            <%@ page import="javax.swing.*" %>
            
            <% 
            String nama = request.getParameter("nama");
            String harga = request.getParameter("harga");
            String stok = request.getParameter("stok");
            
            if (nama != null && harga != null && stok != null &&
                !nama.isEmpty() && !harga.isEmpty() && !stok.isEmpty()) {
                Connection connection = null;
                PreparedStatement statement = null;
                ResultSet resultSet = null;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    connection = DriverManager.getConnection(
                        "jdbc:mysql://localhost:8111/kue",
                        "root",
                        ""
                    );
                    
                    String query = "INSERT INTO fun (nama, harga, stok) VALUES (?, ?, ?)";
                    statement = connection.prepareStatement(query);
                    statement.setString(1, nama);
                    statement.setString(2, harga);
                    statement.setString(3, stok);
                    
                    int updatedQuery = statement.executeUpdate();
                    
                    if (updatedQuery != 0) {
                        out.println("<p class='success-message'>Customer created successfully</p>");
                        response.sendRedirect("readCostumers.jsp");
                    }
                } catch (Exception e) {
                    out.println("<p class='error-message'>Error: " + e.getMessage() + "</p>");
                    e.printStackTrace();
                } finally {
                    try {
                        if (resultSet != null) {
                            resultSet.close();
                        }
                        if (statement != null) {
                            statement.close();
                        }
                        if (connection != null) {
                            connection.close();
                        }
                    } catch (SQLException e) {
                        out.println("<p class='error-message'>Error closing database connection: " + e.getMessage() + "</p>");
                        e.printStackTrace();
                    }
                }
            }
            %>
        </form>
        <a href="readCostomers.jsp" class="objek"></a>
    </body>
</html>
