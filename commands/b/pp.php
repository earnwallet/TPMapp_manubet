<?php
//print_r($argv);
$res = json_decode($argv[1]);
print_r($res);
echo "\nPayout : ".($res->win/100000000);
echo "\nBalance: ".($res->balance/100000000)."\n";
