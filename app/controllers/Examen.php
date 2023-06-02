<?php

class Examen extends BaseController
{
    private $ExamenModel;

    public function __construct()
    {
        $this->ExamenModel = $this->model('ExamenModel');
    }
     
    public function index()
    {
        /**haal alle instucteurs op uit de database (model)*/

         $Examen = $this->ExamenModel->getExamen();
        /**maak de rows voor de tbody in de view*/
        $rows = "";
        foreach ($Examen as $value) {
           
            $Datum = date_create($value->Datum);
            $Datum = date_format($Datum, 'd-m-y');

            $rows .= "<tr>
                        <td>$value->StudentId</td>
                        <td>$value->Rijschool</td>
                        <td>$value->Stad</td>
                        <td>$value->Rijbewijscategorie</td>
                        <td>$Datum</td>
                        </tr>
                      </tr>";
        }
        //**het data array geeft alle*/

        $data = [
            'titleaaa' => 'Examen in dienst:
                                ',
                                'AmountofExamen' => sizeof($Examen),

            'rows' =>$rows
        ];


        $this->view('Examen/index',$data);
    }


    public function gebruiktevoertuigen($ExamenId)
    {
    
        $ExamenId1 = $this->ExamenModel->getExamenId($ExamenId);
        $ExamenId2 = $this->ExamenModel->getExameninfo($ExamenId);

     //var_dump($InstructeurId1);

    $rows = "";
    foreach ($ExamenId1 as $value) {
        $rows .= "<tr>
                    <td>$value->ExamenId</td>
                    <td>$value->ExaminatorId</td>

                    </tr>
                  </tr>";
    }
                  $data = [
                    'titl' => 'Examen in dienst:
                                        ',
                                        'AmountofExamen' => sizeof($ExamenId1),
                    'StudentId' =>$ExamenId2 -> StudentId,
                    'Rijschool' =>$ExamenId2 -> Rijschool,
                    'Stad' =>$ExamenId2 -> Stad,
                    'Rijbewijscategorie' =>$ExamenId2 -> Rijbewijscategorie,
                    'Datum' =>$ExamenId2 -> Datum,
                    'Uitslag' =>$ExamenId2 -> Uitslag,

                    
                              
                                               
                    'rows' =>$rows
                ];
        
        
                $this->view('Examen/Gebruiktevoertuigen',$data);
            }
    









    // {

    //     $InstructeurId = $this->InstructeurModel-> getInstructeurId($InstructeurId);
       
    //     var_dump($InstructeurId);
    //     exit;


    //     $data = [
        
    //     ];

        


    //     $this->view('Instructeur/gebruiktevoertuigen',$data);
    // }


}