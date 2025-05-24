<?php
/*
 * Copyright (c) 2024.
 * Develop By: Alexsander Hendra Wijaya
 * Github: https://github.com/alexistdev
 * Phone : 0823-7140-8678
 * Email : Alexistdev@gmail.com
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Poliklinik extends Model
{

    use SoftDeletes;

    protected $table = "polikliniks";

    protected $fillable = ["name"];

    public function dokter(){
        return $this->belongsTo(Dokter::class,'id','poliklinik_id');
    }

}
