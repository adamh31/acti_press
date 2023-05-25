<?php  namespace App\Controllers;
use CodeIgniter\Controller;
use App\Models\Utmodel;
 
class Login extends Controller
{
     public function signer() {
        $data['title'] = "Page de connexion";
        echo view('/Templates/Header', $data);
        echo view('pages/login', $data);
        echo view('Templates/Footer', $data);
    }
public function signIn() 
    {
        $session = session();
        $model = new Utmodel();
        $email = $this->request->getVar('email');
        $password = $this->request->getVar('mot_de_passe');
        $data = $model->where('email', $email)->first();
        if ($data) {
            $pass = $data['mot_de_passe'];
            $verify_pass = password_verify($password, $pass);
            if ($verify_pass) {
                $sessionData = [
                    'email' => $data['email'],
                    'nom' => $data['nom'],
                    'prenom' => $data['prenom'],
                    'isLogged' => TRUE
                ];
                $session->set($sessionData);
                return redirect()->to(base_url('pages'));
            } else {
                $session->setFlashdata('msg', 'Erreur utilisateur ou mot de passe');
                echo 'erreur1';
                $_SESSION['MessageLog'] = "Passe non ok";
                return redirect()->to(base_url('messagerie/login'));
            }
        } else {
            $session->setFlashdata('msg', 'Erreur utilisateur ou mot de passe');
            echo 'erreur2';
            $_SESSION['MessageLog'] = "Data non ok";
            return redirect()->to(base_url('messagerie/login'));
        }
    }

    public function signOut() {
        $session = session();
        $session->destroy();
        return redirect()->to(base_url('login'));
    }
    
     public function logIn()
    {
        session_start();

        $db = \Config\Database::connect();
        $builder = $db->table("utilisateurs");

        $builder->selectCount('id');
        $builder->where("email", $this->request->getVar("email"));
        $builder->where("mot_de_passe", $this->request->getVar("mot_de_passe"));
        $res = $builder->get();
        foreach($res->getResult() as $r){
            if($r->id == 1){
                // set session id
                $builder = $db->table("utilisateurs");
                $this->canSendTo($this->request->getVar("email"));
                $this->setSessionId($this->request->getVar("email"));
                $_SESSION['email'] = $this->request->getVar("email");
                return redirect()->to(base_url("pages"));
            }else{
                return redirect()->to(base_url("messagerie/login"));
            }
        }
    }
}