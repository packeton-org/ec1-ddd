<?php

namespace App\Entity;

use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class ListingAttributeValue
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    public ?int $id = null;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: true, onDelete: 'CASCADE')]
    public ?Listing $listing = null;

    #[ORM\ManyToOne]
    public ?CategoryAttribute $attribute = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    public ?string $text1 = null;

    #[ORM\Column(nullable: true)]
    public ?float $float1 = null;

    #[ORM\Column(nullable: true)]
    public ?bool $bool1 = null;

    #[ORM\Column(nullable: true)]
    public ?\DateTimeImmutable $date1 = null;
}
