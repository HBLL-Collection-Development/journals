<?php
/**
  * Configuration.
  *
  * @author  Jared Howland <journals@jaredhowland.com>
  *
  * @version 2016-11-22
  *
  * @since 2023-04-14
  */

namespace Journals;

use Symfony\Component\Yaml\Yaml;

ini_set('display_errors', 0);

/**
  * Class to put content into a Twig template.
  *
  * @param string $template Name of Twig template to use
  * @param array $content Content to pass to template
  */
 class Config
 {
     public static function get()
     {
         return Yaml::parse(file_get_contents('../../configs/journals/config.yml'));
     }
 }
