<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String busNo = request.getParameter("busNo");
    String message = "";

    if (busNo != null && !busNo.trim().isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/bustrakingsystem", "root", "adarsh@2004");

            PreparedStatement ps = conn.prepareStatement("DELETE FROM busdetail WHERE busNo=?");
            ps.setString(1, busNo);
            int rows = ps.executeUpdate();

            if (rows > 0) {
                message = "Bus deleted successfully!";
            } else {
                message = "Bus not found!";
            }

            conn.close();
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
    <title>Delete Bus</title>
    <meta http-equiv="refresh" content="2;URL=Viewbus.jsp" />
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #ff8800 0%, #ffb84d 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }
        .box {
            background: white;
            padding: 30px 50px;
            border-radius: 15px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.2);
            text-align: center;
        }
        h2 {
            color: #ff6600;
        }
    </style>
</head>
<body>
    <div class="box">
        <h2><%= message %></h2>
        <p>Redirecting to bus list...</p>
    </div>
</body>
</html>
