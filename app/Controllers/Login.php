<?php
use CodeIgniter\Controller;
use App\Models\Utmodel;
 
class Login extends Controller
{
public function signIn() 
    {
        $session = session();
        $model = new Utmodel();
        $login = $this->request->getVar('login');
        $password = $this->request->getVar('password');
        $data = $model->where('login', $login)->first();
        if ($data) {
            $pass = $data['pass_hash'];
            $verify_pass = password_verify($password, $pass);
            if ($verify_pass) {
                $sessionData = [
                    'login' => $data['login'],
                    'Nom' => $data['Nom'],
                    'Prenom' => $data['Prenom'],
                    'TYPE_DE_PROFILS' => $data['TYPE_DE_PROFILS'],
                   
                    'isLogged' => TRUE
                ];
                $session->set($sessionData);
                return redirect()->to(base_url('contact'));
            } else {
                $session->setFlashdata('msg', 'Erreur utilisateur ou mot de passe');
                echo 'erreur1';
                $_SESSION['MessageLog'] = "Passe non ok";
                return redirect()->to(base_url('login'));
            }
        } else {
            $session->setFlashdata('msg', 'Erreur utilisateur ou mot de passe');
            echo 'erreur2';
            $_SESSION['MessageLog'] = "Data non ok";
            return redirect()->to(base_url('login'));
        }
    }

    public function signOut() {
        $session = session();
        $session->destroy();
        return redirect()->to(base_url('login'));
    }
}