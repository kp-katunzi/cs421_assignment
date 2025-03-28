<?php
require_once __DIR__ . '/Connection.php';

class Subject {
    private $db;

    public function __construct() {
        $this->db = Connection::getInstance()->getConnection();
    }

    public function getSoftwareEngineeringSubjects() {
        try {
            $stmt = $this->db->query("
                SELECT s.*, y.name AS year_name 
                FROM subjects s
                JOIN years y ON s.year_id = y.id
                WHERE s.program_id = (
                    SELECT id FROM programs WHERE name = 'Software Engineering'
                )
                ORDER BY y.id, s.name
            ");

            $subjects = $stmt->fetchAll();

            // Organize by year
            $result = [];
            foreach ($subjects as $subject) {
                $year = $subject['year_name'];
                unset($subject['year_name']);
                $result[$year][] = $subject;
            }

            return $result;
        } catch (PDOException $e) {
            throw new Exception("Failed to fetch subjects: " . $e->getMessage());
        }
    }

    // Add more methods as needed
}
?>