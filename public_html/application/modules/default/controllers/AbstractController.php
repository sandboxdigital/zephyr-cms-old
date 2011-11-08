<?php
class Getreading_AbstractController extends Tg_Content_Controller
{
	public function init ()
	{
		$this->_showPageBar = false;
		
		parent::init ();
		
		$this->view->templateName = "general";
	}
}

?>