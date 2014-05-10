<?php

namespace Application\Controller;


use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Application\Form\Login;
use Application\Service\EntityManagerAwareInterface;
use Application\Service\EntityManagerAwareTrait;
use Zend\Authentication\AuthenticationServiceInterface;

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

		/**
		 * @var AuthenticationServiceInterface $authService
		 */
		$authService = $this -> getServiceLocator ()
				-> get ( 'Application\Service\AuthService' );

		if ( $authService -> hasIdentity () )
		{
			return new ViewModel ( array (
				'loggedUser' => $authService -> getIdentity (),
					) );
		}

		if ( $this -> getRequest () -> isPost () )
		{
			$this -> loginForm -> setData ( $this -> getRequest () -> getPost () );
			if ( $this -> loginForm -> isValid () )
			{

				$data = $this -> getRequest () -> getPost ();

				$adapter = $authService -> getAdapter ();
				$adapter -> setIdentityValue ( $data[ 'username' ] );
				$adapter -> setCredentialValue ( $data[ 'password' ] );
				$authResult = $authService -> authenticate ();

				if ( $authResult -> isValid () )
				{
					$identity = $authResult -> getIdentity ();
					$authService -> getStorage () -> write ( $identity );

					return new ViewModel ( array (
						'loggedUser' => $identity,
							) );
				}

				return new ViewModel ( array (
					'error' => 'Your authentication credentials are not valid',
						) );
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

	public function logoutAction ()
	{
		$authService = $this -> getServiceLocator ()
				-> get ( 'Application\Service\AuthService' );
		if ( $authService -> hasIdentity () )
		{
				$authService -> clearIdentity ();
		}
		$this->redirect()->toUrl('/login');
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
