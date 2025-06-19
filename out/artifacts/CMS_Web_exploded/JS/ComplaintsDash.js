// // $('#complain-tbody').on('click', 'tr', function () {
// //     let clickedItemIndex = $(this);
// //     let id = clickedItemIndex.find('td').eq(0).text();
// //     let description = clickedItemIndex.find('td').eq(1).text();
// //     let status = clickedItemIndex.find('td').eq(2).text();
// //     let remarks = clickedItemIndex.find('td').eq(3).text();
// //     let createdDate = clickedItemIndex.find('td').eq(4).text();
// //     console.log(description)
// //
// //     $('#complaintId').val(id);
// //     $('#status').val(status);
// //     $('#description').val(description);
// //     $('#remark').val(remarks);
// //     $('#creatAt').val(createdDate);
// //     $('#updateId').val(id);
// //     $('#deleteId').val(id);
// //
// // })
//
//
//
// function searchComplaints() {
//     const searchTerm = document.getElementById('searchInput').value.toLowerCase();
//     const tableRows = document.querySelectorAll('#complaintsTableBody tr');
//
//     tableRows.forEach(row => {
//         const text = row.textContent.toLowerCase();
//         if (text.includes(searchTerm)) {
//             row.style.display = '';
//         } else {
//             row.style.display = 'none';
//         }
//     });
// }
//
// // Real-time search
// document.getElementById('searchInput').addEventListener('input', searchComplaints);
//
// // Form validation
// document.querySelector('.complaint-form').addEventListener('submit', function(e) {
//     const description = document.getElementById('description').value.trim();
//     if (!description) {
//         e.preventDefault();
//         showNotification('Please enter a complaint description!', 'error');
//         document.getElementById('description').focus();
//     }
// });
//
// // Show notification
// function showNotification(message, type) {
//     const notification = document.createElement('div');
//     notification.className = `notification ${type}`;
//     notification.innerHTML = `
//                 <i class="fas fa-${type == 'success' ? 'check-circle' : 'exclamation-circle'}"></i>
//                 ${message}
//             `;
//
//
//     document.body.appendChild(notification);
//
//     setTimeout(() => {
//         notification.classList.add('show');
//     }, 100);
//
//     setTimeout(() => {
//         notification.classList.remove('show');
//         setTimeout(() => {
//             document.body.removeChild(notification);
//         }, 300);
//     }, 3000);
// }
//
// // Update stats based on table data
// function updateStats() {
//     const rows = document.querySelectorAll('#complaintsTableBody tr');
//     let total = 0, pending = 0, inProgress = 0, resolved = 0;
//
//     rows.forEach(row => {
//         if (row.style.display !== 'none') {
//             total++;
//             const status = row.querySelector('.status-badge').textContent.trim().toLowerCase();
//             if (status.includes('pending')) pending++;
//             else if (status.includes('progress')) inProgress++;
//             else if (status.includes('resolved')) resolved++;
//         }
//     });
//
//     document.getElementById('totalComplaints').textContent = total;
//     document.getElementById('pendingComplaints').textContent = pending;
//     document.getElementById('inProgressComplaints').textContent = inProgress;
//     document.getElementById('resolvedComplaints').textContent = resolved;
// }
//
// // Initialize stats on load
// updateStats();
//
// // Auto-set current date for new complaints
// document.getElementById('creatAt').value = new Date().toISOString().split('T')[0];
//
// // Table row click handler for editing
// document.querySelectorAll('#complain-tbody-admin tr').forEach(row => {
//     row.addEventListener('click', function() {
//         const cells = this.querySelectorAll('td');
//         document.getElementById('complaintId').value = cells[0].textContent;
//         document.getElementById('description').value = cells[1].textContent;
//         document.getElementById('status').value = cells[2].textContent.trim();
//         document.getElementById('remark').value = cells[3].textContent;
//         document.getElementById('creatAt').value = cells[4].textContent;
//         document.getElementById('updateId').value = cells[0].textContent;
//         document.getElementById('deleteId').value = cells[0].textContent;
//
//         document.querySelector('.form-section').scrollIntoView({
//             behavior: 'smooth'
//         });
//
//         document.querySelectorAll('#complain-tbody-admin tr').forEach(r => {
//             r.style.backgroundColor = '';
//         });
//         this.style.backgroundColor = '#f0f9ff';
//     });
// });
//
// // Reset form
// function resetForm() {
//     document.querySelector('.complaint-form').reset();
//     document.getElementById('complaintId').value = 'C006';
//     document.getElementById('status').value = 'Pending';
//     document.getElementById('remark').value = 'Not updated';
//     document.getElementById('creatAt').value = new Date().toISOString().split('T')[0];
//     document.getElementById('updateId').value = '';
//     document.getElementById('deleteId').value = '';
//
//     // Remove row highlighting
//     document.querySelectorAll('#complaintsTableBody tr').forEach(r => {
//         r.style.backgroundColor = '';
//     });
// }
//
// // Add reset button functionality
// document.addEventListener('DOMContentLoaded', function() {
//     const formActions = document.querySelector('.form-actions');
//     const resetBtn = document.createElement('button');
//     resetBtn.type = 'button';
//     resetBtn.className = 'btn btn-secondary';
//     resetBtn.innerHTML = '<i class="fas fa-undo"></i> Reset Form';
//     resetBtn.onclick = resetForm;
//     formActions.appendChild(resetBtn);
// });
//
// // Animate stats on load
// function animateStats() {
//     const statNumbers = document.querySelectorAll('.stat-info h3');
//     statNumbers.forEach(stat => {
//         const finalValue = parseInt(stat.textContent);
//         let currentValue = 0;
//         const increment = Math.ceil(finalValue / 20);
//
//         const timer = setInterval(() => {
//             currentValue += increment;
//             if (currentValue >= finalValue) {
//                 stat.textContent = finalValue;
//                 clearInterval(timer);
//             } else {
//                 stat.textContent = currentValue;
//             }
//         }, 50);
//     });
// }
//
// // Initialize animations
// setTimeout(animateStats, 500);
//
//
//
//
//


