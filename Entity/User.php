<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class User
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    public ?int $id = null;

    #[ORM\Column(length: 255)]
    public ?string $username = null;

    #[ORM\Column(length: 255, nullable: true)]
    public ?string $email = null;

    #[ORM\Column(nullable: true)]
    public ?bool $is_active = null;

    #[ORM\Column(length: 255, nullable: true)]
    public ?string $password_hash = null;

    #[ORM\Column(length: 255, nullable: true)]
    public ?string $phone_number = null;

    #[ORM\Column(nullable: true)]
    public ?\DateTimeImmutable $created_at = null;

    #[ORM\Column(type: 'json', nullable: true)]
    private ?array $roles = null;
}
