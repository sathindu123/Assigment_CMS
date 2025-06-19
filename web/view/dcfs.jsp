<%--
  Created by IntelliJ IDEA.
  User: SATHI
  Date: 6/19/2025
  Time: 1:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complaints Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
            --dark-bg: #1e293b;
            --card-bg: #ffffff;
            --text-primary: #1e293b;
            --text-secondary: #64748b;
            --border-color: #e2e8f0;
            --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(0 0 0 / 0.1);
            --shadow-xl: 0 20px 25px -5px rgb(0 0 0 / 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            color: var(--text-primary);
            line-height: 1.6;
            min-height: 100vh;
        }

        /* Animated Background */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml,<svg width="60" height="60" viewBox="0 0 60 60" xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd"><g fill="%239C92AC" fill-opacity="0.03"><path d="m36 34v-4h-2v4h-4v2h4v4h2v-4h4v-2h-4zm0-30V0h-2v4h-4v2h4v4h2V6h4V4h-4zM6 34v-4H4v4H0v2h4v4h2v-4h4v-2H6zM6 4V0H4v4H0v2h4v4h2V6h4V4H6z"/></g></g></svg>') repeat;
            pointer-events: none;
            z-index: -1;
        }

        /* Header */
        .dashboard-header {
            background: var(--primary-gradient);
            color: white;
            padding: 2rem 0;
            position: relative;
            overflow: hidden;
        }

        .dashboard-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 100%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255,255,255,0.1), transparent);
            transform: rotate(45deg);
            animation: headerShine 3s infinite;
        }

        @keyframes headerShine {
            0% { transform: translateX(-100%) rotate(45deg); }
            100% { transform: translateX(100%) rotate(45deg); }
        }

        .header-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 2rem;
            position: relative;
            z-index: 1;
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 2rem;
        }

        .company-info {
            flex: 1;
        }

        .company-title {
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 0.5rem;
            text-shadow: 0 4px 8px rgba(0,0,0,0.2);
            background: linear-gradient(45deg, #fff, #e0e7ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .company-description {
            font-size: 1.2rem;
            opacity: 0.95;
            max-width: 600px;
            line-height: 1.6;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .user-info {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            gap: 0.5rem;
        }

        .user-role {
            font-size: 1rem;
            font-weight: 600;
            opacity: 0.9;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Main Content */
        .main-content {
            padding: 3rem 0;
        }

        .dashboard-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 2rem;
            display: grid;
            gap: 2rem;
        }

        /* Stats Cards */
        .stats-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: var(--card-bg);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: var(--shadow-lg);
            border: 1px solid var(--border-color);
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-xl);
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--primary-gradient);
        }

        .stat-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .stat-info h3 {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
        }

        .stat-info p {
            color: var(--text-secondary);
            font-weight: 500;
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
        }

        .stat-icon.pending { background: linear-gradient(135deg, #fbbf24, #f59e0b); }
        .stat-icon.progress { background: linear-gradient(135deg, #3b82f6, #1d4ed8); }
        .stat-icon.resolved { background: linear-gradient(135deg, #10b981, #059669); }
        .stat-icon.total { background: var(--primary-gradient); }

        /* Form Section */
        .form-section {
            background: var(--card-bg);
            border-radius: 24px;
            padding: 2.5rem;
            box-shadow: var(--shadow-lg);
            border: 1px solid var(--border-color);
            position: relative;
            overflow: hidden;
        }

        .form-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: var(--primary-gradient);
        }

        .section-header {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 2rem;
        }

        .section-icon {
            width: 50px;
            height: 50px;
            border-radius: 12px;
            background: var(--primary-gradient);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.2rem;
        }

        .section-title {
            font-size: 1.75rem;
            font-weight: 700;
            color: var(--text-primary);
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 2.5rem;
        }

        .form-group {
            position: relative;
        }

        .form-label {
            display: block;
            color: var(--text-primary);
            font-weight: 600;
            margin-bottom: 0.75rem;
            font-size: 0.95rem;
        }

        .form-input {
            width: 100%;
            padding: 1rem 1.25rem;
            border: 2px solid var(--border-color);
            border-radius: 16px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background-color: #fafafb;
        }

        .form-input:focus {
            outline: none;
            border-color: #667eea;
            background-color: white;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }

        .form-input[readonly] {
            background: linear-gradient(135deg, #f1f5f9, #e2e8f0);
            color: var(--text-secondary);
            cursor: not-allowed;
        }

        .form-actions {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            justify-content: flex-start;
        }

        /* Buttons */
        .btn {
            padding: 1rem 2rem;
            border: none;
            border-radius: 16px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            text-decoration: none;
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn-primary {
            background: var(--primary-gradient);
            color: white;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #64748b, #475569);
            color: white;
            box-shadow: 0 4px 15px rgba(100, 116, 139, 0.3);
        }

        .btn-secondary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(100, 116, 139, 0.4);
        }

        .btn-danger {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
            box-shadow: 0 4px 15px rgba(239, 68, 68, 0.3);
        }

        .btn-danger:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(239, 68, 68, 0.4);
        }

        .btn-logout {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 2px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(10px);
        }

        .btn-logout:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
        }

        /* Table Section */
        .table-section {
            background: var(--card-bg);
            border-radius: 24px;
            padding: 2.5rem;
            box-shadow: var(--shadow-lg);
            border: 1px solid var(--border-color);
            position: relative;
            overflow: hidden;
        }

        .table-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: var(--secondary-gradient);
        }

        .table-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            gap: 1rem;
        }

        .table-title {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .table-search {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .search-input {
            padding: 0.75rem 1rem;
            border: 2px solid var(--border-color);
            border-radius: 12px;
            font-size: 0.95rem;
            min-width: 250px;
        }

        .search-input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
        }

        .table-container {
            border-radius: 16px;
            overflow: hidden;
            border: 1px solid var(--border-color);
            box-shadow: var(--shadow-md);
        }

        .complaints-table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        .complaints-table th {
            background: linear-gradient(135deg, #f8fafc, #f1f5f9);
            color: var(--text-primary);
            font-weight: 700;
            padding: 1.25rem;
            text-align: left;
            border-bottom: 2px solid var(--border-color);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .complaints-table td {
            padding: 1.25rem;
            border-bottom: 1px solid #f1f5f9;
            vertical-align: top;
        }

        .complaints-table tbody tr {
            transition: all 0.2s ease;
        }

        .complaints-table tbody tr:hover {
            background: linear-gradient(135deg, #f8fafc, #f1f5f9);
            transform: scale(1.01);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .description-cell {
            max-width: 300px;
            word-wrap: break-word;
            line-height: 1.5;
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .status-pending {
            background: linear-gradient(135deg, #fef3c7, #fde68a);
            color: #92400e;
        }

        .status-in-progress {
            background: linear-gradient(135deg, #dbeafe, #bfdbfe);
            color: #1e40af;
        }

        .status-resolved {
            background: linear-gradient(135deg, #d1fae5, #a7f3d0);
            color: #065f46;
        }

        .no-data {
            text-align: center;
            color: var(--text-secondary);
            font-style: italic;
            padding: 3rem;
            font-size: 1.1rem;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .dashboard-container {
                padding: 0 1rem;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }

            .company-title {
                font-size: 2.25rem;
            }

            .stats-section {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            }

            .form-section,
            .table-section {
                padding: 1.5rem;
                border-radius: 16px;
            }

            .form-actions {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }

            .table-header {
                flex-direction: column;
                align-items: stretch;
            }

            .search-input {
                min-width: 100%;
            }

            .complaints-table {
                font-size: 0.9rem;
            }

            .complaints-table th,
            .complaints-table td {
                padding: 0.75rem 0.5rem;
            }
        }

        @media (max-width: 480px) {
            .company-title {
                font-size: 1.8rem;
            }

            .section-title {
                font-size: 1.4rem;
            }

            .stat-info h3 {
                font-size: 2rem;
            }
        }

        /* Loading Animation */
        .loading {
            display: inline-block;
            width: 20px;
            height: 20px;
            border: 3px solid rgba(255,255,255,.3);
            border-radius: 50%;
            border-top-color: #fff;
            animation: spin 1s ease-in-out infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* Notification Styles */
        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 1rem 1.5rem;
            border-radius: 12px;
            color: white;
            font-weight: 600;
            z-index: 1000;
            transform: translateX(400px);
            transition: transform 0.3s ease;
        }

        .notification.show {
            transform: translateX(0);
        }

        .notification.success {
            background: linear-gradient(135deg, #10b981, #059669);
        }

        .notification.error {
            background: linear-gradient(135deg, #ef4444, #dc2626);
        }
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
                        <h3 id="totalComplaints">5</h3>
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
                        <h3 id="pendingComplaints">2</h3>
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
                        <h3 id="resolvedComplaints">2</h3>
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
                        <input type="text" id="complaintId" name="complaintId" class="form-input" value="C006" readonly>
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
                    <button class="btn btn-primary" onclick="searchComplaints()">
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
                    <tr>
                        <td>C001</td>
                        <td class="description-cell">Street light not working in front of our house</td>
                        <td>
                                    <span class="status-badge status-pending">
                                        <i class="fas fa-clock"></i>
                                        Pending
                                    </span>
                        </td>
                        <td>Not updated</td>
                        <td>2025-06-18</td>
                    </tr>
                    <tr>
                        <td>C002</td>
                        <td class="description-cell">Water leakage in main road</td>
                        <td>
                                    <span class="status-badge status-in-progress">
                                        <i class="fas fa-cog"></i>
                                        In Progress
                                    </span>
                        </td>
                        <td>Team assigned</td>
                        <td>2025-06-17</td>
                    </tr>
                    <tr>
                        <td>C003</td>
                        <td class="description-cell">Garbage collection issue</td>
                        <td>
                                    <span class="status-badge status-resolved">
                                        <i class="fas fa-check-circle"></i>
                                        Resolved
                                    </span>
                        </td>
                        <td>Issue resolved successfully</td>
                        <td>2025-06-16</td>
                    </tr>
                    <tr>
                        <td>C004</td>
                        <td class="description-cell">Road repair needed urgently</td>
                        <td>
                                    <span class="status-badge status-pending">
                                        <i class="fas fa-clock"></i>
                                        Pending
                                    </span>
                        </td>
                        <td>Not updated</td>
                        <td>2025-06-15</td>
                    </tr>
                    <tr>
                        <td>C005</td>
                        <td class="description-cell">Noise pollution from construction site</td>
                        <td>
                                    <span class="status-badge status-resolved">
                                        <i class="fas fa-check-circle"></i>
                                        Resolved
                                    </span>
                        </td>
                        <td>Construction hours regulated</td>
                        <td>2025-06-14</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

<script>
    // Search functionality
    function searchComplaints() {
        const searchTerm = document.getElementById('searchInput').value.toLowerCase();
        const tableRows = document.querySelectorAll('#complaintsTableBody tr');

        tableRows.forEach(row => {
            const text = row.textContent.toLowerCase();
            if (text.includes(searchTerm)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        });
    }

    // Real-time search
    document.getElementById('searchInput').addEventListener('input', searchComplaints);

    // Form validation
    document.querySelector('.complaint-form').addEventListener('submit', function(e) {
        const description = document.getElementById('description').value.trim();
        if (!description) {
            e.preventDefault();
            showNotification('Please enter a complaint description!', 'error');
            document.getElementById('description').focus();
        }
    });

    // Show notification
    function showNotification(message, type) {
        const notification = document.createElement('div');
        notification.className = `notification ${type}`;
        notification.innerHTML = `
                <i class="fas fa-${type === 'success' ? 'check-circle' : 'exclamation-circle'}"></i>
                ${message}
            `;

        document.body.appendChild(notification);

        setTimeout(() => {
            notification.classList.add('show');
        }, 100);

        setTimeout(() => {
            notification.classList.remove('show');
            setTimeout(() => {
                document.body.removeChild(notification);
            }, 300);
        }, 3000);
    }

    // Update stats based on table data
    function updateStats() {
        const rows = document.querySelectorAll('#complaintsTableBody tr');
        let total = 0, pending = 0, inProgress = 0, resolved = 0;

        rows.forEach(row => {
            if (row.style.display !== 'none') {
                total++;
                const status = row.querySelector('.status-badge').textContent.trim().toLowerCase();
                if (status.includes('pending')) pending++;
                else if (status.includes('progress')) inProgress++;
                else if (status.includes('resolved')) resolved++;
            }
        });

        document.getElementById('totalComplaints').textContent = total;
        document.getElementById('pendingComplaints').textContent = pending;
        document.getElementById('inProgressComplaints').textContent = inProgress;
        document.getElementById('resolvedComplaints').textContent = resolved;
    }

    // Initialize stats on load
    updateStats();

    // Auto-set current date for new complaints
    document.getElementById('creatAt').value = new Date().toISOString().split('T')[0];

    // Table row click handler for editing
    document.querySelectorAll('#complaintsTableBody tr').forEach(row => {
        row.addEventListener('click', function() {
            const cells = this.querySelectorAll('td');
            document.getElementById('complaintId').value = cells[0].textContent;
            document.getElementById('description').value = cells[1].textContent;
            document.getElementById('updateId').value = cells[0].textContent;

            // Scroll to form
            document.querySelector('.form-section').scrollIntoView({
                behavior: 'smooth'
            });

            // Highlight selected row
            document.querySelectorAll('#complaintsTableBody tr').forEach(r => {
                r.style.backgroundColor = '';
            });
            this.style.backgroundColor = '#f0f9ff';
        });
    });

    // Reset form
    function resetForm() {
        document.querySelector('.complaint-form').reset();
        document.getElementById('complaintId').value = 'C006';
        document.getElementById('status').value = 'Pending';
        document.getElementById('remark').value = 'Not updated';
        document.getElementById('creatAt').value = new Date().toISOString().split('T')[0];
        document.getElementById('updateId').value = '';
        document.getElementById('deleteId').value = '';

        // Remove row highlighting
        document.querySelectorAll('#complaintsTableBody tr').forEach(r => {
            r.style.backgroundColor = '';
        });
    }

    // Add reset button functionality
    document.addEventListener('DOMContentLoaded', function() {
        const formActions = document.querySelector('.form-actions');
        const resetBtn = document.createElement('button');
        resetBtn.type = 'button';
        resetBtn.className = 'btn btn-secondary';
        resetBtn.innerHTML = '<i class="fas fa-undo"></i> Reset Form';
        resetBtn.onclick = resetForm;
        formActions.appendChild(resetBtn);
    });

    // Animate stats on load
    function animateStats() {
        const statNumbers = document.querySelectorAll('.stat-info h3');
        statNumbers.forEach(stat => {
            const finalValue = parseInt(stat.textContent);
            let currentValue = 0;
            const increment = Math.ceil(finalValue / 20);

            const timer = setInterval(() => {
                currentValue += increment;
                if (currentValue >= finalValue) {
                    stat.textContent = finalValue;
                    clearInterval(timer);
                } else {
                    stat.textContent = currentValue;
                }
            }, 50);
        });
    }

    // Initialize animations
    setTimeout(animateStats, 500);
</script>
</body>
</html>
