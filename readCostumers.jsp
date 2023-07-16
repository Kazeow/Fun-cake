<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Fun Cake</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <style>
    body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    }

    header {
        background-color: #333;
        padding: 20px;
        color: #fff;
    }

    h1 {
        margin: 0;
    }

    nav ul {
        list-style-type: none;
        padding: 0;
    }

    nav ul li {
        display: inline;
        margin-right: 10px;
    }

    nav ul li a {
        color: #fff;
        text-decoration: none;
    }

    footer {
        background-color: #333;
        padding: 10px;
        color: #fff;
        text-align: center;
    }
    table {
        color: #333;
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 10px;
        border: 1px solid #ddd;
    }

    a {
        margin-right: 10px;
        text-decoration: none;
        color: #fff;
    }   

    .btn-delete {
        background-color: #dc3545;
        color: #fff;
    }

    .btn-update {
        background-color: #17a2b8;
        color: #fff;
    }
    .btn-delete, .btn-update {
        transition: background-color 0.3s ease;
    }

    .btn-delete:hover, .btn-update:hover {
        background-color: #333;
    }
    .objek {
        background-color: #28a745;
        color: #fff;
        border: none;
        padding: 6px 12px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        border-radius: 4px;
        cursor: pointer;
    }

    .objek:hover {
        background-color: #218838;
    }
    h2{
    text-align: center;
    }
    </style>
</head>
<body>
    <header>
    <h1>Fun Cake</h1>
    <nav>
      <ul>
        <li><a href="Home.html">Beranda</a></li>
        <li><a href="Produk.html">Produk</a></li>
         <li><a href="readCostumers.jsp">List Produk</a></li>
        <li><a href="Profile.html">Profile</a></li>
      </ul>
    </nav>
    </header>
    <h2>List Produk</h2>
    <form action="" method="post">
    <%@page import="java.sql.*" %>
    <% 
    try {
        String databaseURL = "jdbc:mysql://localhost:8111/kue"; // URL ke database
        String userNameDB = "root"; // Username untuk database
        String passWordDB = ""; // Password untuk database
        Class.forName("com.mysql.jdbc.Driver"); // Driver
        Connection connection = DriverManager.getConnection(databaseURL, userNameDB, passWordDB);
        Statement statement = connection.createStatement();
        String query = "SELECT * FROM fun";
        ResultSet resultSet = statement.executeQuery(query);
    %>
    <table>
        <thead>
            <tr>
                <th>nama</th>
                <th>harga</th>
                <th>stok</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
            while(resultSet.next()) {
            %>
            <tr>
                <td><%out.println(resultSet.getString("nama"));%></td>
                <td><%out.println(resultSet.getString("harga"));%></td>
                <td><%out.println(resultSet.getString("stok"));%></td>
                <td>
                    <a href="updateCostumers.jsp?id=<% out.println(resultSet.getString("id"));%>" class="btn-update">Update</a>
                    <a href="deleteCostumer.jsp?id=<% out.println(resultSet.getString("id"));%>" class="btn-delete">Delete</a>
                </td>
            </tr> 
            <%
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch(Exception e) {}
    %>
        </tbody>
    </table>
        <br>
    <a href="createCostumers.jsp" class="objek">Tambah Barang</a>
    <br>
    <br>
    <footer>
      <p>HUBUNGI KAMI : 0858764733 <br>INSTAGRAM  : xzcsise <br> FACEBOK   : Human</p>
    </footer>
</body>
</html>
