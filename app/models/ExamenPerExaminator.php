<?php

class ExamenPerExaminatorModel
{
    private $db;

    public function __construct()
    {
        $this ->db = new Database();
    }

    public function getExamenPerExaminator()
    {
        $sql = "SELECT Id
                       ,ExaminatorId
                       ,ExamenId
                FROM    ExamenPerExaminator";

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}