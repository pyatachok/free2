<?php

namespace Application\Service;

trait ControlUtils
{

	
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

}