// Enhanced Complaints Management System JavaScript

// Table row click handler for employee view (fixed selector)
document.addEventListener('DOMContentLoaded', function() {
    // Fix for employee table row clicks
    const employeeTableRows = document.querySelectorAll('#complaintsTableBody tr');
    employeeTableRows.forEach(row => {
        row.addEventListener('click', function() {
            const cells = this.querySelectorAll('td');
            if (cells.length >= 5) {
                document.getElementById('complaintId').value = cells[0].textContent.trim();
                document.getElementById('description').value = cells[1].textContent.trim();
                document.getElementById('status').value = cells[2].querySelector('.status-badge').textContent.trim();
                document.getElementById('remark').value = cells[3].textContent.trim();
                document.getElementById('creatAt').value = cells[4].textContent.trim();
                document.getElementById('updateId').value = cells[0].textContent.trim();
                document.getElementById('deleteId').value = cells[0].textContent.trim();

                // Scroll to form
                document.querySelector('.form-section').scrollIntoView({
                    behavior: 'smooth'
                });

                // Highlight selected row
                employeeTableRows.forEach(r => r.style.backgroundColor = '');
                this.style.backgroundColor = '#f0f9ff';
            }
        });
    });

    // Fix for admin table row clicks (if exists)
    const adminTableRows = document.querySelectorAll('#complain-tbody-admin tr');
    adminTableRows.forEach(row => {
        row.addEventListener('click', function() {
            const cells = this.querySelectorAll('td');
            if (cells.length >= 5) {
                document.getElementById('complaintId').value = cells[0].textContent.trim();
                document.getElementById('description').value = cells[1].textContent.trim();
                document.getElementById('status').value = cells[2].textContent.trim();
                document.getElementById('remark').value = cells[3].textContent.trim();
                document.getElementById('creatAt').value = cells[4].textContent.trim();
                document.getElementById('updateId').value = cells[0].textContent.trim();
                document.getElementById('deleteId').value = cells[0].textContent.trim();

                document.querySelector('.form-section').scrollIntoView({
                    behavior: 'smooth'
                });

                adminTableRows.forEach(r => r.style.backgroundColor = '');
                this.style.backgroundColor = '#f0f9ff';
            }
        });
    });
});

// Enhanced search functionality
function searchComplaints() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const tableRows = document.querySelectorAll('#complaintsTableBody tr');
    let visibleCount = 0;

    tableRows.forEach(row => {
        const text = row.textContent.toLowerCase();
        if (text.includes(searchTerm)) {
            row.style.display = '';
            visibleCount++;
        } else {
            row.style.display = 'none';
        }
    });

    // Update stats after search
    updateStats();

    // Show search results count
    showSearchResults(visibleCount, searchTerm);
}

// Show search results notification
function showSearchResults(count, term) {
    if (term) {
        const message = count > 0 ?
            `Found ${count} complaint(s) matching "${term}"` :
            `No complaints found matching "${term}"`;
        showNotification(message, count > 0 ? 'info' : 'warning');
    }
}

