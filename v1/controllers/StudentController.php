<?php
require_once __DIR__ . '/../models/Student.php';

class StudentController {
    public function getAllStudents() {
        try {
            $studentModel = new Student();
            return $studentModel->getAllStudents();
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }
}
