<?php
require_once __DIR__ . '/../controllers/StudentController.php';
require_once __DIR__ . '/../controllers/SubjectController.php';

class UniversityAPI {
    protected $requestMethod;
    protected $endpoint;

    public function __construct() {
        $this->requestMethod = $_SERVER['REQUEST_METHOD'];
        $this->endpoint = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
    }

    public function processRequest() {
        switch ($this->endpoint) {
            case '/students':
                $response = $this->handleStudents();
                break;
            case '/subjects':
                $response = $this->handleSubjects();
                break;
            default:
                $response = $this->notFoundResponse();
                break;
        }

        header($response['status_code_header']);
        if ($response['body']) {
            echo $response['body'];
        }
    }

    protected function handleStudents() {
        if ($this->requestMethod !== 'GET') {
            return $this->methodNotAllowedResponse();
        }

        $students = new StudentController();
        $data = $students->getAllStudents();

        if (isset($data['error'])) {
            return [
                'status_code_header' => 'HTTP/1.1 500 Internal Server Error',
                'body' => json_encode($data)
            ];
        }

        return [
            'status_code_header' => 'HTTP/1.1 200 OK',
            'body' => json_encode($data)
        ];
    }

    protected function handleSubjects() {
        if ($this->requestMethod !== 'GET') {
            return $this->methodNotAllowedResponse();
        }

        $subjects = new SubjectController();
        $data = $subjects->getSoftwareEngineeringSubjects();

        return [
            'status_code_header' => 'HTTP/1.1 200 OK',
            'body' => json_encode($data)
        ];
    }

    protected function notFoundResponse() {
        return [
            'status_code_header' => 'HTTP/1.1 404 Not Found',
            'body' => json_encode(['error' => 'Endpoint not found'])
        ];
    }

    protected function methodNotAllowedResponse() {
        return [
            'status_code_header' => 'HTTP/1.1 405 Method Not Allowed',
            'body' => json_encode(['error' => 'Method not allowed for this endpoint'])
        ];
    }
}
