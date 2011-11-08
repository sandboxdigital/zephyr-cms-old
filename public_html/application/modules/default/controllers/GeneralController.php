<?php

require_once ('AbstractController.php');

class Getreading_GeneralController extends Getreading_AbstractController
{
	public function init ()
	{
		$this->_showPageBar = false;
		parent::init ();
	}
	
    public function indexAction() {
    }
	
    public function fangateAction() {
    }
	
    public function eventsAction() {
    }
	
    public function welcomeAction() {
    }

	public function infoAction() {
		phpinfo();
		$this->_helper->layout->disableLayout();
		$this->_helper->viewRenderer->setNoRender();
	}
}

?>