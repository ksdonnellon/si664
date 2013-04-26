<?php
require_once "db.php";

/// Checking if the Cookie is available for this screen

if(isset($_COOKIE['ID_my_site'])) 

 { 

 	$username = $_COOKIE['ID_my_site']; 

 	$pass = $_COOKIE['Key_my_site']; 

 	 	$check = mysql_query("SELECT * FROM Loginusers WHERE username = '$username'")or die(mysql_error()); 

 	while($info = mysql_fetch_array($check)) 	 

 		{ 

 //if the cookie has the wrong password, they are taken to the login page 

 		if ($pass != $info['password']) {
 		 		header("Location: login.php"); 
 			} 

 //otherwise they are shown the admin area	 
 	else 
			{   
 //echo "<a href=logout.php>Logout</a>"; 
 			} 

 		} 

 		} 

 else 
 //if the cookie does not exist, they are taken to the login screen 
 {			 
 header("Location: login.php"); 
 } 

/// End of Cookies Checker

session_start();

if ( isset($_POST['sitename']) && isset($_POST['parcelno']) && isset($_POST['township'])  
     && isset($_POST['city']) && isset($_POST['state']) && isset($_POST['zip'])) {
   $s = mysql_real_escape_string($_POST['sitename']);
   $p = mysql_real_escape_string($_POST['parcelno']);
   $ad = mysql_real_escape_string ($_POST['township']);
   $c = mysql_real_escape_string ($_POST['city']);
   $st = mysql_real_escape_string ($_POST['state']);
   $z = mysql_real_escape_string ($_POST['zip']); 
   header("Location:searchresults.php?zip=$z") ;
   return;
}   
?>
<html>
  <head>
    <title>HRWC | Search </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet" media="screen">
  </head> 
<body>
<div class="row-fluid">
    <div class="span12 headerbg"> 
        <div class="row-fluid">
            <div class="span7">
                <img src="img/logo.png">
            </div>
            <div class="span5">
                <div class="navbar">
                    <div class="navbar-inner"> 
                        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </a>
                <div class="nav-collapse">
          <ul class="nav">
            <li class="active"><a href="addsite.php">Search</a></li>
            <li><a href="addsite.php">Add New Site</a></li>
            <li><a href="logout.php">Logout</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div>
    </div><!-- /navbar-inner -->
  </div><!-- /navbar -->
            </div>
                </div>
            </div>
        </div>
        </div>
    </div>
<ul class="breadcrumb">
<!--Should Home be login page? -->
        <li>Home<span class="divider">/</span></li>
        <li class="active">Search</li>
      </ul>
    </div>
<div class="row">
<h3>Search</h3>
    <form class="form-horizontal well" method="post">
    <fieldset>
        <legend>Search</legend>
<p>Site Name:
<input type="text" class="input-xlarge" name="sitename"></p>
<p>Parcel Number:
<input type="text" class="input-xlarge" name="parcelno"></p>
<p>Township:
<input type="text" class="input-xlarge" name="township"></p>
<p>City:
<input type="text" class="input-xlarge" name="city"></p>
<p>State:
<input type="text" class="input-xlarge" name="state"></p>
<p>Zip:
<input type="text" class="input-xlarge" name="zip"></p>
<p><button type="submit" input type="submit" class="btn btn-primary" value="Save">Search</button>
<a href="advancedsearch.php">Advanced Search</a></p>
</fieldset>
</form>
</div>
</body>
</html>
