package com.sumeet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Statement;

@WebServlet("/balance")
public class CheckBalance {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get user inputs from the registration form
        String account=request.getParameter("account");	
        String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Connect to the MySQL database (replace with your database URL, username, and password)
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hackathon", "root", "rudr@g0lu");
            String query= "SELECT * FROM user where ac=account ";
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery(query);  
            out.print("WELCOME! YOUR ACCOUNT HAS Balance ="+rs.getString(5));
			RequestDispatcher rd=request.getRequestDispatcher("balance.jsp");
			rd.include(request, response);
			}
		catch (Exception e) {
            out.println("An error occurred: " + e);
        }
	}
}
