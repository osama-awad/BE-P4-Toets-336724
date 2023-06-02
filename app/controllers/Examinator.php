<?php

class Examinator extends BaseController
{
    private $ExaminatorModel;

    public function __construct()
    {
        $this->ExaminatorModel = $this->model('ExaminatorModel');
    }
     
    public function index()
    {
        $result = $this->ExaminatorModel->getReuzenrad('ExaminatorModel');
 
        $rows = "";
        foreach ($result as $Examinator) {
            $rows .= "<tr>
                        <td>$Examinator->Voornaam</td>
                        <td>$Examinator->Tussenvoegsel</td>
                        <td>$Examinator->Acternaam</td>
                        <td>$Examinator->Mobiel</td>

                      </tr>";
        }
        

        $data = [
            'title' => 'top 5 hoogste reuzenraden ter wereld',
            'rows' =>$rows
        ];


        $this->view('Examinator/index', $data);
    }

}