<?php
/**
  * Twig.
  *
  * @author  Jared Howland <journals@jaredhowland.com>
  *
  * @version 2023-04-14
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

         $loader = new \Twig\Loader\FilesystemLoader('./_templates');
         if ($configs['development']) {
              $twig = new \Twig\Environment($loader, ['debug' => true]);
         } else {
              $twig = new \Twig\Environment($loader, ['cache' => '_cache']);
         }

         // Custom function to format numbers
         $format_number = new \Twig\TwigFunction('format_number', function ($number) {
             if (!is_null($number)) {
                 echo number_format($number);
             } else {
                 echo 'No data';
             }
         });

         $twig->addFunction($format_number);

         // Custom function to show `No data` when `null`
         $no_data = new \Twig\TwigFunction('no_data', function ($number) {
             if (!is_null($number)) {
                 echo $number;
             } else {
                 echo 'No data';
             }
         });

         $twig->addFunction($no_data);

         // Custom function to sort when there is no data
         $sort_number = new \Twig\TwigFunction('sort_number', function ($number) {
             $number = str_replace(',', '', trim(trim($number), '$'));
             $number = filter_var($number, FILTER_VALIDATE_FLOAT);
             if ($number == '') {
                 echo '-';
             } else {
                 echo $number;
             }
         });

         $twig->addFunction($sort_number);

         // Custom function to identify type of accounts
         $account_type = new \Twig\TwigFunction('account_type', function ($account) {
             $account = substr($account, 0, 12);
             if ($account == '113900141640') {
                 echo 'Print asset';
             } elseif ($account == '113900151640') {
                 echo 'Online asset';
             } elseif ($account == '113900156251') {
                 echo 'Online expense';
             }
         });

         $twig->addFunction($account_type);

         // Custom function to determine if a number is at, below, or above average
         $average_class = new \Twig\TwigFunction('average_class', function ($number, $average, $above = 'good') {
             $number = str_replace(',', '', trim(trim($number), '$'));
             $number = filter_var($number, FILTER_VALIDATE_FLOAT);
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
