<?php

class ExamenPerExaminator extends BaseController
{
    private $ExamenPerExaminatorModel;

    public function __construct()
    {
        $this->ExamenPerExaminatorModel = $this->model('ExamenPerExaminatorModel');
    }
     
    public function index()
    {
        $result = $this->ExamenPerExaminatorModel->getRankufc('ExamenPerExaminatorModel');
 
        $rows = "";
        foreach ($result as $ExamenPerExaminator) {
            $rows .= "<tr>
                        <td>$ExamenPerExaminator->ExamenId</td>
                        <td>$ExamenPerExaminator->ExaminatorId</td>

                      </tr>";
        }
        

        $data = [
            'title' => 'MEN S POUND-FOR-POUND TOP RANK UFC',
            'rows' =>$rows
        ];


        $this->view('ExamenPerExaminator/index', $data);
    }

}