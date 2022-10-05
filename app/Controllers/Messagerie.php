<?php namespace App\Controllers;
 
use CodeIgniter\Controller;
use App\Models\fabModel;
 
class Messagerie extends Controller
{
    public function view($page, $data)  {
	$data['title'] = "Fabricants : ". ucfirst($page); // ucfirst() : Met en Capitale la 1ere lettre
	echo view('templates/header', $data);
	echo view('pages/fabricant/'.$page, $data);
	echo view('templates/footer', $data);
    }
    public function lister()  {
	$model = new fabModel();
	$data['lesFabricants'] = $model->orderBy('fab_ref')->findAll();
	Fabricant::view("fabricant-list", $data);
    }
    public function see_mail(){
       echo view('pages/messagerie/see_mail');
	
    }
    public function contact(){
        echo view ('contact');
       
    }
    public function index()  {
	Fabricant::lister();
    }
    public  function update(){
        $model = new fabModel();
        $ref = $this->request->getVar('ref');
        $data= [
            'fab_nom'=>$this->request->getVar('nom'),
            'fab_web'=>$this->request->getVar('site'),
            'fab_coord'=>$this->request->getVar('adr'),
        ];
        $save = $model->update($ref,$data);
        return redirect()->to(base_url('fabricant'));
        
    }
    public function modifier($ref){
        $model = new fabModel();
        $data['fab'] = $model->where('fab_ref',$ref)->first();
        Fabricant::view("modif", $data);
    }
    public function ajouter(){
        $data = [
            "fab_ref"=> '',
            "fab_nom"=> '',
            "fab_web"=> '',
            "fab_coor"=> '',
        ];
        Fabricant::view("ajouter", $data);
    }
    public function add(){
        $model = new fabModel();
        $data = [
            'fab_ref'=>$this->request->getVar('ref'),
            'fab_nom'=>$this->request->getVar('nom'),
            'fab_web'=>$this->request->getVar('site'),
            'fab_coord'=>$this->request->getVar('adr'),
        ];
        $save = $model->insert($data);
        return redirect()->to(base_url('fabricant'));
    }
    public function visualiser($ref) {
        $model = new fabModel();
        $data ['fab'] = $model->where('fab_ref', $ref)->first();
        Fabricant::view("visualiser", $data);
    }
}
    