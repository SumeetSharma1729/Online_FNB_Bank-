
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FNB Banking..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>
        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
        }

        .account-details {
            list-style-type: none;
            padding: 0;
        }

        .account-details li {
            padding: 10px 15px;
            border: 1px solid #ddd;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .account-details li:hover {
            background-color: #e9e9e9;
        }

        .label {
            font-weight: bold;
            margin-right: 10px;
            color: #666;
        }

    </style>
</head>
<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

<nav class="head navbar k navbar-expand-lg navbar-dark"  >
  <div class="container-fluid">
    <a class="navbar-brand" href="index.html">FNB Bank</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav mx-5">
        <li class="nav-item mx-5">
          <a class="nav-link" href="create.html">New Account</a>
        </li>
        <li class="nav-item mx-5">
          <a class="nav-link" href="balance1.jsp">Balance</a>
        </li>
        <li class="nav-item mx-5">
          <a class="nav-link" href="deposit1.jsp">Deposit</a>
        </li>
        
        <li class="nav-item mx-5">
          <a class="nav-link" href="transfer1.jsp">Transfer</a>
        </li>
        <li class="nav-item mx-5">
          <a class="nav-link" href="closeac1.jsp">Close Account</a>
        </li>
        <li class="nav-item mx-5">
          <a class="nav-link" href="about.jsp">About Us</a>
        </li>
        
      </ul>
    </div>
  </div>
</nav>

<%
int otp = (Integer) session.getAttribute("otp");
String cotp= request.getParameter("userOtp"); 
String ch=Integer.toString(otp);
if (!ch.equals(cotp)){
	out.println("<html><head><script>alert('Invalid OTP. Please try again.');window.location.href='otp.jsp';</script></head></html>");
    return;
}
String ac=(String) session.getAttribute("ac");;
String username=(String) session.getAttribute("username");
String password=(String) session.getAttribute("password");
String amount=(String) session.getAttribute("amount");
String name="User";
String balance="0";
String b="0";
String cp=TextToHash.hash(password);
String check="";

try {
    // Load the MySQL JDBC driver
    Class.forName("com.mysql.jdbc.Driver");

    // Connect to the MySQL database (replace with your database URL, username, and password)
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "rudr@g0lu");
    String query = "SELECT * FROM user WHERE username = ? AND ac = ?";
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, username);
    ps.setString(2, ac);
    // Execute the SQL statement
    ResultSet rs = ps.executeQuery();  
    if (rs.next())
    {
    name= rs.getString(2);
    balance=rs.getString(5);
    check=rs.getString(3);
    }
}
catch (Exception e) {
    out.println("An error occurred: " + e);
}

if (!check.equals(cp)){
	out.println("<html><head><script>alert('Invalid Credentials. Please try again.');window.location.href='balance1.jsp';</script></head></html>");

}
try {
    // Load the MySQL JDBC driver
    Class.forName("com.mysql.jdbc.Driver");

    // Connect to the MySQL database (replace with your database URL, username, and password)
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "rudr@g0lu");
    long l=Long.parseLong(amount);
    long m=Long.parseLong(balance);
    b=String. valueOf( l+m );	
    String q2 = "UPDATE user SET amount= ? WHERE username = ? AND ac = ?";
    PreparedStatement p = con.prepareStatement(q2);
    p.setString(1, b);
    p.setString(2, username);
    p.setString(3, ac);
    p.executeUpdate();
}
catch (Exception e) {
    out.println("An error occurred: " + e);
}


%>
  <div class="container">
        <h1>Account Details</h1>
        <ul class="account-details">
        	<li><span class="label">Account-No:</span> <% out.print(ac); %> </li>
            <li><span class="label">Name:</span> <% out.print(name); %> </li>
             <li><span class="label">Balance:</span><% 
            		 
             		 out.print(b); %></li>
        </ul>
    </div>
</body>
</html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.sumeet.TextToHash"%>

