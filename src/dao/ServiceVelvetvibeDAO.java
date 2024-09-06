package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import bean.ServiceVelvetvibeBean;
import dbconnection.DBConnection;

public class ServiceVelvetvibeDAO {

	public boolean addServiceVelvetvibe(ServiceVelvetvibeBean serviceVelvetvibe) {
	    // SQL to insert into service_velvetvibe table
	    String sql = "INSERT INTO service_velvetvibe (service_id, service_name, categoryId, categoryName, description, image1, image2, image3, amount_from, amount_to) "
	               + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        // Fetch service name from the service table
	        String serviceName = getServiceName(serviceVelvetvibe.getService_id(), conn);
	        // Fetch category name from the service_category table
	        String categoryName = getCategoryName(serviceVelvetvibe.getCategoryId(), conn);

	        // Setting values for the prepared statement
	        stmt.setInt(1, serviceVelvetvibe.getService_id());
	        stmt.setString(2, serviceName);  // Fetching and setting the service name
	        stmt.setInt(3, serviceVelvetvibe.getCategoryId());
	        stmt.setString(4, categoryName); // Fetching and setting the category name
	        stmt.setString(5, serviceVelvetvibe.getDescription());
	        stmt.setString(6, serviceVelvetvibe.getImage1());
	        stmt.setString(7, serviceVelvetvibe.getImage2());
	        stmt.setString(8, serviceVelvetvibe.getImage3());
	        stmt.setDouble(9, serviceVelvetvibe.getAmount_from());
	        stmt.setDouble(10, serviceVelvetvibe.getAmount_to());

	        // Executing the update
	        int rowsInserted = stmt.executeUpdate();
	        return rowsInserted > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}

