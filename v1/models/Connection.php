<?php
require_once __DIR__ . '/../config/db.php';

class Connection {
    private static $instance = null;
    private $connection;

    /**
     * @throws Exception
     */
    private function __construct() {
        $config = require __DIR__ . '/../config/db.php';

        try {
            $this->connection = new PDO(
                "mysql:host={$config['host']};dbname={$config['database']};charset={$config['charset']}",
                $config['username'],
                $config['password']
            );
            $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->connection->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            throw new Exception("Database connection failed: " . $e->getMessage());
        }
    }

    public static function getInstance() {
        if (!self::$instance) {
            self::$instance = new Connection();
        }
        return self::$instance;
    }

    public function getConnection() {
        return $this->connection;
    }

    public function __destruct() {
        $this->connection = null;
    }
}
