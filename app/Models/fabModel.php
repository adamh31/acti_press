<?php 

namespace App\Models;

use CodeIgniter\Database\ConnectionInterface;
use CodeIgniter\Model;

class fabModel extends Model
{
    protected $table      = 'fabricant';
    protected $primaryKey = 'fab_ref';

    protected $returnType     = 'array'; // 'object'
    protected $useSoftDeletes = false; // true => delete_at ...

    protected $allowedFields = ['fab_ref','fab_nom', 'fab_web','fab_coord'];

}
