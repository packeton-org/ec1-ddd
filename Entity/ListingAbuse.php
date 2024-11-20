<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class ListingAbuse
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    public ?int $id = null;

    #[ORM\ManyToOne]
    public ?User $reported_by = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: true, onDelete: 'SET NULL')]
    public ?Listing $listing = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    public ?string $reason = null;

    #[ORM\Column(nullable: true)]
    public ?\DateTimeImmutable $created_at = null;
}
