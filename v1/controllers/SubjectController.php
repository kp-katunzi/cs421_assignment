<?php
require_once __DIR__ . '/../models/Subject.php';

class SubjectController {
    public function getSoftwareEngineeringSubjects() {
        try {
            $subjectModel = new Subject();
            return $subjectModel->getSoftwareEngineeringSubjects();
        } catch (Exception $e) {
            return ['error' => $e->getMessage()];
        }
    }
}
?>