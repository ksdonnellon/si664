<?php
//changed password to YES
$db = mysql_connect("localhost","admin", "YES")
   or die('Fail message');
mysql_select_db("hrwc") or die("Fail message");
?>