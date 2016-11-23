<?php
/**
  * Twig.
  *
  * @author  Jared Howland <journals@jaredhowland.com>
  *
  * @version 2016-11-22
  *
  * @since 2016-11-22
  */

namespace Journals;

/**
  * Class to put content into a Twig template.
  *
  * @param string $template Name of Twig template to use
  * @param array $content Content to pass to template
  */
 class Twig
 {
     public function __construct($template, $content)
     {
         $configs = Config::get();
         $content = array_merge($configs, $content);

         \Twig_Autoloader::register();

         $loader = new \Twig_Loader_Filesystem('./_templates');
         if ($configs['development']) {
             $twig = new \Twig_Environment($loader, array(
                'debug' => true,
            ));
             $twig->addExtension(new \Twig_Extension_Debug());
         } else {
             $twig = new \Twig_Environment($loader, array(
                'cache' => '_cache',
            ));
         }

         // Custom function to format numbers
         $format_number = new \Twig_SimpleFunction('format_number', function ($number) {
             if (!is_null($number)) {
                 echo number_format($number);
             } else {
                 echo 'No data';
             }
         });

         $twig->addFunction($format_number);

         // Custom function to show `No data` when `null`
         $no_data = new \Twig_SimpleFunction('no_data', function ($number) {
             if (!is_null($number)) {
                 echo $number;
             } else {
                 echo 'No data';
             }
         });

         $twig->addFunction($no_data);

         // Custom function to sort when there is no data
         $sort_number = new \Twig_SimpleFunction('sort_number', function ($number) {
             $number = preg_replace('/\D/', '', $number);
             if ($number == '') {
                 echo '-';
             } else {
                 echo trim($number, '$');
             }
         });

         $twig->addFunction($sort_number);

         // Custom function to determine if a number is at, below, or above average
         $average_class = new \Twig_SimpleFunction('average_class', function ($number, $average, $above = 'good') {
             $number = preg_replace('/\D/', '', $number);
             if ($number != '') {
                 $min = $average - ($average * .15);
                 $max = $average + ($average * .15);
                 if ($number < $min) {
                     echo $above == 'good' ? 'red' : 'green';
                 } elseif ($number > $max) {
                     echo $above == 'good' ? 'green' : 'red';
                 } else {
                     echo 'yellow';
                 }
             } else {
                 return 'noData';
             }
         });

         $twig->addFunction($average_class);

         $twig->display($template, $content);
     }
 }
