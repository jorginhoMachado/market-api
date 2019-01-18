<?php

namespace App\Http\Middleware;

use Closure;
use Doctrine\DBAL\Connection;
use Doctrine\DBAL\Event\ConnectionEventArgs;
use Doctrine\DBAL\Event\Listeners\OracleSessionInit;
use Doctrine\ORM\EntityManager;
use Illuminate\Contracts\Foundation\Application;

class OracleInitSession
{
    /**
     * The application implementation.
     *
     * @var \Illuminate\Contracts\Foundation\Application
     */
    protected $app;

    /**
     * Create a new middleware instance.
     *
     * @param  \Illuminate\Contracts\Foundation\Application  $app
     * @return void
     */
    public function __construct(Application $app)
    {
        $this->app = $app;
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     *
     * @throws \Symfony\Component\HttpKernel\Exception\HttpException
     */
    public function handle($request, Closure $next)
    {

        /** @var EntityManager $entityManager */
        $entityManager = $this->app->get(EntityManager::class);
        /** @var \Doctrine\DBAL\Connection $connection */
        $connection = $entityManager->getConnection();
        if ($connection->getDriver()->getName() !== 'oci8') {
            return $next($request);
        }
        $connection = $entityManager->getConnection();
        $oracleInitSession = new OracleSessionInit([]);
        $connectionEventArguments = new ConnectionEventArgs($connection);
        $oracleInitSession->postConnect($connectionEventArguments);

        return $next($request);
    }
}
