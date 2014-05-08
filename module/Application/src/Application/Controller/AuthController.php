<?php
namespace  Application\Controller;

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

	public function loginAction()
	{
		if (!$this->loginForm)
		{
			throw new \BadMethodCalled('Login Form not yet set!');
		}

		
	}
}
