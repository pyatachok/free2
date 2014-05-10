<?php

namespace Application\Controller;


use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Application\Form\Login;
use Application\Service\EntityManagerAwareInterface;
use Application\Service\EntityManagerAwareTrait;

/**
 * Description of AuthController
 *
 * @author mice
 */
class AuthController extends AbstractActionController implements EntityManagerAwareInterface
{

	use EntityManagerAwareTrait;

	private $loginForm;

	public function loginAction ()
	{
		$this -> setLoginForm ( new Login () );
		
		if ( $this -> getRequest () -> isPost () )
		{
			$this -> loginForm -> setData ( $this -> getRequest () -> getPost () );
			if ( $this -> loginForm -> isValid () )
			{
				$data = $this -> getRequest () -> getPost ();

				// If you used another name for the authentication service, change it here
				$authService = $this -> getServiceLocator () 
						-> get ( 'Application\Service\AuthService' );

				$adapter = $authService -> getAdapter ();
				$adapter -> setIdentityValue ( $data[ 'username' ] );
				$adapter -> setCredentialValue ( $data[ 'password' ] );
				$authResult = $authService -> authenticate ();

				if ( $authResult -> isValid () )
				{
					return $this -> redirect () -> toRoute ( 'home' );
				}

				return new ViewModel ( array (
					'error' => 'Your authentication credentials are not valid',
				) );
				exit;
			}
			else
			{
				return new ViewModel (
						[
					'form' => new Login ()
						]
				);
			}
		}
		else
		{
			return new ViewModel (
					[
				'form' => new Login ()
					]
			);
		}
	}

	public function setLoginForm ( $loginForm )
	{
		$this -> loginForm = $loginForm;
	}

	public function getLoginForm ()
	{
		return $this -> loginForm;
	}

	public function usersAction ()
	{
		$users = $this
				-> getEntityManager ()
				-> getRepository ( 'Application\Entity\User' )
				-> findAll ();
		return new ViewModel (
				[
			'users' => $users
				]
		);
	}

}
