<?php
/*
 * Copyright (c) 2024.
 * Develop By: Alexsander Hendra Wijaya
 * Github: https://github.com/alexistdev
 * Phone : 0823-7140-8678
 * Email : Alexistdev@gmail.com
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{

    protected $users;

    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            $this->users = Auth::user();
            return $next($request);
        });
    }

    public function index()
    {
        return view('admin.dashboard', array(
            'title' => "Dashboard Administrator | MyKlinik v.1.0",
            'firstMenu' => 'dashboard',
            'secondMenu' => 'dashboard',
        ));
    }
}
