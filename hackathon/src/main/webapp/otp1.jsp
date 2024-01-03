<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String src = request.getParameter("sourcePage");
if (src !=null){
if (  (src.equals("transfer1.jsp"))){
	int otp=OTPGenerator.generateOTP();
	session.setAttribute("otp", otp);
	String username=request.getParameter("username");
	String password=request.getParameter("password");
	String amount=request.getParameter("amount");
	session.setAttribute("amount", amount);
	String ac=request.getParameter("account");
	String tac = request.getParameter("taccount");
	session.setAttribute("username", username);
	session.setAttribute("password", password);
	session.setAttribute("ac", ac);
	session.setAttribute("tac", tac);
	String cp=TextToHash.hash(password);
	String email="";
	String check="";
	String subject="FNB Banking: One-Time Password (OTP) Confirmation";
	String text="Dear User,\r\n"
			+ "\r\n"
			+ "We hope this email finds you well.\r\n"
			+ "\r\n"
			+ "As part of our ongoing commitment to maintaining the security and integrity of your account, please find below the One-Time Password (OTP) required for your recent transaction or login request:\r\n"
			+ "\r\n"
			+ "Your OTP:"+otp
			+ "\r\n"
			+ "Please enter this OTP on the FNB Banking platform to proceed. For security reasons, this OTP is valid for [XX minutes/hours], after which it will expire.\r\n"
			+ "\r\n"
			+ "Important:\r\n"
			+ "\r\n"
			+ "Do not share this OTP with anyone, including those claiming to be from FNB Banking.\r\n"
			+ "If you did not request this OTP or suspect any suspicious activity, please contact us immediately.\r\n"
			+ "Thank you for banking with FNB. We are dedicated to ensuring that your banking experience is seamless, secure, and pleasant.\r\n"
			+ "\r\n"
			+ "Best Regards,\r\n"
			+ "\r\n"
			+ "The FNB Banking Team\r\n";
			try {
			    // Load the MySQL JDBC driver
			    Class.forName("com.mysql.jdbc.Driver");

			    // Connect to the MySQL database (replace with your database URL, username, and password)
			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "rudr@g0lu");
			    String query = "SELECT * FROM user WHERE username = ?";
			    PreparedStatement ps = con.prepareStatement(query);
			    ps.setString(1, username);
			    // Execute the SQL statement
			    ResultSet rs = ps.executeQuery();  
			    if (rs.next())
			    {
			    email= rs.getString(4);
			    check=rs.getString(3);
			    }
			}
			catch (Exception e) {
			    out.println("An error occurred: " + e);
			}
			if (!check.equals(cp)){
				out.println("<html><head><script>alert('Invalid Credentials. Please try again.');window.location.href='transfer1.jsp';</script></head></html>");
				return;
			}
	SendMail.mailuser(subject, text, email);
	subject="Important: Recent Activity on Your FNB Banking Account";
    text="Dear User,\r\n"
			+ "\r\n"
			+ "We noticed some recent activity on your FNB Banking account and wanted to make sure it was you.\r\n"
			+ "\r\n"
			+ "Details of the activity:\r\n"
			+ "\r\n"
			+ "Location: Your College\r\n"
			+ "Time: Look at Bottom right\r\n"
			+ "Device: From the same Laptop\r\n"
			+ "If this was you, please confirm the activity by Doing Nothing.\r\n"
			+ "\r\n"
			+ "If you did not recognize this activity, it's important for you to recoginze immediately:\r\n"
			+ "\r\n"
			+ "Contact our support team at fnbbanking@gmail.com or +919963218741 for further assistance and to report the activity."
			+ "\r\n"
			+ "Best Regards,\r\n"
			+ "\r\n"
			+ "The FNB Banking Team\r\n";
    SendMail.mailuser(subject, text, email);
}
}

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Input</title>
    <style>
        @keyframes fadeIn {
            0% {
                opacity: 0;
            }

            100% {
                opacity: 1;
            }
        }

    body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    overflow: hidden;
}

body::before {
    content: "";
    background-image: url('images/bank.jpg');
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    filter: opacity(0.5); /* Makes the image transparent */
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    z-index: -1; /* Place it behind the content */
}



        .otp-container {
	    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
	    background: rgba(255, 255, 255, 1);  /* semi-transparent white */
	    padding: 40px 50px;
	    border-radius: 8px;
	    width: 300px;
	    animation: fadeIn 1s;
}

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 10px;
        }

        h2 {
            margin: 10px 0 20px;
            color: #333;
            text-align: center;
        }

        p {
            color: #555;
            text-align: center;
            margin-bottom: 20px;
        }

        .otp-input {
            width: 100%;
            padding: 15px;
            font-size: 16px;
            border: 1px solid #e0e0e0;
            border-radius: 5px;
            text-align: center;
            box-sizing: border-box;
            margin-bottom: 20px;
            transition: border 0.3s ease;
        }

        .otp-input:focus {
            border-color: #007BFF;
            outline: none;
        }

        .otp-submit-btn {
            width: 100%;
            padding: 15px;
            border: none;
            background-color: #007BFF;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .otp-submit-btn:hover {
            background-color: #0056b3;
        }

    </style>
</head>

<body>
    <form action="transfer.jsp" method="post">
        <div class="otp-container">
            <h1>FNB Banking</h1>
            <h2>Enter OTP</h2>
            <p>Please validate the OTP sent to your registered email.</p>
            <input type="number" name="userOtp" class="otp-input" placeholder="Enter 6-digit OTP" maxlength="6" minlength="6">
            <button type="submit" class="otp-submit-btn">Submit</button>
        </div>
    </form>
</body>

</html>
<%@ page import="com.sumeet.SendMail"%>
<%@ page import="com.sumeet.OTPGenerator"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="com.sumeet.TextToHash"%>

