<%@page import="java.sql.*" %>

<%
    String id = request.getParameter("id");
    String nama = request.getParameter("nama");
    String harga = request.getParameter("harga");
    String stok = request.getParameter("stok");
    
    String connectionURL = "jdbc:mysql://localhost:8111/kue";
    Connection connection = null; 
    try {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(connectionURL, "root", "");
        String query = "UPDATE fun SET nama=?, harga=?, stok=? WHERE id = " + id + "";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, nama);
        statement.setString(2, harga);
        statement.setString(3, stok);
        int updatedQuery = statement.executeUpdate();
        if(updatedQuery != 0) {
            response.sendRedirect("readCostumers.jsp");
                }
            statement.close();
            connection.close();
    } catch (Exception e) {
    out.println(e.getMessage());
    }
   
%>