// Real-time search with debouncing
let searchTimeout;
document.getElementById('searchInput').addEventListener('input', function() {
    clearTimeout(searchTimeout);
    searchTimeout = setTimeout(searchComplaints, 300);
});

// Enhanced form validation
document.querySelector('.complaint-form').addEventListener('submit', function(e) {
    const description = document.getElementById('description').value.trim();
    const action = e.submitter.value;

    if (!description && (action === 'save' || action === 'update')) {
        e.preventDefault();
        showNotification('Please enter a complaint description!', 'error');
        document.getElementById('description').focus();
        return false;
    }

    if (action === 'update' || action === 'delete') {
        const updateId = document.getElementById('updateId').value.trim();
        if (!updateId) {
            e.preventDefault();
            showNotification('Please select a complaint to ' + action + '!', 'error');
            return false;
        }
    }

    if (action === 'delete') {
        if (!confirm('Are you sure you want to delete this complaint? This action cannot be undone.')) {
            e.preventDefault();
            return false;
        }
    }

    return true;
});

// Enhanced notification system
function showNotification(message, type) {
    // Remove existing notifications
    const existingNotifications = document.querySelectorAll('.notification');
    existingNotifications.forEach(notif => notif.remove());

    const notification = document.createElement('div');
    notification.className = `notification ${type}`;

    const iconMap = {
        'success': 'check-circle',
        'error': 'exclamation-circle',
        'warning': 'exclamation-triangle',
        'info': 'info-circle'
    };

    notification.innerHTML = `
        <i class="fas fa-${iconMap[type] || 'info-circle'}"></i>
        <span>${message}</span>
        <button class="notification-close" onclick="this.parentElement.remove()">
            <i class="fas fa-times"></i>
        </button>
    `;

    document.body.appendChild(notification);

    setTimeout(() => {
        notification.classList.add('show');
    }, 100);

    setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => {
            if (notification.parentElement) {
                notification.remove();
            }
        }, 300);
    }, 5000);
}

// Enhanced stats update with animation
function updateStats() {
    const rows = document.querySelectorAll('#complaintsTableBody tr');
    let total = 10, pending = 5, inProgress = 2, resolved = 0;

    rows.forEach(row => {
        if (row.style.display !== 'none' && !row.querySelector('.no-data')) {
            total++;
            const statusBadge = row.querySelector('.status-badge');
            if (statusBadge) {
                const status = statusBadge.textContent.trim().toLowerCase();
                if (status.includes('pending')) pending++;
                else if (status.includes('progress') || status.includes('processing')) inProgress++;
                else if (status.includes('resolved') || status.includes('completed')) resolved++;
            }
        }
    });

    // Animate counter updates
    animateCounter('totalComplaints', total);
    animateCounter('pendingComplaints', pending);
    animateCounter('inProgressComplaints', inProgress);
    animateCounter('resolvedComplaints', resolved);
}

// Counter animation function
function animateCounter(elementId, targetValue) {
    const element = document.getElementById(elementId);
    const currentValue = parseInt(element.textContent) || 0;
    const difference = targetValue - currentValue;
    const steps = 10;
    const stepValue = difference / steps;
    let current = currentValue;

    const timer = setInterval(() => {
        current += stepValue;
        if ((stepValue > 0 && current >= targetValue) || (stepValue < 0 && current <= targetValue)) {
            element.textContent = targetValue;
            clearInterval(timer);
        } else {
            element.textContent = Math.round(current);
        }
    }, 50);
}

// Enhanced form reset
function resetForm() {
    const form = document.querySelector('.complaint-form');
    form.reset();

    // Reset hidden fields
    document.getElementById('status').value = 'Pending';
    document.getElementById('remark').value = 'Not updated';
    document.getElementById('creatAt').value = new Date().toISOString().split('T')[0];
    document.getElementById('updateId').value = '';
    document.getElementById('deleteId').value = '';

    // Remove row highlighting
    document.querySelectorAll('#complaintsTableBody tr, #complain-tbody-admin tr').forEach(r => {
        r.style.backgroundColor = '';
    });

    // Focus on description field
    document.getElementById('description').focus();

    showNotification('Form has been reset', 'info');
}

// Auto-set current date for new complaints
document.addEventListener('DOMContentLoaded', function() {
    const createAtField = document.getElementById('creatAt');
    if (createAtField && !createAtField.value) {
        createAtField.value = new Date().toISOString().split('T')[0];
    }
});

