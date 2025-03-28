<?php
require_once __DIR__ . '/Connection.php';

class Student {
    private $db;

    public function __construct() {
        $this->db = Connection::getInstance()->getConnection();
    }

    public function getAllStudents($id = 1) {
        try {
            $stmt = $this->db->query("SELECT * FROM students WHERE program_id= $id");
            return $stmt->fetchAll();
        } catch (PDOException $e) {
            throw new Exception("Failed to fetch students: " . $e->getMessage());
        }
    }

    public function getStudentById($id) {
        try {
            $stmt = $this->db->prepare("SELECT * FROM students WHERE id = :id");
            $stmt->execute([':id' => $id]);
            return $stmt->fetch();
        } catch (PDOException $e) {
            throw new Exception("Failed to fetch student: " . $e->getMessage());
        }
    }
}
