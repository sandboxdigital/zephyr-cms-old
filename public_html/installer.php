<?php

// Define path to application directory
    
defined('ROOT_PATH')
    || define('ROOT_PATH', realpath(dirname(__FILE__).''));
    
defined('CORE_PATH')
    || define('CORE_PATH', ROOT_PATH . '/core/application');
    
defined('APPLICATION_PATH')
    || define('APPLICATION_PATH', ROOT_PATH . '/application');
    
defined('CORE_LIBRARY_PATH')
    || define('CORE_LIBRARY_PATH', CORE_PATH . '/library');

defined('LIBRARY_PATH')
    || define('LIBRARY_PATH', ROOT_PATH . '/library');
    
defined('PUBLIC_PATH')
    || define('PUBLIC_PATH', realpath(ROOT_PATH . ''));
    
defined('STORAGE_PATH')
    || define('STORAGE_PATH', realpath(APPLICATION_PATH . '/storage'));
    
// Ensure library/ is in include_path
set_include_path(implode(PATH_SEPARATOR, array(
    LIBRARY_PATH,
    CORE_LIBRARY_PATH,
    get_include_path(),
)));

/** Zend_Application */
//try {
	@include_once 'Zend/Application.php';  
	if (!class_exists ('Zend_Application'))
		die('Can\'t find Zend_Application - is Zend Framework in your path'); 
		
	@include_once 'Tg/Core.php';
	
	if (!class_exists ('Tg_Core'))
		die('Can\'t find Tg_Core - is Tg Framework in your path');

	// Auto loader
	require_once 'Zend/Loader/Autoloader.php';
	$autoLoader = Zend_Loader_Autoloader::getInstance();
	$autoLoader->registerNamespace('Tg');
	$autoLoader->registerNamespace('Tgx');

	// Session
	Zend_Session::start();



	// Registry


	// Layout
	Zend_Layout::startMvc();

	// Config

	// View
//	$view = new Tg_View();
//    $view->doctype('XHTML1_TRANSITIONAL');
//    $view->addHelperPath(APPLICATION_PATH . '/helpers');
//    $view->headMeta()->appendHttpEquiv('Content-Type', 'text/html;charset=utf-8');
//    $view->headTitle()->setSeparator(' - ');
//
//    // get our current (logged in) user
//    try {
//        $user = Tg_Auth::getAuthenticatedUser();
//
//
//        if ($user) {
//            $view->currentUser = $user;
//        }
//    } catch (Exception $e)
//    {
//    }
//
//    $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('ViewRenderer');
//    $viewRenderer->setView($view);

	$controller = Zend_Controller_Front::getInstance();
	$controller->addModuleDirectory(CORE_PATH.'/modules');
	$controller->setDefaultModule('installer');

	//--------------------------------------------------------------
	// Routes
	$router = $controller->getRouter();

	// about/about-us
	$route = new Zend_Controller_Router_Route('install',
		array('module' => 'core',
			  'controller' => 'install',
			  'action' => 'index'));
	$router->addRoute('install.php/install', $route);

	//--------------------------------------------------------------
	// dispatch
	$response = $controller->dispatch();


	echo $response;
	// display
	//$response->renderExceptions();
//
//} catch (Exception $e)
//{
//	dump ($e->getMessage());
//	dump ($e->getTraceAsString());
//	dump ('SESSION');
//	dump ($_SESSION);
//	dump ('POST');
//	dump ($_POST);
//	dump ('GET');
//	dump ($_GET);
//}