<?php

require_once ('AbstractController.php');

class Default_HomeController extends Default_AbstractController
{
	public function init ()
	{
		$this->_showPageBar = false;
		parent::init ();
	}
	
    public function indexAction() 
    {
    
    }
}

?>