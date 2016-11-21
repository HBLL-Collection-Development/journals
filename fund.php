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

$fund = filter_var($_REQUEST['fund'], FILTER_SANITIZE_STRING);

$db = new Database\Database($configs['database']['host'], $configs['database']['username'], $configs['database']['password'], $configs['database']['database']);
$db->query('SELECT * FROM `journals` WHERE `subAccount` = '.$fund.' GROUP BY `titleControl` ORDER BY `sfxSortableTitle`');
$journals = $db->resultSet(0);
$db = null;

$twig->display('fund.tmpl', array('fund' => $fund, 'journals' => $journals));
