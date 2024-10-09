<html>
<head>
    <title>Employee Form</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="mt-4">Employee Form</h2>
    <form id="employeeForm">
        <div class="form-group">
            <label for="id">Employee ID:</label>
            <input type="text" class="form-control" id="id" name="id" value="${employee.id}" required ${employee.id != null ? 'readonly' : ''} />
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" id="name" name="name" value="${employee.name}" required minlength="3" />
        </div>
        <div class="form-group">
            <label for="department">Department:</label>
            <input type="text" class="form-control" id="department" name="department" value="${employee.department}" />
        </div>
        <div class="form-group">
            <label for="salary">Salary:</label>
            <input type="text" class="form-control" id="salary" name="salary" value="${employee.salary}" />
        </div>
        <button type="submit" class="btn btn-primary">Save</button>
        <a href="${pageContext.request.contextPath}/employees/list" class="btn btn-secondary mt-3">Back to List</a>
    </form>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        // Handle form submission using AJAX
        $('#employeeForm').submit(function (e) {
            e.preventDefault();
            const formData = {
                id: $('#id').val(),
                name: $('#name').val(),
                department: $('#department').val(),
                salary: $('#salary').val()
            };
            $.ajax({
                type: "POST",
                url: "/employees/save",
                contentType: "application/json",
                data: JSON.stringify(formData),
                success: function () {
                    alert("Employee saved successfully.");
                    window.location.href = "/employees/list";  // Redirect to employee list
                },
                error: function () {
                    alert("Failed to save employee.");
                }
            });
        });
    });
</script>

</body>
</html>
