<%@ page import="java.util.List" %>
<%@ page import="bean.GalleryBean" %>
<%@ page import="dao.GalleryDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery View</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
      <style>
        .card-img-top {
            width: 100%; /* Adjust as needed */
            height: 500px; /* Fixed height */
            object-fit: cover;
            padding: 20px; /* Maintains aspect ratio and covers the area */
        }
        .additional-img {
            width: 100%; /* Adjust as needed */
            height: 200px; /* Fixed height */
            object-fit: cover; /* Maintains aspect ratio and covers the area */
        }
        
         .icon-buttons {
            margin-top: 10px;
        }
        .icon-buttons a {
            color: #fff;
            margin-right: 10px;
            font-size: 20px;
        }
        .icon-buttons a:hover {
            color: #000;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h1 class="mb-4">Gallery</h1>
        
        <!-- Add New Gallery Button -->
        <div class="mb-4">
            <a href="addGallery.jsp" class="btn btn-primary">Add New Gallery</a>
        </div>

        <div class="row">
            <% 
                GalleryDAO galleryDAO = new GalleryDAO();
                List<GalleryBean> galleries = galleryDAO.getAllGalleries();
                for (GalleryBean gallery : galleries) {
            %>
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="<%= gallery.getImage1() %>" class="card-img-top" alt="Image 1">
                        <div class="card">
                            <% if (gallery.getImage2() != null && !gallery.getImage2().isEmpty()) { %>
                                <img src="<%= gallery.getImage2() %>" class="card-img-top" alt="Image 2">
                            <% } %>
                            <!-- Edit and Delete Buttons -->
                           <div class="icon-buttons">
                                <a href="editGallery.jsp?galleryId=<%= gallery.getGalleryId() %>" class="btn btn-warning btn-sm">
                                    <i class="fas fa-edit"></i> <!-- Edit Icon -->
                                </a>
                                <a href="deleteGallery.jsp?galleryId=<%= gallery.getGalleryId() %>" class="btn btn-danger btn-sm">
                                    <i class="fas fa-trash-alt"></i> <!-- Delete Icon -->
                                </a>
                            </div>
                        
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.0.8/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
