<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String message = null;
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String busNo = request.getParameter("busNo");
        String busName = request.getParameter("busName");
        String route = request.getParameter("route");
        String driverName = request.getParameter("driverName");
        String contactNo = request.getParameter("contactNo");

        if (busNo == null || busNo.trim().isEmpty() ||
            busName == null || busName.trim().isEmpty()) {
            message = "Please fill required fields: Bus No and Bus Name.";
        } else {
            Connection conn = null;
            PreparedStatement ps = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/bustrakingsystem";
                String dbUser = "root";
                String dbPass = "adarsh@2004"; // <-- your password
                conn = DriverManager.getConnection(url, dbUser, dbPass);

                String sql = "INSERT INTO busdetail (busNo, busName, route, driverName, contactNo) VALUES (?, ?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setString(1, busNo.trim());
                ps.setString(2, busName.trim());
                ps.setString(3, route != null ? route.trim() : "");
                ps.setString(4, driverName != null ? driverName.trim() : "");
                ps.setString(5, contactNo != null ? contactNo.trim() : "");

                int rows = ps.executeUpdate();
                if (rows > 0) {
                    message = "Bus added successfully!";
                    response.sendRedirect("Viewbus.jsp");
                    return;
                } else {
                    message = "Failed to add bus. Try again.";
                }
            } catch (SQLIntegrityConstraintViolationException ex) {
                message = "Bus with Bus No '" + busNo + "' already exists.";
            } catch (Exception e) {
                message = "Error: " + e.getMessage();
            } finally {
                try { if (ps != null) ps.close(); } catch (Exception ignored) {}
                try { if (conn != null) conn.close(); } catch (Exception ignored) {}
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Add Bus | Bus Tracking System</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
    body {
        font-family: "Poppins", sans-serif;
        background: linear-gradient(135deg, #ff8800 0%, #ffb84d 100%);
        min-height: 100vh;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .card {
        width: 520px;
        background: #fff;
        border-radius: 15px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.2);
        padding: 28px;
    }
    h2 {
        text-align: center;
        color: #ff6600;
        margin-bottom: 18px;
        font-size: 24px;
    }
    .form-row {
        display: flex;
        gap: 12px;
        margin-bottom: 12px;
    }
    .form-group {
        flex: 1;
        display: flex;
        flex-direction: column;
    }
    label {
        font-weight: 600;
        color: #444;
        margin-bottom: 6px;
    }
    input[type="text"], input[type="tel"] {
        padding: 10px;
        border: 2px solid #ff8800;
        border-radius: 8px;
        font-size: 14px;
        outline: none;
        transition: 0.3s;
    }
    input[type="text"]:focus, input[type="tel"]:focus {
        border-color: #ff6600;
        box-shadow: 0 0 5px rgba(255,102,0,0.5);
    }
    .btn {
        width: 100%;
        padding: 12px;
        background: #ff6600;
        border: none;
        border-radius: 10px;
        color: white;
        font-size: 16px;
        font-weight: 600;
        cursor: pointer;
        transition: background 0.3s;
    }
    .btn:hover {
        background: #e65c00;
    }
    .message {
        padding: 10px;
        margin-bottom: 15px;
        border-radius: 10px;
        text-align: center;
        font-weight: 600;
    }
    .success {
        background: #e6ffed;
        border: 1px solid #00c853;
        color: #007e33;
    }
    .error {
        background: #ffeaea;
        border: 1px solid #e53935;
        color: #b71c1c;
    }
    .footer-links {
        text-align: center;
        margin-top: 15px;
    }
    .footer-links a {
        color: #ff6600;
        font-weight: 600;
        text-decoration: none;
    }
</style>
</head>
<body>
<div class="card">
    <h2>Add Bus Details</h2>

    <% if (message != null) { %>
        <div class="message <%= message.toLowerCase().contains("success") ? "success" : "error" %>">
            <%= message %>
        </div>
    <% } %>

    <form method="post" action="addbus.jsp" onsubmit="return validateForm()">
        <div class="form-row">
            <div class="form-group">
                <label>Bus No *</label>
                <input type="text" name="busNo" placeholder="Ex: MH12AB1234" required>
            </div>
            <div class="form-group">
                <label>Bus Name *</label>
                <input type="text" name="busName" placeholder="Ex: City Express" required>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Route</label>
                <input type="text" name="route" placeholder="Ex: Pune - Mumbai">
            </div>
            <div class="form-group">
                <label>Driver Name</label>
                <input type="text" name="driverName" placeholder="Ex: Rajesh Kumar">
            </div>
        </div>

        <div class="form-row">
            <div class="form-group" style="flex:1;">
                <label>Contact No</label>
                <input type="tel" name="contactNo" placeholder="Ex: 9876543210" pattern="[0-9]{10}">
            </div>
        </div>

        <button type="submit" class="btn">Add Bus</button>

        <div class="footer-links">
            <a href="Viewbus.jsp">View All Buses</a>
        </div>
    </form>
</div>

<script>
function validateForm() {
    var busNo = document.getElementsByName('busNo')[0].value.trim();
    var busName = document.getElementsByName('busName')[0].value.trim();
    if (busNo === "" || busName === "") {
        alert("Please fill Bus No and Bus Name");
        return false;
    }
    return true;
}
</script>
</body>
</html>
