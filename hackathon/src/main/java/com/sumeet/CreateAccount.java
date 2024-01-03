package com.sumeet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/create")
public class CreateAccount extends HttpServlet {
    private static final long serialVersionUID = 1L;
    String phone;
    long ac;
    public String getPhone() {
		return phone;
	}

	public long getAc() {
		return ac;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get user inputs from the registration form
        String username=request.getParameter("username");
		String password=request.getParameter("password");
		String cpassword=request.getParameter("cpassword");
		String amount=request.getParameter("amount");
		String address=request.getParameter("address");	
		String email=request.getParameter("email");
		phone=request.getParameter("phone");
	     if (!password.equals(cpassword)) {
	            out.println("<html><head><script>alert('Invalid credentials. Please try again.');window.location.href='create.html';</script></head></html>");
	            return;
	        }
	    String p=TextToHash.hash(password);
		ac= RandomNumberGenerator.generateUnique12DigitNumber();
		String text="Dear User,\r\n"
				+ "\r\n"
				+ "I hope this message finds you well. On behalf of FNB Bank, I'd like to extend our heartfelt appreciation for choosing us as your banking partner.\r\n"
				+ "\r\n"
				+ "For your reference and convenience, we'd like to remind you of your account details:\r\n"
				+ "\r\n"
				+ "Account Number:"+ac
				+ "\r\n"
				+ "At FNB Bank, we value the trust you place in us, and we're committed to ensuring that your banking experience is seamless and satisfactory. If there's anything you'd like assistance with or if you have any questions, please don't hesitate to reach out to our dedicated customer service team.\r\n"
				+ "\r\n"
				+ "Thank you for being a part of the FNB Bank family. We look forward to serving all your banking needs in the future.\r\n"
				+ "\r\n"
				+ "Warm regards,\r\n"
				+ "\r\n"
				+ "FNB Bank";
		SendMail.mailuser("Thank You for Banking with FNB", text,email);
		
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the MySQL database (replace with your database URL, username, and password)
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "rudr@g0lu");

            // Prepare an SQL statement to insert user data into the database
            String query = "INSERT INTO user (username, password, email, amount, address, phone, ac) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,username);
			ps.setString(2,p);
			ps.setString(3,email);
			ps.setString(4,amount);
			ps.setString(5,address);
			ps.setString(6,phone);
			ps.setLong(7, ac);

            // Execute the SQL statement to insert the user data
            ps.executeUpdate() ;
          
            // Close the database connection
            RequestDispatcher rd=request.getRequestDispatcher("index.html");
            rd.include(request, response);
            con.close();
        } catch (Exception e) {
            out.println("An error occurred: " + e);
        }
    }
}

