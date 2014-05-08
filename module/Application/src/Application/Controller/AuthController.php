<?php

namespace Application\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

/**
 * Description of AuthController
 *
 * @author mice
 */
class AuthController extends AbstractActionController
{

	private $loginForm;

	public function loginAction ()
	{
		if ( !$this -> loginForm )
		{
			throw new \BadMethodCallException ( 'Login Form not yet set!' );
		}
		if ( $this -> getRequest () -> isPost () )
		{
			$this -> loginForm -> setData ( $this -> getRequest () -> getPost () );
			if ( $this -> loginForm -> isValid () )
			{
				var_dump ( $this -> loginForm -> getData () );
				exit;
			}
			else
			{
				return new ViewModel (
						[
					'form' => $this -> loginForm
						]
				);
			}
		}
		else
		{
			return new ViewModel (
					[
				'form' => $this -> loginForm
					]
			);
		}
	}

	public function setLoginForm ( $loginForm )
	{
		$this -> loginForm = $loginForm;
	}

	public function getLoginForm()
	{
		return $this->loginForm;
	}
}
