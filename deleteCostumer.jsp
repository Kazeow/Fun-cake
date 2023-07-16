<%@page import="java.sql.*"%>

<%
String id = request.getParameter("id");

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection(
        "jdbc:mysql://localhost:8111/kue",
        "root",
        "");
    String query = "DELETE FROM fun WHERE id=" + id + "";
    PreparedStatement preparedStatement = connection.prepareStatement(query);
    preparedStatement.executeUpdate();
    response.sendRedirect("readCostumers.jsp");
} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("readCostumers.jsp");
}
%>
