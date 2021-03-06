<?php

namespace App\Business\Exception;

use Throwable;

/**
 * @codeCoverageIgnore
 * Class BusinessException
 * @package App\Business\Exception
 */
class BusinessException extends \Exception
{
    public function __construct(string $message = "", int $code = 0, Throwable $previous = null)
    {
        //toda exception de business é 422
        parent::__construct($message, 422, $previous);
    }
}
