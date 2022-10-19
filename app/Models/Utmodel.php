<?php 

namespace App\Models;

use CodeIgniter\Database\ConnectionInterface;
use CodeIgniter\Model;

class Utmodel extends Model
{
    protected $table      = 'infos_perso';
    protected $primaryKey = 'login';

    protected $returnType     = 'array'; // 'object'
    protected $useSoftDeletes = false; // true => delete_at ...

    protected $allowedFields = ['login,id_mess_contact,mdp,nom,prénom,type_de_profils'];

}