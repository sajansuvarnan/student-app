package com.example.student_app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class StudentController {


    @Autowired
    StudentRepo repo;

    @RequestMapping("/getStudents")
    public List<Student> getStudents()
    {
        return repo.findAll();

    }

    @RequestMapping("/addStudents")
    public void addStudents()
    {
        Student s = new Student();
        s.setName("Suvarnan");
        s.setAge(60);

        repo.save(s);
    }
}