	// Method to get the service name based on service_id
	private String getServiceName(int serviceId, Connection conn) throws SQLException {
	    String sql = "SELECT service_name FROM services WHERE service_id = ?";
	    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setInt(1, serviceId);
	        try (ResultSet rs = stmt.executeQuery()) {
	            if (rs.next()) {
	                return rs.getString("service_name");
	            }
	        }
	    }
	    return null;
	}

	// Method to get the category name based on categoryId
	private String getCategoryName(int categoryId, Connection conn) throws SQLException {
	    String sql = "SELECT categoryName FROM service_category WHERE categoryId = ?";
	    try (PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setInt(1, categoryId);
	        try (ResultSet rs = stmt.executeQuery()) {
	            if (rs.next()) {
	                return rs.getString("categoryName");
	            }
	        }
	    }
	    return null;
	}



    // Method to retrieve all services from service_velvetvibe table
    public List<ServiceVelvetvibeBean> getAllServiceVelvetvibe() {
        List<ServiceVelvetvibeBean> services = new ArrayList<>();
        String sql = "SELECT svv.*, s.service_name, sc.categoryName, "
                + "CAST(svv.amount_from AS DOUBLE) AS amount_from, "
                + "CAST(svv.amount_to AS DOUBLE) AS amount_to "
                + "FROM service_velvetvibe svv "
                + "JOIN services s ON svv.service_id = s.service_id "
                + "JOIN service_category sc ON svv.categoryId = sc.categoryId";

        		try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                ServiceVelvetvibeBean service = new ServiceVelvetvibeBean();
                service.setServicevv_id(rs.getInt("servicevv_id"));
                service.setService_id(rs.getInt("service_id"));
                service.setService_name(rs.getString("service_name"));
                service.setCategoryId(rs.getInt("categoryId"));
                service.setCategoryName(rs.getString("category_name"));
                service.setDescription(rs.getString("description"));
                service.setImage1(rs.getString("image1"));
                service.setImage2(rs.getString("image2"));
                service.setImage3(rs.getString("image3"));
                service.setAmount_from(rs.getDouble("amount_from"));
                service.setAmount_to(rs.getDouble("amount_to"));

                services.add(service);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return services;
    }

    // Method to update a service
    public boolean updateServiceVelvetvibe(ServiceVelvetvibeBean serviceVelvetvibe) {
        String sql = "UPDATE service_velvetvibe SET service_id = ?, categoryId = ?, description = ?, image1 = ?, image2 = ?, image3 = ?, "
                   + "amount_from = ?, amount_to = ? WHERE servicevv_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, serviceVelvetvibe.getService_id());
            stmt.setInt(2, serviceVelvetvibe.getCategoryId());
            stmt.setString(3, serviceVelvetvibe.getDescription());
            stmt.setString(4, serviceVelvetvibe.getImage1());
            stmt.setString(5, serviceVelvetvibe.getImage2());
            stmt.setString(6, serviceVelvetvibe.getImage3());
            stmt.setDouble(7, serviceVelvetvibe.getAmount_from());
            stmt.setDouble(8, serviceVelvetvibe.getAmount_to());
            stmt.setInt(9, serviceVelvetvibe.getServicevv_id());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public List<ServiceVelvetvibeBean> getAllServiceVelvetvibe1() {
        List<ServiceVelvetvibeBean> services = new ArrayList<>();
        String query = "SELECT s.servicevv_id, s.service_id, s.service_name, c.categoryId, c.categoryName, s.description, s.image1, s.image2, s.image3, s.amount_from, s.amount_to " +
                       "FROM service_velvetvibe s " +
                       "JOIN service_category c ON s.categoryId = c.categoryId";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                ServiceVelvetvibeBean service = new ServiceVelvetvibeBean();
                service.setServicevv_id(rs.getInt("servicevv_id"));
                service.setService_id(rs.getInt("service_id"));
                service.setService_name(rs.getString("service_name"));
                service.setCategoryId(rs.getInt("categoryId"));
                service.setCategoryName(rs.getString("categoryName"));
                service.setDescription(rs.getString("description"));
                service.setImage1(rs.getString("image1"));
                service.setImage2(rs.getString("image2"));
                service.setImage3(rs.getString("image3"));
                service.setAmount_from(rs.getDouble("amount_from"));
                service.setAmount_to(rs.getDouble("amount_to"));
                services.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return services;
    }

    
    
 // Method to retrieve a specific service by ID
    public ServiceVelvetvibeBean getServiceById(int servicevv_id) {
        ServiceVelvetvibeBean service = null;
        String sql = "SELECT s.servicevv_id, s.service_id, s.service_name, s.categoryId, c.categoryName, s.description, s.image1, s.image2, s.image3, s.amount_from, s.amount_to "
                   + "FROM service_velvetvibe s "
                   + "JOIN service_category c ON s.categoryId = c.categoryId "
                   + "WHERE s.servicevv_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, servicevv_id);
            
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    service = new ServiceVelvetvibeBean();
                    service.setServicevv_id(rs.getInt("servicevv_id"));
                    service.setService_id(rs.getInt("service_id"));
                    service.setService_name(rs.getString("service_name"));
                    service.setCategoryId(rs.getInt("categoryId"));
                    service.setCategoryName(rs.getString("categoryName"));
                    service.setDescription(rs.getString("description"));
                    service.setImage1(rs.getString("image1"));
                    service.setImage2(rs.getString("image2"));
                    service.setImage3(rs.getString("image3"));
                    service.setAmount_from(rs.getDouble("amount_from"));
                    service.setAmount_to(rs.getDouble("amount_to"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return service;
    }
    public boolean ServiceVelvetvibe(ServiceVelvetvibeBean serviceVelvetvibe) {
        String sql = "UPDATE service_velvetvibe SET service_name = ?, categoryId = ?, description = ?, image1 = ?, image2 = ?, image3 = ?, "
                     + "amount_from = ?, amount_to = ? WHERE servicevv_id = ?";
        try (Connection conn = DBConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, serviceVelvetvibe.getService_name());
            stmt.setInt(2, serviceVelvetvibe.getCategoryId());
            stmt.setString(3, serviceVelvetvibe.getDescription());
            stmt.setString(4, serviceVelvetvibe.getImage1());
            stmt.setString(5, serviceVelvetvibe.getImage2());
            stmt.setString(6, serviceVelvetvibe.getImage3());
            stmt.setDouble(7, serviceVelvetvibe.getAmount_from());
            stmt.setDouble(8, serviceVelvetvibe.getAmount_to());
            stmt.setInt(9, serviceVelvetvibe.getServicevv_id());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

   
}
