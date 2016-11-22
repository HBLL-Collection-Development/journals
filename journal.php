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

$function = new Twig_SimpleFunction('format_number', function ($number) {
    if (!is_null($number)) {
        echo number_format($number);
    } else {
        echo 'No data';
    }
});

$twig->addFunction($function);

$function = new Twig_SimpleFunction('no_data', function ($number) {
    if (!is_null($number)) {
        echo $number;
    } else {
        echo 'No data';
    }
});

$twig->addFunction($function);

$titleControl = filter_var($_REQUEST['titleControl'], FILTER_SANITIZE_STRING);

$db = new Database\Database($configs['database']['host'], $configs['database']['username'], $configs['database']['password'], $configs['database']['database']);
$db->query('SELECT * FROM `journals` WHERE `titleControl` = :titleControl GROUP BY `titleControl`');
$db->bind('titleControl', $titleControl);
$journal = $db->single();
$db = null;

$twig->display('journal.tmpl', array('titleControl' => $titleControl, 'journal' => $journal));
