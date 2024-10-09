package com.example.spring_elastic.controller;

import com.example.spring_elastic.model.EmployeeMongo;
import com.example.spring_elastic.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/employees")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    // Display all employees test
    @GetMapping("/list")
    public String viewEmployeesList(Model model) {
        List<EmployeeMongo> employees = employeeService.getAllEmployeesFromMongo();
        model.addAttribute("employees", employees); // Pass the employee list to the view
        return "employee-list";
    }

    // Fetch single employee data for editing
    @GetMapping("/edit/{id}")
    public String showUpdateEmployeeForm(@PathVariable String id, Model model) {
        Optional<EmployeeMongo> employee = employeeService.getEmployeeFromMongoDBById(id);
        if (employee.isPresent()) {
            model.addAttribute("employee", employee.get());
            return "employee-form";  // Render employee form for editing
        } else {
            return "redirect:/employees/list";  // Redirect if employee not found
        }
    }

    // Save employee (MongoDB and Elasticsearch)
    @PostMapping("/save")
    @ResponseBody
    public String saveEmployee(@RequestBody EmployeeMongo employee) throws IOException {
        employeeService.saveEmployee(employee);
        return "Employee saved successfully";
    }

    // Delete employee by ID (MongoDB and Elasticsearch)
    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public String deleteEmployee(@PathVariable String id) throws IOException {
        employeeService.deleteEmployeeById(id);
        return "Employee deleted successfully";
    }

    // Add new employee form
    @GetMapping("/add")
    public String showAddEmployeeForm(Model model) {
        model.addAttribute("employee", new EmployeeMongo());
        return "employee-form";  // Show form for adding a new employee
    }
}