// Add reset button functionality
document.addEventListener('DOMContentLoaded', function() {
    const formActions = document.querySelector('.form-actions');
    if (formActions && !formActions.querySelector('.btn-reset')) {
        const resetBtn = document.createElement('button');
        resetBtn.type = 'button';
        resetBtn.className = 'btn btn-secondary btn-reset';
        resetBtn.innerHTML = '<i class="fas fa-undo"></i> Reset Form';
        resetBtn.onclick = resetForm;
        formActions.appendChild(resetBtn);
    }
});

// Initialize stats on load with delay for better UX
document.addEventListener('DOMContentLoaded', function() {
    setTimeout(() => {
        updateStats();
        animateStatsOnLoad();
    }, 500);
});

// Animate stats on initial load
function animateStatsOnLoad() {
    const statNumbers = document.querySelectorAll('.stat-info h3');
    statNumbers.forEach((stat, index) => {
        const finalValue = parseInt(stat.textContent) || 0;
        stat.textContent = '0';

        setTimeout(() => {
            animateCounter(stat.id || `stat-${index}`, finalValue);
        }, index * 200);
    });
}

// Keyboard shortcuts
document.addEventListener('keydown', function(e) {
    if (e.ctrlKey || e.metaKey) {
        switch(e.key) {
            case 'r':
                e.preventDefault();
                resetForm();
                break;
            case 'f':
                e.preventDefault();
                document.getElementById('searchInput').focus();
                break;
            case 's':
                e.preventDefault();
                const saveBtn = document.querySelector('button[value="save"]');
                if (saveBtn) saveBtn.click();
                break;
        }
    }

    if (e.key === 'Escape') {
        // Clear search
        const searchInput = document.getElementById('searchInput');
        if (searchInput.value) {
            searchInput.value = '';
            searchComplaints();
        }
    }
});

// Auto-refresh functionality (optional)
function setupAutoRefresh(intervalMinutes = 5) {
    setInterval(() => {
        if (document.visibilityState === 'visible') {
            // Only refresh if page is visible
            window.location.reload();
        }
    }, intervalMinutes * 60 * 1000);
}

// Status badge click for quick status change (if admin)
document.addEventListener('click', function(e) {
    if (e.target.classList.contains('status-badge') && e.target.closest('tr')) {
        const row = e.target.closest('tr');
        const cells = row.querySelectorAll('td');

        // Auto-fill form with row data
        if (cells.length >= 5) {
            document.getElementById('complaintId').value = cells[0].textContent.trim();
            document.getElementById('description').value = cells[1].textContent.trim();
            document.getElementById('status').value = e.target.textContent.trim();
            document.getElementById('remark').value = cells[3].textContent.trim();
            document.getElementById('creatAt').value = cells[4].textContent.trim();
            document.getElementById('updateId').value = cells[0].textContent.trim();
            document.getElementById('deleteId').value = cells[0].textContent.trim();

            // Highlight and scroll
            document.querySelectorAll('#complaintsTableBody tr').forEach(r => {
                r.style.backgroundColor = '';
            });
            row.style.backgroundColor = '#f0f9ff';

            document.querySelector('.form-section').scrollIntoView({
                behavior: 'smooth'
            });
        }
    }
});

// Export functionality (bonus feature)
function exportComplaints() {
    const table = document.querySelector('.complaints-table');
    const rows = table.querySelectorAll('tr');
    let csv = '';

    rows.forEach(row => {
        const cells = row.querySelectorAll('th, td');
        const rowData = Array.from(cells).map(cell => {
            return '"' + cell.textContent.trim().replace(/"/g, '""') + '"';
        });
        csv += rowData.join(',') + '\n';
    });

    const blob = new Blob([csv], { type: 'text/csv' });
    const url = window.URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = 'complaints_' + new Date().toISOString().split('T')[0] + '.csv';
    a.click();
    window.URL.revokeObjectURL(url);
}

// Add export button (optional)
document.addEventListener('DOMContentLoaded', function() {
    const tableHeader = document.querySelector('.table-header .table-title');
    if (tableHeader) {
        const exportBtn = document.createElement('button');
        exportBtn.type = 'button';
        exportBtn.className = 'btn btn-outline';
        exportBtn.innerHTML = '<i class="fas fa-download"></i> Export';
        exportBtn.onclick = exportComplaints;
        exportBtn.style.marginLeft = '10px';
        tableHeader.appendChild(exportBtn);
    }
});

console.log('Complaints Management System JavaScript loaded successfully!');