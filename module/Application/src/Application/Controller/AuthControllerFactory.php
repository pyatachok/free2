<?php

namespace Application\Controller;

use Zend\ServiceManager\FactoryInterface;
use Zend\ServiceManager\ServiceLocatorInterface;
use Application\Form\Login;


/**
 * Description of AuthControllerFactory
 *
 * @author mice
 */
class AuthControllerFactory extends FactoryInterface
{

	public function createService ( ServiceLocatorInterface $serviceLocator )
	{
		$ctr = new AuthController();
		$ctr -> setLoginForm ( new Login () );
		return $ctr;
	}

}
