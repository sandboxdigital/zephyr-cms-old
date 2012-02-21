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

//echo STORAGE_PATH;die;
    
// Ensure library/ is in include_path
set_include_path(implode(PATH_SEPARATOR, array(
    LIBRARY_PATH,
    CORE_LIBRARY_PATH,
    get_include_path(),
)));

/** Zend_Application */
try {
	@include_once 'Zend/Application.php';  
	if (!class_exists ('Zend_Application'))
		die('Can\'t find Zend_Application - is Zend Framework in your path'); 
		
	@include_once 'Tg/Core.php';
	
	if (!class_exists ('Tg_Core'))
		die('Can\'t find Tg_Core - is Tg Framework in your path'); 
	
	$start = microtime();

	// Create application, bootstrap, and run
	$application = new Zend_Application(
		    'host_'.$_SERVER['SERVER_NAME'],
		    APPLICATION_PATH . '/config/application.ini'
		);

	$application->bootstrap()
		->run();        
} catch (Exception $e)
{
	dump ($e->getMessage());
	dump ($e->getTraceAsString());
	dump ('SESSION');
	dump ($_SESSION);
	dump ('POST');
	dump ($_POST);
	dump ('GET');
	dump ($_GET);
}
            
$end = microtime();