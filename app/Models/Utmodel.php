<?php 

namespace App\Models;

use CodeIgniter\Database\ConnectionInterface;
use CodeIgniter\Model;

class Utmodel extends Model
{
    protected $table      = 'utilisateurs';
    protected $primaryKey = 'id';

    protected $returnType     = 'array'; // 'object'
    protected $useSoftDeletes = false; // true => delete_at ...

    protected $allowedFields = ['id,nom,prenom,email,mot_de_passe,date_inscription'];

}