<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function user() {
        return $this->belongsTo(User::class, 'created_by');
    }
    public function votes() {
        return $this->hasMany(Vote::class);
    }
    public function comments() {
        return $this->hasMany(Comment::class)->whereNull('parent_id');
    }


}
