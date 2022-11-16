<?php 

namespace App\Models;

use CodeIgniter\Database\ConnectionInterface;
use CodeIgniter\Model;

class Utmodel extends Model
{
    protected $table      = 'infos_perso';
    protected $primaryKey = 'id_login';

    protected $returnType     = 'array'; // 'object'
    protected $useSoftDeletes = false; // true => delete_at ...

    protected $allowedFields = ['LOGIN,ID_MESS_CONTACT,MDP,NOM,PRÉNOM,TYPE_DE_PROFILS,pass_hash,id_login'];

}