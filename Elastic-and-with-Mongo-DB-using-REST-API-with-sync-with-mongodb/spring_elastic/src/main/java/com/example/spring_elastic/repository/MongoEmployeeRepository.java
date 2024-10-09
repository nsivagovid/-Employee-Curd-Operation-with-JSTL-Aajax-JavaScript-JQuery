package com.example.spring_elastic.repository;

import com.example.spring_elastic.model.EmployeeMongo;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface MongoEmployeeRepository extends MongoRepository<EmployeeMongo, String> {
}