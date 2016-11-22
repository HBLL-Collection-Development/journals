<?php
/**
  * Configuration.
  *
  * @author  Jared Howland <journals@jaredhowland.com>
  *
  * @version 2016-11-22
  *
  * @since 2016-11-22
  */

namespace Journals;

use Symfony\Component\Yaml\Yaml;

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
         return Yaml::parse(file_get_contents('./config.yml'));
     }
 }
