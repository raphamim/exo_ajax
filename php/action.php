<?php
$array1 = array('un', 'deux');
$string1 = 'un deux';

$array2 = explode(' ', $string1);

print_r($array2);

if(in_array(array('un', 'deux'), $array2)){
    echo 'ok';
}