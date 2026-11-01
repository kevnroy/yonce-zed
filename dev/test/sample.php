<?php
declare(strict_types=1);

namespace App;

final class Track
{
    public function __construct(
        private readonly string $title,
        private int $plays = 0,
    ) {}

    public function score(): float
    {
        return $this->plays > 0 ? $this->plays / 10 : 0.0;
    }
}

$track = new Track('Formation', 42);
echo "Score: {$track->score()}\n";
