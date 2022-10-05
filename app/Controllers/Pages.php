<?php
namespace App\Controllers;

use CodeIgniter\Controller;

    class Pages extends BaseController
{
	public function index()
	{
		return view('welcom_message');
	}
	public function view($page = 'home') {
            
            if (! is_file(APPPATH.'Views/pages/'.$page.'.php')){
                //Whoops, page inconnue !
                throw new \CodeIgniter\Exceptions\PageNotFoundException($page);
            }
            $data['title'] = ucfirst($page); // Met en Captila la 1ere lettre
            
            echo view('templates/header',$data);
            echo view('pages/'.$page,$data);
            echo view('templates/footer',$data);
        }
}