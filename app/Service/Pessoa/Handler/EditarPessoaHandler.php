<?php

namespace App\Service\Pessoa\Handler;

use App\Entity\Cidade;
use App\Entity\HistoricoOperacao;
use App\MensagemSistema;
use App\Repository\CidadeRepository;
use App\Service\HistoricoOperacaoService;
use Doctrine\ORM\EntityManager;
use App\Entity\Pessoa;
use App\Repository\PessoaRepository;
use App\Service\Pessoa\Command\EditarPessoaCommand;

final class EditarPessoaHandler
{
    /**
     * @var EntityManager
     */
    private $em;
    /**
     * @var PessoaRepository
     */
    private $repository;

    /**
     * @var CidadeRepository
     */
    private $cidadeRepository;

    /**
     * @var HistoricoOperacaoService
     */
    private $log;

    /**
     * EditarPessoaHandler constructor .
     * @param EntityManager $em
     * @param PessoaRepository $repository
     * @param CidadeRepository $cidadeRepository
     * @param HistoricoOperacaoService $log
     */
    public function __construct(
        EntityManager $em,
        PessoaRepository $repository,
        CidadeRepository $cidadeRepository,
        HistoricoOperacaoService $log
    ){
        $this->em = $em;
        $this->repository = $repository;
        $this->cidadeRepository = $cidadeRepository;
        $this->log = $log;
    }

    public function handle(EditarPessoaCommand $command)
    {
        $this->em->beginTransaction();
        try {
            /**
             * @var Pessoa $entity
             */
            $entity = $this->repository->find($command->getId());

            /** @var Cidade $cidade */
            $cidade = $this->cidadeRepository->find($command->getCidade());
            if (is_numeric($entity->getId()) !== 0 && is_numeric($cidade->getId()) !== 0 ) {
                $entity
                    ->setNome($command->getNome())
                    ->setEndereco($command->getEndereco())
                    ->setBairro($command->getBairro())
                    ->setTelefone($command->getTelefone())
                    ->setEmail($command->getEmail())
                    ->setCidade($cidade);
                $this->repository->add($entity);
                $this->log->addHistoricoPessoa(
                    HistoricoOperacao::TIPO_OP_UPDATE,
                    $entity,
                    MensagemSistema::get('LOG002')
                );
                $this->em->commit();
            }
        } catch (\Exception $e) {
            $this->em->rollback();
            throw $e;
        }
    }
}
