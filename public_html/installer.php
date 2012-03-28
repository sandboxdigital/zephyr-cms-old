<?php

// Application directory
define('PATH_ROOT', realpath(dirname(__FILE__).''));

// Directory containing Zend library
define('PATH_LIBRARY', PATH_ROOT . '/library');

// Zephyr core directory
define('PATH_CORE', PATH_ROOT . '/core');

set_include_path(implode(PATH_SEPARATOR, array(
    PATH_LIBRARY,                   // Zend Framework
    PATH_CORE.'/application/library',           // Zephyr Framework
    get_include_path(),
)));

@include_once 'Zend/Application.php';
if (!class_exists ('Zend_Application'))
    die('Can\'t find Zend_Application - is Zend Framework in your path');

@include_once 'Zeph/Core.php';
if (!class_exists ('Zeph_Core'))
    die('Can\'t find Zeph_Core - is Zephyr Core in your path');

// Zephyr core
$core = Zeph_Core::getInstance ();

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

// MVC

$controller = Zend_Controller_Front::getInstance();
$controller->addModuleDirectory(Zeph_Config::getPath('%PATH_CORE_APPLICATION%/modules'));
$controller->setDefaultModule('installer');
$controller->dispatch();