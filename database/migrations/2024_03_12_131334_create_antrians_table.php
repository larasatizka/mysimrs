<?php
/*
 * Copyright (c) 2024.
 * Develop By: Alexsander Hendra Wijaya
 * Github: https://github.com/alexistdev
 * Phone : 0823-7140-8678
 * Email : Alexistdev@gmail.com
 */

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{

    public function up(): void
    {
        Schema::create('antrians', function (Blueprint $table) {
            $table->id();
            $table->foreignId('rekam_id')
                ->constrained('rekams')
                ->onUpdate('cascade')
                ->onDelete('cascade');
            $table->integer('nomor');
            $table->softDeletes();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('antrians');
    }
};
