<?php

class ExamenModel
{
    private $db;

    public function __construct()
    {
        $this ->db = new Database();
    }

    public function getExamen()
    {
        $sql = "select Examen.Id  as Examenid
        ,Examen.StudentId
        , Examen.Rijschool, 
        Examen.Stad
        , Examen.Rijbewijscategorie
        , Examen.Datum 
        , Examen.Uitslag
from Examen order by AantalSterren desc";

        $this->db->query($sql);

        return $this->db->resultSet();
    }





    public function getExameninfo($ExamenId)
{
    $sql = "select Examen.StudentId,
    Examen.Rijschool, 
    Examen.Stad,
    Examen.Rijbewijscategorie,
    Examen.Datum,
    Examen.Uitslag
    Examen.AantalSterren from Examen
    where Examen.Id = :Id";

    $this->db->query($sql);
    $this->db->bind(    ':Id', $ExamenId, PDO::PARAM_INT);
// single krijg ik 1 naam van 1 kolom
    $result = $this->db->single();
    return $result;

}

   
}
