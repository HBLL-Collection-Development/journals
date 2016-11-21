<?php

require_once 'vendor/autoload.php';

use Symfony\Component\Yaml\Yaml;

$configs = Yaml::parse(file_get_contents('config.yml'));

Twig_Autoloader::register();

$loader = new Twig_Loader_Filesystem('_templates');
// $twig = new Twig_Environment($loader, array(
//     'cache' => '_cache',
// ));

$twig = new Twig_Environment($loader, array(
        'debug' => true,
));
$twig->addExtension(new Twig_Extension_Debug());

$db = new Database\Database($configs['database']['host'], $configs['database']['username'], $configs['database']['password'], $configs['database']['database']);
$db->query('SELECT DISTINCT `subAccount` FROM `journals` ORDER BY `subAccount`');
$funds = $db->resultSet(0);
$db = null;

// $twig->display('home.tmpl', array('title' => $title));
$twig->display('home.tmpl', array('funds' => $funds));
