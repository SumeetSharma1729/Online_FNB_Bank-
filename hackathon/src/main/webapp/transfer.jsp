<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FNB Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>
       
        .container {
            max-width: 600px;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white for a light overlay on the gradient */
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 5px 10px rgba(0,0,0,0.3);
            transition: transform 0.3s;
            margin : 100px auto;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 24px;
        }

        p {
            text-align: center;
            color: #555;
        }

        .button {
            display: block;
            width: 100%;
            padding: 10px;
            background: #2c3e50;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .button:hover {
            background: #1a242f;
        }
        a{
		text-decoration: none; 
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
out.println(ch);
if (!ch.equals(cotp)){
	out.println("<html><head><script>alert('Invalid OTP. Please try again.');window.location.href='otp.jsp';</script></head></html>");
    return;
}
String ac=(String) session.getAttribute("ac");;
String username=(String) session.getAttribute("username");
String password=(String) session.getAttribute("password");
String amount=(String) session.getAttribute("amount");
String tac = (String) session.getAttribute("tac");
String bac="0";
String btac="0";
String fa="0" ,fb="0";

long am=Long.parseLong(amount);
long a=0;
long b=0;
try {
    // Load the MySQL JDBC driver
    Class.forName("com.mysql.jdbc.Driver");

    // Connect to the MySQL database (replace with your database URL, username, and password)
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "rudr@g0lu");

    // Prepare an SQL statement to retrieve user data based on the provided username and password
    String query = "SELECT * FROM user WHERE username = ? AND ac = ?";
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, username);
    ps.setString(2, ac);

    ResultSet rs = ps.executeQuery();
    if (rs.next())
    {
    	bac= rs.getString(5);
		a=Long.parseLong(bac);
    }
    
} catch (Exception e) {
    out.println("An error occurred: " + e);

}
if (am > a){
		out.println("<html><head><script>alert('Hey, your wallets on a diet! Fatten it up before making a transfer! ');window.location.href='transfer1.jsp';</script></head></html>");
return ;
}

try {
    // Load the MySQL JDBC driver
    Class.forName("com.mysql.jdbc.Driver");

    // Connect to the MySQL database (replace with your database URL, username, and password)
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "rudr@g0lu");

    // Prepare an SQL statement to retrieve user data based on the provided username and password
    String query = "SELECT * FROM user WHERE ac = ?";
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, tac);

    ResultSet rs = ps.executeQuery();
    if (rs.next())
    {
    	btac= rs.getString(5);
    	
		b=Long.parseLong(btac);
    }
    
} catch (Exception e) {
    out.println("An error occurred: " + e);
}


fa =String.valueOf( a-am );
fb =String.valueOf( b+am );
try {
    // Load the MySQL JDBC driver
    Class.forName("com.mysql.jdbc.Driver");

    // Connect to the MySQL database (replace with your database URL, username, and password)
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "rudr@g0lu");

    // Prepare an SQL statement to retrieve user data based on the provided username and password
    String query = "UPDATE user SET amount= ? WHERE ac = ?";
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, fa);
    ps.setString(2, ac);

    ps.executeUpdate();
    
    
} catch (Exception e) {
    out.println("An error occurred: " + e);
}
try {
    // Load the MySQL JDBC driver
    Class.forName("com.mysql.jdbc.Driver");

    // Connect to the MySQL database (replace with your database URL, username, and password)
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "rudr@g0lu");

    // Prepare an SQL statement to retrieve user data based on the provided username and password
    String query = "UPDATE user SET amount= ? WHERE ac = ?";
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, fb);
    ps.setString(2, tac);

    ps.executeUpdate();
    
    
} catch (Exception e) {
    out.println("An error occurred: " + e);
}

%>

<div class="container">
        <h1>Successful Transfer!</h1>
        <p>Your money has been successfully transferred.</p>
        <p>If you have any queries or require further assistance, please <a href="about.jsp">contact us</a>.</p>
        <a href="index.html"><button class="button">Return to Dashboard</button></a>
</div>


</body>
</html>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.sumeet.TextToHash"%>
