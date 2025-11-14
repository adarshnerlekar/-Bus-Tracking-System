<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String busNo = request.getParameter("busNo");
    String message = "";
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String busName = "", route = "", driverName = "", contactNo = "";

    if (busNo != null && !busNo.trim().isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bustrakingsystem", "root", "adarsh@2004");

            ps = conn.prepareStatement("SELECT * FROM busdetail WHERE busNo = ?");
            ps.setString(1, busNo);
            rs = ps.executeQuery();

            if (rs.next()) {
                busName = rs.getString("busName");
                route = rs.getString("route");
                driverName = rs.getString("driverName");
                contactNo = rs.getString("contactNo");
            } else {
                message = "Bus not found!";
            }
        } catch (Exception e) {
            message = "Error: " + e.getMessage();
        }
    } else {
        message = "Invalid Bus Number!";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Bus | Bus Tracking System</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #ff8800 0%, #ffb84d 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-box {
            background: #fff;
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #ff6600;
            margin-bottom: 25px;
        }
        input[type="text"], input[type="tel"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
        }
        .btn {
            background: #ff6600;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            margin-top: 10px;
        }
        .btn:hover {
            background: #e65c00;
        }
        .message {
            text-align: center;
            color: #b71c1c;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>Edit Bus Details</h2>

        <% if (!message.isEmpty()) { %>
            <div class="message"><%= message %></div>
        <% } %>

        <form action="updatebus.jsp" method="post">
            <label>Bus No</label>
            <input type="text" name="busNo" value="<%= busNo %>" readonly>

            <label>Bus Name</label>
            <input type="text" name="busName" value="<%= busName %>" required>

            <label>Route</label>
            <input type="text" name="route" value="<%= route %>" required>

            <label>Driver Name</label>
            <input type="text" name="driverName" value="<%= driverName %>" required>

            <label>Contact No</label>
            <input type="tel" name="contactNo" value="<%= contactNo %>" required>

            <button type="submit" class="btn">Update Bus</button>
        </form>
    </div>
</body>
</html>

<%
    try { if (rs != null) rs.close(); } catch (Exception ignored) {}
    try { if (ps != null) ps.close(); } catch (Exception ignored) {}
    try { if (conn != null) conn.close(); } catch (Exception ignored) {}
%>
