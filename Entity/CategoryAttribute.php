<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class CategoryAttribute
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    public ?int $id = null;

    #[ORM\Column(length: 255)]
    public ?string $code = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    public ?string $label = null;

    #[ORM\Column(nullable: true)]
    public ?int $sort_order = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: true, onDelete: 'CASCADE')]
    public ?Category $category = null;

    #[ORM\Column(nullable: true)]
    public ?bool $is_recursive = null;

    #[ORM\Column(nullable: true)]
    public ?string $type = null;
}
