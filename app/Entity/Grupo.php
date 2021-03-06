<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;
use JMS\Serializer\Annotation as JMS;

/**
 * @ORM\Table(name="Grupo")
 * @ORM\Entity(repositoryClass="App\Repository\GrupoRepository")
 */
class Grupo
{
    /**
     * @var integer
     * @ORM\Id
     * @ORM\Column(
     *     name="nu_grupo",
     *     length=10,
     *     type="integer",
     *     options={"comment":"Codigo chave da tabela, PK Identity identifica o registro unico"}
     * )
     * @ORM\GeneratedValue(strategy="CUSTOM")
     * @ORM\CustomIdGenerator(class="App\Bridge\Doctrine\ORM\Id\OracleIdentityGenerator")
     */
    private $id;

    /**
     * @var string
     * @ORM\Column(
     *     name="no_grupo",
     *     type="string",
     *     length=200,
     *     options={"comment":"Nome do grupo."}
     * )
     */
    private $grupo;
}
