<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class AuditData
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    public ?int $id = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: true, onDelete: 'SET NULL')]
    public ?User $user = null;

    #[ORM\Column(length: 255)]
    public ?string $table_name = null;

    #[ORM\Column]
    public ?int $record_id = null;

    #[ORM\Column(length: 255, nullable: true)]
    public ?string $event = null;

    #[ORM\Column]
    public ?\DateTimeImmutable $created_at = null;

    #[ORM\Column(length: 255, nullable: true)]
    public ?string $ip_address = null;

    #[ORM\Column(nullable: true)]
    public ?array $old_value = null;

    #[ORM\Column(nullable: true)]
    public ?array $new_value = null;
}
