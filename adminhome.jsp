<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | Bus Tracking System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
        }

        body {
            background: linear-gradient(135deg, #ff8800 0%, #ffb84d 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .dashboard {
            background: #fff;
            width: 900px;
            border-radius: 25px;
            padding: 40px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
            animation: fadeIn 0.6s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .dashboard h1 {
            color: #b34700;
            font-size: 30px;
            text-align: center;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .subtitle {
            text-align: center;
            color: #555;
            font-size: 15px;
            margin-bottom: 35px;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(190px, 1fr));
            gap: 25px;
        }

        .card {
            background: linear-gradient(145deg, #fff9f3, #ffe0b3);
            border-radius: 18px;
            padding: 30px 20px;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 6px 14px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            border: 2px solid transparent;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 25px rgba(255, 102, 0, 0.4);
            background: #ff6600;
            color: #fff;
            border: 2px solid #cc5200;
        }

        .card i {
            font-size: 40px;
            color: #cc5200;
            margin-bottom: 12px;
            transition: color 0.3s ease;
        }

        .card:hover i {
            color: #fff;
        }

        .card h3 {
            font-size: 18px;
            color: #333;
            margin-bottom: 8px;
            font-weight: 600;
            transition: color 0.3s ease;
        }

        .card:hover h3 {
            color: #fff;
        }

        .card p {
            color: #666;
            font-size: 13px;
            transition: color 0.3s ease;
        }

        .card:hover p {
            color: #fff;
        }

        .footer {
            text-align: center;
            margin-top: 40px;
            color: #777;
            font-size: 13px;
        }

        .footer span {
            color: #b34700;
            font-weight: 600;
        }
    </style>
</head>
<body>

    <div class="dashboard">
        <h1>🚍 Admin Dashboard</h1>
        <p class="subtitle">Welcome, Admin! Manage all your bus records easily.</p>

        <div class="card-grid">
            <a href="addbus.jsp" style="text-decoration:none;">
                <div class="card">
                    <i class="fa-solid fa-bus"></i>
                    <h3>Add Bus</h3>
                    <p>Add a new bus to the system</p>
                </div>
            </a>

            <a href="Viewbus.jsp" style="text-decoration:none;">
                <div class="card">
                    <i class="fa-solid fa-table-list"></i>
                    <h3>View All Buses</h3>
                    <p>Check all buses in the database</p>
                </div>
            </a>

            <a href="edit.jsp" style="text-decoration:none;">
                <div class="card">
                    <i class="fa-solid fa-pen-to-square"></i>
                    <h3>Edit Bus</h3>
                    <p>Update existing bus information</p>
                </div>
            </a>

            <a href="deletebus.jsp" style="text-decoration:none;">
                <div class="card">
                    <i class="fa-solid fa-trash-can"></i>
                    <h3>Delete Bus</h3>
                    <p>Remove unwanted bus records</p>
                </div>
            </a>

            <a href="index.jsp" style="text-decoration:none;">
                <div class="card">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    <h3>Logout</h3>
                    <p>Exit the admin panel</p>
                </div>
            </a>
        </div>

        <div class="footer">
            &copy; 2025 <span>Bus Tracking System</span> | Designed by <span>Adarsh Nerlekar</span>
        </div>
    </div>

</body>
</html>
