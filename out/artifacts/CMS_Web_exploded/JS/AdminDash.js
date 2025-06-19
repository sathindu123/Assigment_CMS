$(document).ready(function () {
    // Form validation
    $('#update-form').on('submit', function (e) {
        let status = $('#statusDropDown').val();
        let remark = $('#remark').val();
        let formMessage = $('#form-message');

        if (!status) {
            e.preventDefault();
            formMessage
                .removeClass('success')
                .addClass('error')
                .text('Please select a status.')
                .show();
            return false;
        }

        if (remark.trim() === '') {
            e.preventDefault();
            formMessage
                .removeClass('success')
                .addClass('error')
                .text('Please enter remarks.')
                .show();
            return false;
        }

        // AJAX form submission
        e.preventDefault();
        $.ajax({
            url: 'AdminDashServlet',
            type: 'POST',
            data: $(this).serialize(),
            success: function (response) {
                formMessage
                    .removeClass('error')
                    .addClass('success')
                    .text('Complaint updated successfully!')
                    .show();
                setTimeout(() => formMessage.hide(), 3000);
                // Reload table or update via AJAX
                location.reload(); // Temporary reload
            },
            error: function () {
                formMessage
                    .removeClass('success')
                    .addClass('error')
                    .text('Error updating complaint.')
                    .show();
            }
        });
    });

    // Table sorting
    $('.sortable th').on('click', function () {
        let column = $(this).data('sort');
        let order = $(this).hasClass('asc') ? 'desc' : 'asc';
        $('.sortable th').removeClass('asc desc');
        $(this).addClass(order);

        let rows = $('#complain-tbody-admin tr').get();
        rows.sort((a, b) => {
            let aValue, bValue;

            if (column === 'complainId') {
                aValue = $(a).find('td').eq(0).text();
                bValue = $(b).find('td').eq(0).text();
            } else if (column === 'description') {
                aValue = $(a).find('td').eq(1).text();
                bValue = $(bValue).find('td').eq(1).text();
            } else if (column === 'status') {
                aValue = $(a).find('td').eq(2).text();
                bValue = $(b).find('td').eq(2).text();
            } else if (column === 'remarks') {
                aValue = $(a).find('td').eq(3).text();
                bValue = $(b).find('td').eq(3).text();
            } else if (column === 'createdDate') {
                aValue = $(a).find('td').eq(4).text();
                bValue = $(b).find('td').eq(4).text();
            }

            if (order === 'asc') {
                return aValue.localeCompare(bValue);
            } else {
                return bValue.localeCompare(aValue);
            }
        });

        $('#complain-tbody-admin').empty().append(rows);
    });

    // Row click to auto-fill form
    $('#complain-tbody-admin').on('click', 'tr', function() {
        let row = $(this);
        let id = row.data('id');
        let status = row.find('td').eq(2).text().trim();
        let remark = row.find('td').eq(3).text().trim() === '-' ? '-' : row.find('td').eq(3).text().trim();
        $('#complain-id').val(id);
        $('#statusDropDown').val(status);
        $('#remark').val(remark);
        $('#form-message').hide();
    });
});