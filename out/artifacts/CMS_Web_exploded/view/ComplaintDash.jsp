<%@ page import="java.util.List" %>
<%@ page import="org.example.model.Complains" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="org.example.model.Complains" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

    <%
    String nextId = "C001";

    List<Complains> complaintsList1 = (List<Complains>) request.getAttribute("complainsList1");

    if (complaintsList1 != null && !complaintsList1.isEmpty()) {
        Complains lastComplaint = complaintsList1.get(complaintsList1.size() - 1);
        String lastId = lastComplaint.getComplainId();

        String numberPart = lastId.substring(1);
        int number = Integer.parseInt(numberPart);
        number++;

        nextId = "C" + String.format("%03d", number);
    }
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaints Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/ComplaintsDashCss.css" rel="stylesheet">
    <style>

    </style>
</head>
<body>
<!-- Header -->
<header class="dashboard-header">
    <div class="header-container">
        <div class="header-content">
            <div class="company-info">
                <h1 class="company-title">Municipal IT Division</h1>
                <p class="company-description">
                    Submit and track your complaints easily using our <strong>Advanced Complaint Management System</strong>.
                    Experience seamless complaint resolution with real-time updates.
                </p>
            </div>
            <div class="header-actions">
                <div class="user-info">
                        <span class="user-role">
                            <i class="fas fa-user-circle"></i>
                            Employee
                        </span>
                    <form method="POST" action="ComplaintsDashBoardServlet">
                        <button type="submit" name="action" value="logout" class="btn btn-logout">
                            <i class="fas fa-sign-out-alt"></i>
                            Logout
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</header>

<main class="main-content">
    <div class="dashboard-container">
        <!-- Stats Section -->
        <div class="stats-section">
            <div class="stat-card">
                <div class="stat-content">
                    <div class="stat-info">
                        <h3 id="totalComplaints">10</h3>
                        <p>Total Complaints</p>
                    </div>
                    <div class="stat-icon total">
                        <i class="fas fa-clipboard-list"></i>
                    </div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-content">
                    <div class="stat-info">
                        <h3 id="pendingComplaints">9</h3>
                        <p>Pending</p>
                    </div>
                    <div class="stat-icon pending">
                        <i class="fas fa-clock"></i>
                    </div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-content">
                    <div class="stat-info">
                        <h3 id="inProgressComplaints">1</h3>
                        <p>In Progress</p>
                    </div>
                    <div class="stat-icon progress">
                        <i class="fas fa-cog"></i>
                    </div>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-content">
                    <div class="stat-info">
                        <h3 id="resolvedComplaints">0</h3>
                        <p>Resolved</p>
                    </div>
                    <div class="stat-icon resolved">
                        <i class="fas fa-check-circle"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Form Section -->
        <div class="form-section">
            <div class="section-header">
                <div class="section-icon">
                    <i class="fas fa-plus-circle"></i>
                </div>
                <h3 class="section-title">Submit or Update Complaint</h3>
            </div>

            <form method="POST" action="ComplaintsDashBoardServlet" class="complaint-form">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="complaintId" class="form-label">
                            <i class="fas fa-hashtag"></i>
                            Complaint ID
                        </label>
                        <input type="text" id="complaintId" name="complaintId" class="form-input" value="<%= nextId %>" readonly>
                    </div>

                    <div class="form-group">
                        <label for="description" class="form-label">
                            <i class="fas fa-edit"></i>
                            Description
                        </label>
                        <input type="text" id="description" name="description" class="form-input"
                               placeholder="Enter your complaint description..." required>
                    </div>
                </div>

                <input type="hidden" id="status" name="status" value="Pending">
                <input type="hidden" id="remark" name="remark" value="Not updated">
                <input type="hidden" id="creatAt" name="creatAt">
                <input type="hidden" id="updateId" name="updateId">
                <input type="hidden" id="deleteId" name="deleteId">

                <div class="form-actions">
                    <button type="submit" name="action" value="save" class="btn btn-primary">
                        <i class="fas fa-save"></i>
                        Save Complaint
                    </button>
                    <button type="submit" name="action" value="update" class="btn btn-secondary">
                        <i class="fas fa-edit"></i>
                        Update Complaint
                    </button>
                    <button type="submit" name="action" value="delete" class="btn btn-danger">
                        <i class="fas fa-trash"></i>
                        Delete Complaint
                    </button>
                </div>
            </form>
        </div>

        <!-- Table Section -->
        <div class="table-section">
            <div class="table-header">
                <div class="table-title">
                    <div class="section-icon">
                        <i class="fas fa-list"></i>
                    </div>
                    <h3 class="section-title">My Complaints</h3>
                </div>
                <div class="table-search">
                    <input type="text" class="search-input" placeholder="Search complaints..." id="searchInput">
                    <button class="btn btn-primary" onclick="searchComplaints()" type="button">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>

            <div class="table-container">
                <table class="complaints-table">
                    <thead>
                    <tr>
                        <th><i class="fas fa-hashtag"></i> ID</th>
                        <th><i class="fas fa-file-alt"></i> Description</th>
                        <th><i class="fas fa-info-circle"></i> Status</th>
                        <th><i class="fas fa-comment"></i> Remarks</th>
                        <th><i class="fas fa-calendar"></i> Created At</th>
                    </tr>
                    </thead>
                    <tbody id="complaintsTableBody">
                    <%
                        List<Complains> complaintsList = (List<Complains>) request.getAttribute("complainsList");

                        if (complaintsList != null && !complaintsList.isEmpty()) {
                            for (Complains c : complaintsList) {
                    %>
                    <tr>
                        <td><%= c.getComplainId() %></td>
                        <td class="description-cell"><%= c.getDescription() %></td>
                        <td>
                            <span class="status-badge status-<%= c.getStatus().toLowerCase().replace(" ", "-") %>">
                                <%= c.getStatus() %>
                            </span>
                        </td>
                        <td><%= c.getRemarks() %></td>
                        <td><%= c.getCreatedDate() %></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5" class="no-data">No complaints found.</td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>
<script src="${pageContext.request.contextPath}/lib/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/JS/ComplaintsDash.js"></script>
</body>
</html>
