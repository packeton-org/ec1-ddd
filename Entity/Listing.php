<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity]
class Listing
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    public ?int $id = null;

    #[ORM\ManyToOne]
    public ?Category $category = null;

    #[ORM\Column(length: 255)]
    public ?string $title = null;

    #[ORM\Column(length: 255)]
    public ?string $status = null;

    #[ORM\Column(type: Types::TEXT, nullable: true)]
    public ?string $description = null;

    #[ORM\Column]
    public ?\DateTimeImmutable $created_at = null;

    #[ORM\Column(nullable: true)]
    public ?\DateTimeImmutable $updated_at = null;

    #[ORM\ManyToOne]
    public ?User $user = null;

    /**
     * @var Collection<int, ListingImage>
     */
    #[ORM\OneToMany(mappedBy: 'listing_id', targetEntity: ListingImage::class)]
    public Collection $images;

    public function __construct()
    {
        $this->images = new ArrayCollection();
    }
}
