<?php
namespace Application\Service;

trait ControlUtils {
    
    public function onDispatch(\Zend\Mvc\MvcEvent $e)
    {
	$evm = $this->getEventManager();
	$evm->attach('render', function (\Zend\Mvc\MvcEvent $e) {
	    $view = $e->getViewModel();
	    $view->setVariables(array(
		'teachers' => $this->getTeachers()
	    ));
	});
	
	return parent::onDispatch($e);
    }
}