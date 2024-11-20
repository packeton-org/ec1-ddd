<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class PrivateMessages
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    public ?int $id = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(name: 'from_id', nullable: true, onDelete: 'SET NULL')]
    public ?User $from_id = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(name: 'chat_id', nullable: true, onDelete: 'SET NULL')]
    public ?User $chat_id = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: true, onDelete: 'SET NULL')]
    public ?Listing $listing = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    public ?string $message = null;

    #[ORM\Column(nullable: true)]
    public ?\DateTimeImmutable $created_at = null;
}
