<?php

class ExaminatorModel
{
    private $db;

    public function __construct()
    {
        $this ->db = new Database();
    }

    public function getExaminator()
    {
        $sql = "SELECT Id
                       ,Voornaam 
                       ,Tussenvoegsel
                       ,Acternaam
                       ,Mobiel
                FROM    reuzenrad";

        $this->db->query($sql);

        return $this->db->resultSet();
    }
}