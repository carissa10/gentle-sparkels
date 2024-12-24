<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Gentle Sparkle</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="Css/admin.css">
    <style>
        .header {
            background-color: #343a40;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logout-btn {
            color: white;
            text-decoration: none;
        }
        .logout-btn:hover {
            text-decoration: underline;
        }
        .card img {
            max-height: 150px;
            object-fit: cover;
        }
    </style>
</head>
<body>
    <header class="header">
        <h2>Admin Dashboard</h2>
        <a href="logoutAdminServlet" class="logout-btn">Logout</a>
    </header>

    <div class="container-fluid mt-4">
        <h1 class="mt-4">Welcome to Admin Dashboard</h1>
        <p>Here you can manage products, view transactions, and handle other administrative tasks.</p>
        <div class="container mt-5">
        
        <!-- Display success message if product deletion was successful -->
        <%
            String success = request.getParameter("success");
            if ("true".equals(success)) {
        %>
            <div class="alert alert-success" role="alert">
                Product successfully deleted.
            </div>
        <%
            }
        %>
        <!-- Add Product Button -->
        
        <div id="productTable">
            <jsp:include page="productAdminServlet"></jsp:include>
        </div>
        
        <script>
            window.onload = function() {
                <%
                    if (request.getSession().getAttribute("addSuccess") != null) {
                        request.getSession().removeAttribute("addSuccess");
                %>
                    alert("Product added successfully!");
                    window.location.reload();
                <%
                    }
                    if (request.getSession().getAttribute("addError") != null) {
                        request.getSession().removeAttribute("addError");
                %>
                    alert("Error adding product!");
                <%
                    }
                %>
            };
        </script>

    <!-- Bootstrap core JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
