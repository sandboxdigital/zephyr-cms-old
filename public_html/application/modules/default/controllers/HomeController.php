<?php

require_once ('AbstractController.php');

class Getreading_HomeController extends Getreading_AbstractController
{
	public function init ()
	{
		$this->_showPageBar = false;
		parent::init ();
	}
	
    public function indexAction() 
    {
    	
		
//		$twitter = new Zend_Service_Twitter (array(
//		    'username' => 'tgarrood',
//		    'accessToken' => 'LqapsQsAR5Z2nnU7mEO6yA'
//		));
//		$response   = $twitter->statusUserTimeline(array('screen_name'=>'buildabetternsw','include_rts'=>'true'));
//
//		$this->view->twitter = $response;
    }

	public function infoAction() {
		phpinfo();
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
	}
}

?>