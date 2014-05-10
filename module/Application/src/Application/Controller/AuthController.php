<?php

namespace Application\Controller;


use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Application\Form\Login;
use Application\Service\EntityManagerAwareInterface;
use Application\Service\EntityManagerAwareTrait;
use Zend\Authentication\AuthenticationServiceInterface;
use Application\Service\ControlUtils;
use Application\Form\Registration;
use Application\Entity\User;

/**
 * Description of AuthController
 *
 * @author mice
 */
class AuthController extends AbstractActionController implements EntityManagerAwareInterface
{

	use EntityManagerAwareTrait,
	 ControlUtils;

	/**
	 *
	 * @var Login
	 */
	private $loginForm;

	/**
	 *
	 * @var Registration
	 */
	private $registrationFrom;

	/**
	 *
	 * @var AuthenticationServiceInterface
	 */
	protected $authService;

	public function loginAction ()
	{
		$this -> setLoginForm ( new Login () );


		if ( $this -> getAuthenticationService () -> hasIdentity () )
		{
			return new ViewModel ( array (
				'loggedUser' => $this -> getAuthenticationService () -> getIdentity (),
					) );
		}

		if ( $this -> getRequest () -> isPost () )
		{
			$this -> loginForm -> setData ( $this -> getRequest () -> getPost () );
			if ( $this -> loginForm -> isValid () )
			{

				$data = $this -> getRequest () -> getPost ();

				$adapter = $this -> getAuthenticationService () -> getAdapter ();
				$adapter -> setIdentityValue ( $data[ 'username' ] );
				$adapter -> setCredentialValue ( $data[ 'password' ] );
				$authResult = $this -> getAuthenticationService () -> authenticate ();

				if ( $authResult -> isValid () )
				{
					$identity = $authResult -> getIdentity ();
					$this -> getAuthenticationService () -> getStorage () -> write ( $identity );

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
		if ( $this -> getAuthenticationService () -> hasIdentity () )
		{
			$this -> getAuthenticationService () -> clearIdentity ();
		}
		$this -> redirect () -> toUrl ( '/login' );
	}

	public function registrationAction ()
	{
		if ( $this -> getAuthenticationService () -> hasIdentity () )
		{
			$this -> redirect () -> toRoute ( '/home' );
		}

		$this -> registrationFrom = new Registration();

		if ( $this -> getRequest () -> isPost () )
		{
			$this -> registrationFrom -> setData ( $this -> getRequest () -> getPost () );
			if ( $this -> registrationFrom -> isValid () )
			{
				$data = $this -> getRequest () -> getPost ();
				
				$em = $this -> getEntityManager ();
				$newUser = new User();
				$newUser -> setUserName($data[ 'username' ])
					-> setPassword($data[ 'password' ]);
				$em -> persist($newUser);
				$em->flush();
				
				
				
				return new ViewModel ( array (
							'error' => 'user is added',
						) );
			}
			else
			{
				print_r ( $this -> registrationFrom -> getInputFilter () ->  getMessages ());
				return new ViewModel (
						[
							'form' => $this -> registrationFrom
						]
				);
			}
		}
		else
		{
			return new ViewModel (
					[
						'form' => $this -> registrationFrom
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
