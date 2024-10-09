<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Employee List</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h4 class="mt-4">Employee Curd Operation with JSTL Aajax JavaScript JQuery </h4>
    <h4 class="mt-4">Employee List</h4>
    <button class="btn btn-success mb-3" id="addEmployeeBtn">Add New Employee</button>
    <table class="table table-bordered table-hover">
        <thead class="thead-dark">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Department</th>
            <th>Salary</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <!-- Use JSTL to loop through the list of employees -->
        <c:forEach var="employee" items="${employees}">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.name}</td>
                <td>${employee.department}</td>
                <td>${employee.salary}</td>
                <td>
                    <button class="btn btn-warning btn-sm editEmployee" data-id="${employee.id}">Edit</button>
                    <button class="btn btn-danger btn-sm deleteEmployee" data-id="${employee.id}">Delete</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        // Add new employee
        $('#addEmployeeBtn').click(function () {
            window.location.href = "/employees/add";  // Redirect to add form
        });

        // Delete employee using AJAX
        $(document).on('click', '.deleteEmployee', function () {
            const employeeId = $(this).data('id');
            console.log("Deleting employee with ID: " + employeeId); // Debugging log

            if (confirm("Are you sure you want to delete this employee?")) {
                $.ajax({
                    type: "DELETE",
                    url: '/employees/delete/' + employeeId,
                    // This will now pass employeeId correctly
                    success: function () {
                        alert("Employee deleted successfully.");
                        location.reload();  // Reload the page to reflect changes
                    },
                    error: function () {
                        alert("Failed to delete employee.");
                    }
                });
            }
        });

        // Edit employee (Redirect to edit form)
        $(document).on('click', '.editEmployee', function () {
            const employeeId = $(this).data('id');
           console.log("Editing employee with ID: " + employeeId); // Debugging log
            window.location.href = '/employees/edit/' + employeeId;   // This will now pass employeeId correctly
        });
    });

</script>

</body>
</html>
