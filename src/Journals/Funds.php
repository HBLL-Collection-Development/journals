<?php
/**
  * Class for library budget fund codes.
  *
  * @author  Jared Howland <journals@jaredhowland.com>
  *
  * @version 2016-11-22
  *
  * @since 2016-11-22
  */

namespace Journals;

/**
  * Class to get information about library budget fund codes.
  *
  * @param string $template Name of Twig template to use
  * @param array $content Content to pass to template
  */
 class Funds
 {
     private $response;
     private $fundCodeKeys;

     public function __construct()
     {
         $file = Config::get();
         $response = json_decode(file_get_contents($file['budgetEndpoint']), true);
         $this->response = $response['response'];
         $this->fundCodeKeys = array_column($this->response, 'fund_code');
     }

     public function getLibrarians($fundCode, $separator = ' and ')
     {
         $key = array_search($fundCode, $this->fundCodeKeys);
         $librarians = null;
         $i = 0;
         foreach ($this->response[$key]['librarians'] as $librarian) {
             if ($i > 0) {
                 $librarians .= $separator;
             }
             ++$i;
             $librarians .= $librarian['first_name'].' '.$librarian['last_name'];
         }

         return $librarians;
     }

     public function getFundName($fundCode)
     {
         $key = array_search($fundCode, $this->fundCodeKeys);

         return $this->response[$key]['fund_name'];
     }
 }
