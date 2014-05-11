<?php

namespace Application\Service;


use Application\Form\Login;


trait ControlUtils
{

	
	/**
	 *
	 * @var Login
	 */
	private $loginForm;

	
	/**
	 * @return \Zend\Authentication\AuthenticationServiceInterface
	 */
	protected function getAuthenticationService()
	{
		if ( empty( $this -> authService ))
		{
			$this -> authService = $this -> getServiceLocator ()
				-> get ( 'Application\Service\AuthService' );
		}
		
		return $this -> authService;
		
	}
	
	/**
	 * OLD 
	 */
	
	public function onDispatch ( \Zend\Mvc\MvcEvent $e )
	{
		$this -> setLoginForm ( new Login () );

		/**
		 * Было бы хорошо конечно, но это ещё не совсем работает
		 */
		$evm = $this -> getEventManager ();
		$evm -> attach ( 'render',
				function (\Zend\Mvc\MvcEvent $e) 
				{
					$view = $e -> getViewModel ();
					$view -> setVariables ( array (
						'teachers' => $this -> getTeachers ()
					) );
				} );

		return parent::onDispatch ( $e );
	}
	
	
	public function setLoginForm ( $loginForm )
	{
		$this -> loginForm = $loginForm;
	}

	public function getLoginForm ()
	{
		return $this -> loginForm;
	}

}