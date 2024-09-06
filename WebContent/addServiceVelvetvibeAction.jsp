<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="bean.ServiceVelvetvibeBean" %>
<%@ page import="dao.ServiceVelvetvibeDAO" %>
<%
    String service_id = request.getParameter("service_id");
	String service_name = request.getParameter("service_name");
    String categoryId = request.getParameter("categoryId");
    String categoryName = request.getParameter("categoryName");
    String description = request.getParameter("description");
    String image1 = request.getParameter("image1");
    String image2 = request.getParameter("image2");
    String image3 = request.getParameter("image3");
    int amount_from = 0;
    int amount_to = 0;
    
    try {
        amount_from = Integer.parseInt(request.getParameter("amount_from"));
        amount_to = Integer.parseInt(request.getParameter("amount_to"));
    } catch (NumberFormatException e) {
        out.println("<script>alert('Invalid amount values.'); window.location='addServiceVelvetvibe.jsp';</script>");
        return;
    }
    
    ServiceVelvetvibeBean service = new ServiceVelvetvibeBean();
    service.setService_id(Integer.parseInt(service_id));
    service.setService_name(service_name);
    service.setCategoryId(Integer.parseInt(categoryId));
    service.setCategoryName(categoryName);
    service.setDescription(description);
    service.setImage1(image1);
    service.setImage2(image2);
    service.setImage3(image3);
    service.setAmount_from(amount_from);
    service.setAmount_to(amount_to);
    
    ServiceVelvetvibeDAO dao = new ServiceVelvetvibeDAO();
    boolean result = dao.addServiceVelvetvibe(service);
    
    if (result) {
        out.println("<script>alert('Service added successfully!'); window.location='viewServiceVelvetvibe.jsp';</script>");
    } else {
        out.println("<script>alert('Failed to add service.'); window.location='addServiceVelvetvibe.jsp';</script>");
    }
%>
