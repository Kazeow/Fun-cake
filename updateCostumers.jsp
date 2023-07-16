<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Customer</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
              crossorigin="anonymous">
        
        <style>
            body {
                margin: 20px;
            }
            
            form {
                max-width: 400px;
                margin: 0 auto;
            }
            
            label {
                display: block;
                margin-bottom: 10px;
            }
            
            input[type="text"] {
                width: 100%;
                padding: 8px;
                font-size: 16px;
                border-radius: 4px;
                border: 1px solid #ccc;
            }
            
            input[type="submit"] {
                display: block;
                width: 100%;
                padding: 10px;
                font-size: 16px;
                color: #fff;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            
            h1 {
                text-align: center;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%
            String id = request.getParameter("id");
            
            try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
            "jdbc:mysql://localhost:8111/kue",
                "root",
                ""
            );
                
          
            Statement statement = connection.createStatement();
            String query = "SELECT * FROM fun WHERE id=" + id + "";
            ResultSet resultSet = statement.executeQuery(query);
            while(resultSet.next()) {
           
                
        %>
        
        <form class="form" action="proccessUpdate.jsp" method="post">  
            <h1>Update Customer</h1>
            <input type="hidden" name="id" value="<%out.println(resultSet.getString("id"));%>">
            <label>Nama:
                <input type="text" name="nama" value="<%out.println(resultSet.getString("nama"));%>">
            </label>
            <label>Harga:
                <input type="text" name="harga" value="<%out.println(resultSet.getString("harga"));%>">
            </label>
            <label>Stok:
                <input type="text" name="stok" value="<%out.println(resultSet.getString("stok"));%>">
            </label>
            <input type="submit" name="createCustomer">
        </form>
        
        <%
               }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) { out.println(e.getMessage());}
        %>

        
    </body>
</html>
