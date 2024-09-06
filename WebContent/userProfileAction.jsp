<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="dao.UserProfileDAO" %>
<%@ page import="bean.UserProfileBean" %>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.io.IOException"%>
<%@ page import="javax.servlet.ServletException"%>

<%
    HttpSession httpsession = request.getSession(false);

    // Check if the session exists and if the user is logged in
    if (httpsession == null || session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Retrieve the email from the session
    String email = (String) httpsession.getAttribute("email");
    UserProfileDAO userDAO = new UserProfileDAO();
    UserProfileBean user = userDAO.getUserByEmail(email);

    if (user == null) {
        response.sendRedirect("userProfile.jsp?message=User+not+found.");
        return;
    }

    // Retrieve form data from the request
    String fullName = request.getParameter("fullName");
    String dob = request.getParameter("dob");
    String address = request.getParameter("address");
    String mobileNumber = request.getParameter("mobileNumber");

    // Set updated details in the UserProfileBean
    user.setFullName(fullName);
    user.setDob(java.sql.Date.valueOf(dob)); // Assuming dob is in yyyy-mm-dd format
    user.setAddress(address);
    user.setMobileNumber(mobileNumber); // Set mobile number

    // Update the user profile in the database
    boolean updated = userDAO.insertOrUpdateUserProfile(user);

    // Provide feedback to the user and redirect accordingly
    if (updated) {
        response.sendRedirect("userProfile.jsp?message=Profile+updated+successfully");
    } else {
        response.sendRedirect("userProfile.jsp?message=Failed+to+update+profile");
    }
%>
